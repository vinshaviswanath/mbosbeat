// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/service/location_services.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showStartTripDialog(BuildContext context, {required int companyId}) {
  CustomDialog.showBottomCustomDialog(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: StartTripForm(companyId: companyId),
    ),
  );
}

class StartTripForm extends StatefulWidget {
  final int companyId;

  const StartTripForm({super.key, required this.companyId});

  @override
  State<StartTripForm> createState() => _StartTripFormState();
}

class _StartTripFormState extends State<StartTripForm> {
  final _formKey = GlobalKey<FormState>();
  final appDb = sl<AppDb>();

  GodownRoute? selectedRoute;
  GodownVehicle? selectedVehicle;

  static const kLastRouteId = 'last_route_id';
  static const kLastVehicleId = 'last_vehicle_id';
  static const kLastRouteName = 'last_route_name';

  int? _lastRouteId;
  int? _lastVehicleId;

  @override
  void initState() {
    super.initState();
    _loadLastSelection();
  }

  Future<void> _loadLastSelection() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastRouteId = prefs.getInt(kLastRouteId);
      _lastVehicleId = prefs.getInt(kLastVehicleId);
    });
  }

  Future<void> _saveLastSelection(
    int routeId,
    int vehicleId,
    String routeName,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(kLastRouteId, routeId);
    await prefs.setInt(kLastVehicleId, vehicleId);
    await prefs.setString(kLastRouteName, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Start Trip",
              style: context.textStyle.s18.dustyBlue.roboto,
            ),
          ),

          const SizedBox(height: 12),

          /// ---------- ROUTE ----------
          Text("Select Route", style: context.textStyle.s14.dustyBlue.roboto),

          StreamBuilder<List<GodownRoute>>(
            stream: appDb.routeDao.watchActiveRoutesByCompany(widget.companyId),
            builder: (_, snapshot) {
              final routes = snapshot.data ?? [];

              selectedRoute ??= routes
                  .where((r) => r.id == _lastRouteId)
                  .cast<GodownRoute?>()
                  .firstWhere((e) => e != null, orElse: () => null);

              return DropdownButtonFormField<GodownRoute>(
                initialValue: selectedRoute,
                hint: Text(
                  "Select route",
                  style: context.textStyle.s14.silverGray,
                ),
                items: routes
                    .map(
                      (r) => DropdownMenuItem(
                        value: r,
                        child: Text(r.routeName ?? ''),
                      ),
                    )
                    .toList(),
                onChanged: (v) async {
                  setState(() => selectedRoute = v);
                  final prefs = sl<SharedPreferences>();
                  await prefs.setString(
                    kLastRouteName,
                    selectedRoute?.routeName ?? "",
                  );
                },
                validator: (v) => v == null ? 'Please select a route' : null,
                decoration: _dropdownDecoration(),
              );
            },
          ),

          const SizedBox(height: 10),

          /// ---------- VEHICLE ----------
          Text("Select Vehicle", style: context.textStyle.s14.dustyBlue.roboto),

          StreamBuilder<List<GodownVehicle>>(
            stream: appDb.godownVehicleDao.watchActiveVehiclesByCompany(
              widget.companyId,
            ),
            builder: (_, snapshot) {
              final vehicles = snapshot.data ?? [];

              selectedVehicle ??= vehicles
                  .where((v) => v.id == _lastVehicleId)
                  .cast<GodownVehicle?>()
                  .firstWhere((e) => e != null, orElse: () => null);

              return DropdownButtonFormField<GodownVehicle>(
                initialValue: selectedVehicle,
                hint: Text(
                  "Select vehicle",
                  style: context.textStyle.s14.silverGray,
                ),
                items: vehicles
                    .map(
                      (v) =>
                          DropdownMenuItem(value: v, child: Text(v.name ?? '')),
                    )
                    .toList(),
                onChanged: (v) => setState(() => selectedVehicle = v),
                validator: (v) => v == null ? 'Please select a vehicle' : null,
                decoration: _dropdownDecoration(),
              );
            },
          ),

          const SizedBox(height: 16),

          /// ---------- ACTIONS ----------
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  isborderEnable: false,
                  buttonText: "Start",
                  borderRadius: BorderRadius.circular(12),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  onTap: _onStartTrip,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                  isborderEnable: false,
                  buttonText: "Cancel",
                  borderRadius: BorderRadius.circular(12),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onStartTrip() async {
    if (!_formKey.currentState!.validate()) return;

    final userProvider = context.read<UserProvider>();
    final locationService = sl<LocationService>();
    final navigator = Navigator.of(context, rootNavigator: true);
    final messenger = ScaffoldMessenger.of(navigator.context);

    userProvider.setLoading(true);

    // ✅ POP IMMEDIATELY
    navigator.pop();

    final position = await locationService.getCurrentLocation();
    final address = await locationService.getNormalAddress(
      position.latitude,
      position.longitude,
    );

    final now = DateTime.now();
    final startTime = now.toIso8601String().split('.').first;

    final success = await userProvider.markTripStart(
      date: now,
      startTime: startTime,
      routeID: selectedRoute!.id!,
      godownID: selectedVehicle!.id,
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      address: address,
    );

    userProvider.setLoading(false);


  }
}

InputDecoration _dropdownDecoration() {
  return InputDecoration(
    filled: true,
    fillColor: ColorResources.lightGray,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    errorStyle: const TextStyle(color: ColorResources.roseRed),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: ColorResources.transparent),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: ColorResources.roseRed),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: ColorResources.roseRed),
    ),
  );
}

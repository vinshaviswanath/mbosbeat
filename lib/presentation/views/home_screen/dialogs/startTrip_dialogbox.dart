import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/diamentions.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showStartTripDialog(
  BuildContext context, {
  required int companyId,
 required Function(String routeName) onTap,
// required VoidCallback onTap,


}) async {
  final appDb = sl<AppDb>();
  final _formKey = GlobalKey<FormState>();
  const kLastRouteId = 'last_route_id';
  const kLastVehicleId = 'last_vehicle_id';
  const kLastRouteName = 'last_route_name';
  


  Future<void> saveLastSelection(int routeId, int vehicleId,String routeName,) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(kLastRouteId, routeId);
    await prefs.setInt(kLastVehicleId, vehicleId);
    await prefs.setString(kLastRouteName, routeName);

  }

  Future<(int?, int?)> loadLastSelection() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getInt(kLastRouteId), prefs.getInt(kLastVehicleId));
  }

  GodownRoute? selectedRoute;
  GodownVehicle? selectedVehicle;
  // bool submitted = false;

  final (lastRouteId, lastVehicleId) = await loadLastSelection();

  CustomDialog.showBottomCustomDialog(
    child: StatefulBuilder(
      builder: (dialogContext, setState) {
        return Form(
          key: _formKey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Start Trip",
                    style: context.textStyle.s18.dustyBlue.roboto,
                  ),
                ),

                /// -------- ROUTE --------
                Text(
                  "Select Route",
                  style: context.textStyle.s14.dustyBlue.roboto,
                ),

                StreamBuilder<List<GodownRoute>>(
                  stream: appDb.routeDao.watchActiveRoutesByCompany(companyId),
                  builder: (_, snapshot) {
                    final routes = snapshot.data ?? [];

                    selectedRoute ??= routes
                        .where((r) => r.id == lastRouteId)
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
                      onChanged: (v) => setState(() => selectedRoute = v),
                      validator: (v) {
                        if (v == null) {
                          return 'Please select a route';
                        }
                        return null;
                      },
                      decoration: _dropdownDecoration(
                        // submitted && selectedRoute == null,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 10),

                /// -------- VEHICLE --------
                Text(
                  "Select Vehicle",
                  style: context.textStyle.s14.dustyBlue.roboto,
                ),

                StreamBuilder<List<GodownVehicle>>(
                  stream: appDb.godownVehicleDao.watchActiveVehiclesByCompany(
                    companyId,
                  ),
                  builder: (_, snapshot) {
                    final vehicles = snapshot.data ?? [];

                    selectedVehicle ??= vehicles
                        .where((v) => v.id == lastVehicleId)
                        .cast<GodownVehicle?>()
                        .firstWhere((e) => e != null, orElse: () => null);

                    return DropdownButtonFormField<GodownVehicle>(
                      dropdownColor: ColorResources.white,
                      borderRadius: BorderRadius.circular(10),
                      value: selectedVehicle,
                      hint: Text(
                        "Select vehicle",
                        style: context.textStyle.s14.silverGray,
                      ),
                      items: vehicles
                          .map(
                            (v) => DropdownMenuItem(
                              value: v,
                              child: Text(v.name ?? ''),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => selectedVehicle = v),
                      validator: (v) {
                        if (v == null) {
                          return 'Please select a vehicle';
                        }
                        return null;
                      },
                      decoration: _dropdownDecoration(
                        // submitted && selectedVehicle == null,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 15),

                /// -------- ACTIONS --------
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        borderRadius: BorderRadius.circular(12),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        isborderEnable: false,
                        buttonText: 'Start',
                        onTap: () async {
                          final isValid =
                              _formKey.currentState?.validate() ?? false;

                          if (!isValid) return;

                          await saveLastSelection(
                            selectedRoute!.id!,
                            selectedVehicle!.id,
                            selectedRoute!.routeName ?? '',
                          );

                          debugPrint(
                            "Trip Started → ${selectedRoute!.routeName} / ${selectedVehicle!.name}",
                          );

                          onTap(selectedRoute!.routeName ?? '');
                          // onTap();
                          WidgetsBinding.instance.addPostFrameCallback((
                            timeStamp,
                          ) {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                    w10,
                    Expanded(
                      child: CustomButton(
                        buttonText: "Cancel",
                        borderRadius: BorderRadius.circular(12),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        isborderEnable: false,
                        onTap: () => context.pop(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
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

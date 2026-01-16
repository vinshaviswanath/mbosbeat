// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/service/location_services.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showEndTripDialog(
  BuildContext context, {
  required Future<void> Function() onTap,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return EndTripDialog();
    },
  );
}

class EndTripDialog extends StatelessWidget {
  const EndTripDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      contentPadding: const EdgeInsets.all(16.0),
      title: Center(
        child: Text(
          'End Trip',
          style: context.textStyle.s16.roboto.bold.indigoBlue,
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Column(
          children: [
            Text(
              'Are you sure to want to end the trip?',
              style: context.textStyle.s14.roboto.bold.dustyBlue,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _handleTripEnd(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorResources.indigoBlue,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: context.textStyle.s14.roboto.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorResources.indigoBlue,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: context.textStyle.s14.roboto.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleTripEnd(BuildContext context) async {
    final userProvider = context.read<UserProvider>();
    final locationService = sl<LocationService>();
    final navigator = Navigator.of(context, rootNavigator: true);
    final messenger = ScaffoldMessenger.of(navigator.context);

    // Capture SharedPreferences values early
    final prefs = await SharedPreferences.getInstance();
    final tripId = prefs.getInt('current_trip_id');
    final routeID = prefs.getInt('last_route_id') ?? 0;
    final godownID = prefs.getInt('last_vehicle_id') ?? 0;

    if (tripId == null) {
      messenger.showSnackBar(const SnackBar(content: Text("Trip ID missing")));
      return;
    }

    userProvider.setLoading(true);

    // ✅ Close the dialog immediately
    navigator.pop();

    // Get location and address
    final position = await locationService.getCurrentLocation();
    final address = await locationService.getNormalAddress(
      position.latitude,
      position.longitude,
    );

    // Call provider method (no BuildContext)
    final success = await userProvider.markTripEnd(
      tripId: tripId,
      routeID: routeID,
      godownID: godownID,
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      address: address,
    );

    userProvider.setLoading(false);

    // if (!success) {
    //   messenger.showSnackBar(
    //     const SnackBar(content: Text("Something went wrong")),
    //   );
    // }
  }
}

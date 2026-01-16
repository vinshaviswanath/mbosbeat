import 'package:geolocator/geolocator.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/exception/location_exception.dart';
import 'package:mpos_beat/core/service/location_services.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/home_screen/dialogs/location_permission_dialog.dart';
import 'package:mpos_beat/presentation/views/home_screen/dialogs/markEndDay_dialogobox.dart';
import 'package:mpos_beat/presentation/views/home_screen/dialogs/mark_attendance.dart';

class DayToggleButton extends StatelessWidget {
  final bool started;
  const DayToggleButton({super.key, required this.started});

  Future<void> _handleAttendance(BuildContext context) async {
    final locationService = sl<LocationService>();
    final userProvider = context.read<UserProvider>();

    userProvider.setLoading(true);

    try {
      final position = await locationService.getCurrentLocation();
      final address = await locationService.getNormalAddress(
        position.latitude,
        position.longitude,
      );

      final attendanceType = userProvider.isAttendanceMarked
          ? AttendanceMark.end
          : AttendanceMark.start;

      await userProvider.markAttendance(
        context: context,
        attendanceType: attendanceType,
        lattitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
        address: address,
      );
    } on AppLocationServiceDisabledException {
      await showLocationPermissionDialog(
        context,
        title: "Location Required",
        message:
            "Location services are turned off. Please enable location to mark attendance.",
        onConfirm: () => Geolocator.openLocationSettings(),
      );
    } on AppLocationPermissionDeniedException {
      await showLocationPermissionDialog(
        context,
        title: "Permission Required",
        message:
            "Location permission is required to mark attendance. Please allow access.",
        onConfirm: () => Geolocator.requestPermission(),
      );
    } on AppLocationPermissionForeverDeniedException {
      await showLocationPermissionDialog(
        context,
        title: "Permission Permanently Denied",
        message:
            "Location permission is permanently denied. Please enable it from app settings.",
        onConfirm: () => Geolocator.openAppSettings(),
      );
    } catch (e, s) {
      debugPrint("Attendance error: $e");
      debugPrintStack(stackTrace: s);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Unable to mark attendance. Please try again."),
          ),
        );
      }
    } finally {
      if (context.mounted) {
        userProvider.setLoading(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final userProvider = context.read<UserProvider>();

        if (userProvider.isAttendanceMarked) {
          showMarkEndDayDialog(
            context,
            onConfirm: () async {
              await _handleAttendance(context);
            },
          );
        } else {
          showAttendanceConfirmationDialog(
            context,
            onConfirm: () async {
              await _handleAttendance(context);
            },
          );
        }
      },
      child: Container(
        width: 40,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: started ? ColorResources.roseRed : Colors.transparent,
          border: Border.all(
            color: started ? ColorResources.roseRed : ColorResources.mintGreen,
          ),
        ),
        child: Text(
          started ? "   End" : "  Start",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: started ? ColorResources.white : ColorResources.mintGreen,
          ),
        ),
      ),
    );
  }
}
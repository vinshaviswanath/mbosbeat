import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/home_screen/dialogs/endTrip_dialogbox.dart';
import 'package:mpos_beat/presentation/views/home_screen/dialogs/startTrip_dialogbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteToggleButton extends StatelessWidget {
  final bool started;
  final int companyId;

  const RouteToggleButton({
    super.key,
    required this.started,
    required this.companyId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final prefs = sl<SharedPreferences>();
        final _isAttendanceMarked =
            prefs.getBool("attendance_started") ?? false;
        if (_isAttendanceMarked) {
          if (!started) {
            showStartTripDialog(context, companyId: companyId);
          } else {
            showEndTripDialog(context, onTap: () async {});
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Forgot to mark attendance?"),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
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

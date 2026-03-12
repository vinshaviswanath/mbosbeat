import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/service/location_services.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';

void showAttendanceConfirmationDialog(
  BuildContext context, {
  required VoidCallback onConfirm,
}) {
  CustomDialog.showBottomCustomDialog(
    child: StatefulBuilder(
      builder: (dialogContext, setState) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Attendance", style: context.textStyle.s14.w500.indigoBlue),
              h16,
              Text(
                "Are you sure you want to start Day?",
                textAlign: TextAlign.center,
                style: context.textStyle.s12.w500.dustyBlue,
              ),
              h20,

              /// -------- ACTIONS --------
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(12),
                      buttonText: "Confirm",
                      isborderEnable: false,
                      onTap: () {
                        onConfirm();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  w10,
                  Expanded(
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(12),
                      buttonText: "Cancel",
                      isborderEnable: false,
                      color: ColorResources.bluishGray,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              h10,
            ],
          ),
        );
      },
    ),
  );
}

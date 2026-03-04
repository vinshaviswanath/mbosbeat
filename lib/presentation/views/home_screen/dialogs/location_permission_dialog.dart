import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';

Future<void> showLocationPermissionDialog(
  BuildContext context, {
  required String title,
  required String message,
  required VoidCallback onConfirm,
}) {
  return CustomDialog.showBottomCustomDialog(
    child: StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: context.textStyle.s14.w500.indigoBlue),
            h16,
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textStyle.s12.w500.dustyBlue,
            ),
            h16,
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
          ],
        );
      },
    ),
  );

  //  showDialog(
  //   context: context,
  //   barrierDismissible: false,
  //   builder: (_) => AlertDialog(
  //     title: Text(title),
  //     content: Text(message),
  //     actions: [
  //       TextButton(
  //         onPressed: () => Navigator.pop(context),
  //         child: const Text("Cancel"),
  //       ),
  //       ElevatedButton(
  //         onPressed: () {
  //           Navigator.pop(context);
  //           onConfirm();
  //         },
  //         child: const Text("Enable"),
  //       ),
  //     ],
  //   ),
  // );
}

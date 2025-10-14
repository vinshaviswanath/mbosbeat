import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/imports.dart';

// class DeleteVehicleWidget extends StatelessWidget {
//   final VoidCallback onDelete;

//   const DeleteVehicleWidget({super.key, required this.onDelete});

//   @override
//   Widget build(BuildContext context) {
//     final appLoaclizations = context.l10n;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           appLoaclizations.delete_vehicle_widget_delete_vehicle,
//           style: context.textStyle.s14.w500.indigoBlue,
//         ),
//         h10,
//         Text(
//           appLoaclizations.delete_vehicle_widget_are_you_sure,
//           style: context.textStyle.s12.w500.dustyBlue.roboto,
//         ),
//         h24,
//         Row(
//           children: [
//             Expanded(
//               child: CustomButton(
//                 onTap: () {
//                   Navigator.pop(context);
//                   onDelete();
//                   AppDetails.rootScaffoldMessengerKey.currentState?.showSnackBar(
//                     SnackBar(
//                       content: Text(
//                         appLoaclizations
//                             .delete_vehicle_widget_vehicle_removed,
//                         textAlign: TextAlign.center,
//                         style: context.textStyle.s12.w500.white.roboto,
//                       ),
//                       backgroundColor: ColorResources.black.withValues(
//                         alpha: 0.6,
//                       ),
//                       behavior: SnackBarBehavior.floating,
//                       margin: const EdgeInsets.all(16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   );
//                 },
//                 buttonText:
//                     appLoaclizations.delete_user_designation_widget_delete,
//                 textStyle: context.textStyle.s12.w500.white.roboto,
//                 isborderEnable: false,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//             ),
//             w10,
//             Expanded(
//               child: CustomButton(
//                 onTap: () => Navigator.pop(context),
//                 buttonText: appLoaclizations.cancel,
//                 textStyle: context.textStyle.s12.w500.white.roboto,
//                 color: ColorResources.bluishGray,
//                 isborderEnable: false,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//             ),
//           ],
//         ),
//         h10,
//       ],
//     );
//   }
// }

class DeleteWidget extends StatelessWidget {
  final VoidCallback onDelete;
  final String headingText;
  final String subHeading;
  final String snackBarMessage;
  const DeleteWidget({super.key, required this.onDelete, required this.headingText, required this.subHeading, required this.snackBarMessage});

  @override
  Widget build(BuildContext context) {
    final appLoaclizations = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          headingText,
          style: context.textStyle.s14.w500.indigoBlue,
        ),
        h10,
        Text(
          subHeading,
          style: context.textStyle.s12.w500.dustyBlue.roboto,
        ),
        h24,
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onTap: () {
                  Navigator.pop(context);
                  onDelete();
                  AppDetails.rootScaffoldMessengerKey.currentState
                      ?.showSnackBar(
                        SnackBar(
                          content: Text(
                            snackBarMessage,
                            textAlign: TextAlign.center,
                            style: context.textStyle.s12.w500.white.roboto,
                          ),
                          backgroundColor: ColorResources.black.withValues(
                            alpha: 0.6,
                          ),
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                },
                buttonText:
                    appLoaclizations.delete_user_designation_widget_delete,
                textStyle: context.textStyle.s12.w500.white.roboto,
                isborderEnable: false,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            w10,
            Expanded(
              child: CustomButton(
                onTap: () => Navigator.pop(context),
                buttonText: appLoaclizations.cancel,
                textStyle: context.textStyle.s12.w500.white.roboto,
                color: ColorResources.bluishGray,
                isborderEnable: false,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ),
        h10,
      ],
    );
  }
}

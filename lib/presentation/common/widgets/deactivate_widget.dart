import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/imports.dart';

// class DeactivateVehicleWidget extends StatelessWidget {
//   final VoidCallback onDeactivate;

//   const DeactivateVehicleWidget({super.key, required this.onDeactivate});

//   @override
//   Widget build(BuildContext context) {
//     final appLocalizations = context.l10n;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           appLocalizations.deactivate_vehicle_widget_deactivate_vehicle,
//           style: context.textStyle.s14.w500.indigoBlue,
//         ),
//         h10,
//         Text(
//           appLocalizations.deactivate_vehicle_widget_are_you_sure,
//           style: context.textStyle.s12.w500.dustyBlue.roboto,
//         ),
//         h24,
//         Row(
//           children: [
//             Expanded(
//               child: CustomButton(
//                 onTap: () {
//                   Navigator.pop(context);
//                   onDeactivate();
//                   AppDetails.rootScaffoldMessengerKey.currentState
//                       ?.showSnackBar(
//                         SnackBar(
//                           content: Text(
//                             appLocalizations
//                                 .deactivate_vehicle_widget_vehicle_deactivated,
//                             textAlign: TextAlign.center,
//                             style: context.textStyle.s12.w500.white.roboto,
//                           ),
//                           backgroundColor: ColorResources.black.withValues(
//                             alpha: 0.6,
//                           ),
//                           behavior: SnackBarBehavior.floating,
//                           margin: const EdgeInsets.all(16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       );
//                 },
//                 buttonText: appLocalizations
//                     .deactivate_user_designation_widget_deactivate,
//                 textStyle: context.textStyle.s12.w500.white.roboto,
//                 isborderEnable: false,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//             ),
//             w10,
//             Expanded(
//               child: CustomButton(
//                 onTap: () => Navigator.pop(context),
//                 buttonText: appLocalizations.cancel,
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

class DeactivateWidget extends StatelessWidget {
  final VoidCallback onDeactivate;
  final String headingText;
  final String subHeading;
  final String snackBarMessage;

  const DeactivateWidget({
    super.key,
    required this.onDeactivate,
    required this.headingText,
    required this.subHeading,
    required this.snackBarMessage,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(headingText, style: context.textStyle.s14.w500.indigoBlue),
        h10,
        Text(subHeading, style: context.textStyle.s12.w500.dustyBlue.roboto),
        h24,
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onTap: () {
                  Navigator.pop(context);
                  onDeactivate();
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
                buttonText: appLocalizations
                    .deactivate_user_designation_widget_deactivate,
                textStyle: context.textStyle.s12.w500.white.roboto,
                isborderEnable: false,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            w10,
            Expanded(
              child: CustomButton(
                onTap: () => Navigator.pop(context),
                buttonText: appLocalizations.cancel,
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

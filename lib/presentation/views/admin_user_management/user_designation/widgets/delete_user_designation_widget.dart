import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class DeleteUserDesignationWidget extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteUserDesignationWidget({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final appLoaclizations = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          appLoaclizations.delete_user_designation_widget_delete_designation,
          style: context.textStyle.s14.w500.indigoBlue,
        ),
        h10,
        Text(
          appLoaclizations.delete_user_designation_widget_are_you_sure,
          style: context.textStyle.s12.w500.dustyBlue.roboto,
        ),
        w24,
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onTap: () {
                  Navigator.pop(context);
                  onDelete();
                  AppDetails.rootScaffoldMessengerKey.currentState?.showSnackBar(
                    SnackBar(
                      content: Text(
                        appLoaclizations
                            .delete_user_designation_widget_delete_designation,
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

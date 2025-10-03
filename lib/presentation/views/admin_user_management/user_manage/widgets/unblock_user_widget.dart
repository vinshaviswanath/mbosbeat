import 'package:mpos_beat/core/utils/imports.dart';

class UnblockUserWidget extends StatelessWidget {
  final VoidCallback onConfirm;
  const UnblockUserWidget({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          appLocalizations.unblock_user_widget_unblock_user,
          style: context.textStyle.s14.w500.indigoBlue,
        ),
        h10,
        Text(
          appLocalizations.unblock_user_widget_are_you_sure,
          style: context.textStyle.s12.w500.dustyBlue.roboto,
        ),
        h24,
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onTap: () {
                  onConfirm();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        appLocalizations
                            .unblock_user_widget_unblocked_this_user,
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
                buttonText: appLocalizations.unblock_user_widget_unblock,
                isborderEnable: false,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            w10,
            Expanded(
              child: CustomButton(
                onTap: () => Navigator.pop(context),
                buttonText: "Cancel",
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

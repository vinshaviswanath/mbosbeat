import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class BlockUserWidget extends StatelessWidget {
  final VoidCallback onBlock;

  const BlockUserWidget({super.key, required this.onBlock});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          appLocalizations.block_user_widget_block_user,
          style: context.textStyle.s14.w500.indigoBlue,
        ),
        h10,
        Text(
          appLocalizations.block_user_widget_are_you_sure,
          style: context.textStyle.s12.w500.dustyBlue.roboto,
        ),
        h24,
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onTap: () {
                  Navigator.pop(context);
                  onBlock();
                  AppDetails.rootScaffoldMessengerKey.currentState
                      ?.showSnackBar(
                        SnackBar(
                          content: Text(
                            appLocalizations.block_user_widget_you_have_blocked,
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
                textStyle: context.textStyle.s12.w500.white,
                buttonText: appLocalizations.block_user_widget_block,
                isborderEnable: false,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            w10,
            Expanded(
              child: CustomButton(
                onTap: () => Navigator.pop(context),
                buttonText: appLocalizations.cancel,
                textStyle: context.textStyle.s12.w500.white,
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

import 'package:mpos_beat/core/utils/imports.dart';

class NoUserWidget extends StatelessWidget {
  const NoUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Column(
      children: [
        const Spacer(),
        Image.asset(AppAssets.noData, height: context.getSize.height * 0.27),
        // Text(
        //   appLocalizations.no_user_widget_no_user,
        //   style: context.textStyle.s12.roboto.w400.bluishGray,
        //   textAlign: TextAlign.center,
        // ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: appLocalizations.no_user_widget_no_user_found,
            style: context.textStyle.s12.roboto.w400.bluishGray,
            children: [
              TextSpan(
                text: appLocalizations.no_user_widget_kindly_create_one,
                style: context.textStyle.s10.roboto.w400.bluishGray,
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(
            left: context.getSize.width / 3.2,
            right: context.getSize.width / 3.2,
            bottom: 90,
          ),
          child: CustomButton(
            onTap: () => context.pushNamed(AppRouterConst.userCreation),
            buttonText: appLocalizations.no_user_widget_add_user,
            isborderEnable: false,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ],
    );
  }
}

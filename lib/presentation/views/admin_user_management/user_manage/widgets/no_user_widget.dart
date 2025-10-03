import 'package:mpos_beat/core/utils/imports.dart';

class NoUserWidget extends StatelessWidget {
  const NoUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Column(
      children: [
        const Spacer(),
        Image.asset(AppAssets.logo, height: context.getSize.height * 0.14),
        h16,
        Text(
          appLocalizations.no_user_widget_no_user,
          style: context.textStyle.s12.roboto.w400.bluishGray,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(
            left: context.getSize.width / 3,
            right: context.getSize.width / 3,
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

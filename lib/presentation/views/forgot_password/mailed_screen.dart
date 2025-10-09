import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/base_box.dart';
import 'package:mpos_beat/presentation/common/widgets/base_scaffold.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';

class MailedScreen extends StatelessWidget {
  static const routeName = "mailed-screen";
  const MailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Consumer<AuthFormProvider>(
      builder: (context, provider, _) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            provider.emailController.clear();
            Navigator.pop(context);
          },
          child: BaseScaffold(
            widget: SizedBox(
              height: context.getSize.height,
              width: context.getSize.width,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    foregroundColor: ColorResources.transparent,
                    surfaceTintColor: ColorResources.transparent,
                    backgroundColor: ColorResources.transparent,
                    title: Text(
                      appLocalization.mail_sent,
                      style: context.textStyle.s22.white.bold.roboto,
                    ),
                    centerTitle: true,
                  ),
                  const SliverToBoxAdapter(child: h24),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseBox(
                          height: context.getSize.height * 0.38,
                          widgwt: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  AppAssets.mailSend,
                                  height: context.getSize.height * 0.14,
                                ),
                                h28,
                                Text(
                                  "${appLocalization.mail_sent_screen_sent_mail_to} ${provider.maskedEmail}${appLocalization.mail_sent_screen_kindly_verify}",
                                  style: context
                                      .textStyle
                                      .s12
                                      .w400
                                      .bluishGray
                                      .roboto,
                                  textAlign: TextAlign.center,
                                ),
                                h16,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: CustomButton(
                                    onTap: () =>
                                        context.pushNamed(AppRouterConst.login),
                                    buttonText: appLocalization.login,
                                    isborderEnable: false,
                                  ),
                                ),
                                h8,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/base_box.dart';
import 'package:mpos_beat/presentation/common/widgets/base_scaffold.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class MailedScreen extends StatelessWidget {
  static const routeName = "mailed-screen";
  const MailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Consumer<AuthFormProvider>(
      builder: (context, provider, _) {
        return BaseScaffold(
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
                const SliverGap(24),
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
                              gap28,
                              Text(
                                "${appLocalization.sent_mail_to} ${provider.maskedEmail}${appLocalization.kindly_verify}",
                                style: context.textStyle.s12.w400.bluishGray.roboto,
                                textAlign: TextAlign.center,
                              ),
                              gap16,
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
                              gap8,
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
        );
      },
    );
  }
}

import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/base_box.dart';
import 'package:mpos_beat/presentation/common/widgets/base_scaffold.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_appBar.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class MailedScreen extends StatelessWidget {
  static const routeName = "mailed-screen";
  const MailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthFormProvider>(
      builder: (context, provider, _) {
        return BaseScaffold(
          widget: SizedBox(
            height: context.getSize.height,
            width: context.getSize.width,
            child: CustomScrollView(
              slivers: [
                const CustomSliverAppBar(
                  showBackButton: false,
                  title: "Mail Sent",
                ),
                const SliverGap(24),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseBox(
                        widgwt: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AppAssets.mailSend,
                                  height: context.getSize.height * 0.14),
                              gap28,
                              Text(
                                "We have sent a password recovery instructions to ${provider.maskedEmail}. Kindly verify!",
                                style: context.textStyle.s12,
                                textAlign: TextAlign.center,
                                textScaler: const TextScaler.linear(0.8),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: CustomButton(
                                    onTap: () =>
                                        context.pushNamed(AppRouterConst.login),
                                    buttonText: "Login",
                                    isborderEnable: false),
                              )
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

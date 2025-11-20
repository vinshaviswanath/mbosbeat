import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/base_box.dart';
import 'package:mpos_beat/presentation/common/widgets/base_scaffold.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/views/otp/widgets/reg_failure_widget.dart';
import 'package:mpos_beat/presentation/views/otp/widgets/reg_success_widget.dart';

class CustomRouteScreen extends StatelessWidget {
  static const routeName = "registration-status-screen";
  final NavigationType status;
  const CustomRouteScreen({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        AuthDialogs.exitApp();
      },
      child: BaseScaffold(
        widget: SizedBox(
          height: context.getSize.height,
          width: context.getSize.width,
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 128)),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (status == NavigationType.success)
                      BaseBox(
                        width: context.getSize.width - 8,
                        padding: const EdgeInsets.symmetric(horizontal: 42),
                        widgwt: const RegisterSuccessWidget(),
                      ),
                    if (status == NavigationType.failed)
                      BaseBox(
                        width: context.getSize.width - 16,
                        widgwt: const RegisterFailureWidget(),
                      ),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: status == NavigationType.success
                    ? Column(
                        children: [
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: context.getSize.height * 0.08,
                              left: context.getSize.width / 3.6,
                              right: context.getSize.width / 3.6,
                            ),
                            child: CustomButton(
                              onTap: () =>
                                  // AppRoute.pushNamed(AdminHome.routeName),
                                  context.goNamed(
                                    AppRouterConst.companyCreationScreen,
                                    extra: {
                                      'tabIndex': 0,
                                      'companyData': null,
                                      'isPop': true,
                                    },
                                  ),
                              buttonText: appLocalization
                                  .custom_route_screen_create_company,
                              textStyle: context.textStyle.s16.white.bold,
                              isborderEnable: false,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

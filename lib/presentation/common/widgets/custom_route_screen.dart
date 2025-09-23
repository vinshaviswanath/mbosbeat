import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:mpos_beat/presentation/common/widgets/base_box.dart';
import 'package:mpos_beat/presentation/common/widgets/base_scaffold.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/views/otp/widgets/reg_failure_widget.dart';
import 'package:mpos_beat/presentation/views/otp/widgets/reg_success_widget.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class CustomRouteScreen extends StatelessWidget {
  static const routeName = "registration-status-screen";
  final NavigationType status;
  const CustomRouteScreen({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return BaseScaffold(
      widget: SizedBox(
        height: context.getSize.height,
        width: context.getSize.width,
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            const SliverGap(128),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (status == NavigationType.success)
                    const BaseBox(widgwt: RegisterSuccessWidget()),
                  if (status == NavigationType.failed)
                    const BaseBox(widgwt: RegisterFailureWidget()),
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
                            left: context.getSize.width / 3,
                            right: context.getSize.width / 3,
                          ),
                          child: CustomButton(
                            onTap: () =>
                                // AppRoute.pushNamed(AdminHome.routeName),
                                context.pushNamed(AppRouterConst.adminHome),
                            buttonText: appLocalization.go_home,
                            textStyle: context.textStyle.s16.white,
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
    );
  }
}

import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/admin_home_widget.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class AdminHome extends StatelessWidget {
  static const routeName = "admin-home-screen";
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final shouldExit = await AuthDialogs.show(context);
        if (shouldExit) {
          AuthDialogs.exitApp();
        }
      },
      child: Scaffold(
        backgroundColor: ColorResources.paleBlue,
        body: Stack(
          children: [
            Positioned(
              top: context.getSize.height * 0.1,
              right: -context.getSize.width * 0.15,
              child: Image.asset(AppAssets.bgVector),
            ),
            Positioned(
              bottom: -context.getSize.height * 0.09,
              left: -context.getSize.width * 0.25,
              child: Image.asset(AppAssets.bgVector),
            ),
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: context.getSize.height,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AdminHomeWidget(
                              iconData: AppAssets.user,
                              title: "Manage User",
                            ),
                            Gap(52),
                            AdminHomeWidget(
                              iconData: AppAssets.company,
                              title: "Manage Company",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: context.getSize.width / 2.3,
              child: GestureDetector(
                onTap: () => context.pushNamed(AppRouterConst.login),
                child: Container(
                  color: ColorResources.transparent,
                  height: context.getSize.height * 0.12,
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.powerButton,
                        height: 28,
                      ),
                      // CircleAvatar(
                      //   radius: 28,
                      //   backgroundColor: ColorResources.roseRed,
                      //   child: SvgPicture.asset(
                      //     AppAssets.power,
                      //     colorFilter: const ColorFilter.mode(
                      //       ColorResources.white,
                      //       BlendMode.srcIn,
                      //     ),
                      //   ),
                      // ),
                      gap4,
                      Text(
                        "Logout",
                        style: context.textStyle.s10.indigoBlue,
                      ),
                      gap16,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

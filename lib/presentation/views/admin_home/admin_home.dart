// import 'package:go_router/go_router.dart';
// import 'package:mpos_beat/core/di/injection.dart';
// import 'package:mpos_beat/core/utils/imports.dart';
// import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
// import 'package:mpos_beat/presentation/views/admin_home/widget/admin_home_widget.dart';
// import 'package:mpos_beat/route/app_router_const.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AdminHome extends StatelessWidget {
//   static const routeName = "admin-home-screen";
//   const AdminHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appLocalization = context.l10n;
//     return PopScope(
//       canPop: false,
//       onPopInvokedWithResult: (didPop, result) async {
//         if (didPop) return;

//         final shouldExit = await AuthDialogs.show(context);
//         if (shouldExit) {
//           AuthDialogs.exitApp();
//         }
//       },
//       child: Scaffold(
//         backgroundColor: ColorResources.paleBlue,
//         body: Stack(
//           children: [
//             Positioned(
//               top: context.getSize.height * 0.05,
//               right: -context.getSize.width * 0.23,
//               child: Image.asset(AppAssets.bgVector, height: 300),
//             ),
//             Positioned(
//               bottom: -context.getSize.height * 0.13,
//               left: -context.getSize.width * 0.36,
//               child: Image.asset(AppAssets.bgVector, height: 300),
//             ),
//             CustomScrollView(
//               slivers: [
//                 SliverToBoxAdapter(
//                   child: SizedBox(
//                     height: context.getSize.height,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             AdminHomeWidget(
//                               onTap: () {
//                                 context.pushNamed(
//                                   AppRouterConst.userManagement,
//                                 );
//                               },
//                               iconData: AppAssets.user,
//                               title: appLocalization.admin_home_manage_user,
//                               colors: const [
//                                 ColorResources.softViolet,
//                                 ColorResources.deepViolet,
//                               ],
//                             ),
//                             h52,
//                             AdminHomeWidget(
//                               iconData: AppAssets.company,
//                               title: appLocalization.admin_home_manage_company,
//                               colors: const [
//                                 ColorResources.softpurple,
//                                 ColorResources.irisPurple,
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               bottom: 0,
//               left: context.getSize.width / 2.3,
//               child: GestureDetector(
//                 onTap: () {
//                   final prefs = sl<SharedPreferences>();
//                   prefs.remove("token");
//                   context.pushNamed(AppRouterConst.login);
//                 },
//                 child: Container(
//                   color: ColorResources.transparent,
//                   height: context.getSize.height * 0.12,
//                   child: Column(
//                     children: [
//                       Image.asset(AppAssets.powerButton, height: 28),
//                       h4,
//                       Text(
//                         appLocalization.admin_home_log_out,
//                         style: context.textStyle.s10.indigoBlue.raleway,
//                       ),
//                       h16,
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

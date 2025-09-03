// import 'package:mpos_beat/core/utils/app_details.dart';
// import 'package:mpos_beat/core/utils/logger.dart';
// import 'package:mpos_beat/features/app_root.dart';
// import 'package:mpos_beat/features/feature_admin_dashboard/presentation/views/admin_home.dart';
// import 'package:mpos_beat/features/feature_authentication/presentation/views/forgot_password/forgot_password.dart';
// import 'package:mpos_beat/features/feature_authentication/presentation/views/forgot_password/mailed_screen.dart';
// import 'package:mpos_beat/features/feature_authentication/presentation/views/loading_screen.dart';
// import 'package:mpos_beat/features/feature_authentication/presentation/views/login/login_screen.dart';
// import 'package:mpos_beat/features/feature_authentication/presentation/views/signup/sign_up_screen.dart';
// import 'package:mpos_beat/features/feature_onboard/presentation/views/on_boarding.dart';
// import 'package:mpos_beat/features/feature_onboard/presentation/views/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

// class AppRoute {
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     Logger.logWarning(
//       'Route Name: ${settings.name},  Arguments: ${settings.arguments}, ArgumentType: ${settings.arguments.runtimeType}',
//     );
//     final arguments = (settings.arguments as Map<String, dynamic>?);

//     switch (settings.name) {
//       case AdminHome.routeName:
//         return pushRoute(settings, const AdminHome());
//       case LoadingScreen.routeName:
//         return pushRoute(settings, const LoadingScreen());
//       case MailedScreen.routeName:
//         return pushRoute(settings, const MailedScreen());
//        case ForgotPassword.routeName:
//         return pushRoute(settings, const ForgotPassword());
//       // case InvalidOtp.routeName:
//       //   return pushRoute(settings, const InvalidOtp());
//       // case BaseScaffold.routeName:
//       //   return pushRoute(settings, const BaseScaffold());
//         // case OtpAuthentication.routeName:
//         // return pushRoute(settings, const OtpAuthentication());
//       case SignUpScreen.routeName:
//         return pushRoute(settings, const SignUpScreen());
//       case LoginScreen.routeName:
//         return pushRoute(settings, const LoginScreen());
//       case OnBoardingScreen.routeName:
//         return pushRoute(settings, const OnBoardingScreen());
//       case SplashScreen.routeName:
//         return pushRoute(settings, const SplashScreen());
//       case AppRoot.routeName:
//       default:
//         return pushRoute(settings, const AppRoot());
//     }
//   }

//   // static Route<dynamic> pushRoute(RouteSettings settings, Widget screen) {
//   //   return PageRouteBuilder(
//   //     settings: settings,
//   //     pageBuilder: (context, animation, secondaryAnimation) => screen,
//   //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//   //       const begin = Offset(1.0, 0.0);
//   //       const end = Offset.zero;
//   //       const curve = Curves.easeInOut;

//   //       var tween =
//   //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//   //       var offsetAnimation = animation.drive(tween);

//   //       return SlideTransition(
//   //         position: offsetAnimation,
//   //         child: child,
//   //       );
//   //     },
//   //   );
//   // }

//     static Route<dynamic> pushRoute(RouteSettings settings, Widget screen) {
//     return PageTransition(
//       settings: settings,
//       child: screen,
//       curve: Curves.easeIn,
//       duration: const Duration(milliseconds: 400),
//       type: PageTransitionType.rightToLeft,
//     );
//   }

//  static pushNamed(String routeName, [Object? arguments]) {
//     Navigator.pushNamed(
//       AppDetails.globalNavigatorKey.currentContext!,
//       routeName,
//       arguments: arguments,
//     );
//   }
// }

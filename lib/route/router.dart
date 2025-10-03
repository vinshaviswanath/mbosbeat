import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_route_screen.dart';
import 'package:mpos_beat/presentation/common/widgets/loading_screen.dart';
import 'package:mpos_beat/presentation/views/add_company/add_company_screen.dart';
import 'package:mpos_beat/presentation/views/admin_home/admin_home.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_create/user_creation_screen.dart';
import 'package:mpos_beat/presentation/views/forgot_password/forgot_password.dart';
import 'package:mpos_beat/presentation/views/forgot_password/mailed_screen.dart';
import 'package:mpos_beat/presentation/views/login/login_screen.dart';
import 'package:mpos_beat/presentation/views/on_boarding/on_boarding.dart';
import 'package:mpos_beat/presentation/views/otp/invalid_otp.dart';
import 'package:mpos_beat/presentation/views/otp/otp_authentication.dart';
import 'package:mpos_beat/presentation/views/reset_password/reset_password_screen.dart';
import 'package:mpos_beat/presentation/views/signup/sign_up_screen.dart';
import 'package:mpos_beat/presentation/views/splash_screen/splash_screen.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/manage_user_screen.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/user_designation_screen.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_management/user_management.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/user_settings_screen.dart';
import 'package:mpos_beat/route/app_navigation_observer.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class AppRouter {
  static final router = GoRouter(
    observers: [AppNavigationObserver()],
    navigatorKey: AppDetails.globalNavigatorKey,
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: AppRouterConst.splashScreen,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: "/onboard",
        name: AppRouterConst.onboardScreen,
        builder: (context, state) {
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: "/login",
        name: AppRouterConst.login,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: "/signup",
        name: AppRouterConst.signup,
        builder: (context, state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: "/otpAuth",
        name: AppRouterConst.otpAuth,
        builder: (context, state) {
          return const OtpAuthentication();
        },
      ),
      GoRoute(
        path: "/invalidOtp",
        name: AppRouterConst.invalidOtp,
        builder: (context, state) {
          return const InvalidOtp();
        },
      ),
      GoRoute(
        path: "/customRouteScreen",
        name: AppRouterConst.customRouteScreen,
        builder: (context, state) {
          final status = state.extra as NavigationType;
          return CustomRouteScreen(status: status);
        },
      ),
      GoRoute(
        path: "/adminHome",
        name: AppRouterConst.adminHome,
        builder: (context, state) {
          return const AdminHome();
        },
      ),
      GoRoute(
        path: "/forgotPassword",
        name: AppRouterConst.forgotPassword,
        builder: (context, state) {
          return const ForgotPassword();
        },
      ),
      GoRoute(
        path: "/mailedScreen",
        name: AppRouterConst.mailedScreen,
        builder: (context, state) {
          return const MailedScreen();
        },
      ),
      GoRoute(
        path: "/loadingScreen",
        name: AppRouterConst.loadingScreen,
        builder: (context, state) {
          return const LoadingScreen();
        },
      ),
      GoRoute(
        path: "/userManagement",
        name: AppRouterConst.userManagement,
        builder: (context, state) {
          return const UserManagement();
        },
      ),
      GoRoute(
        path: "/manageUser",
        name: AppRouterConst.manageUser,
        builder: (context, state) {
          return const ManageUserScreen();
        },
      ),
      GoRoute(
        path: "/userCreation",
        name: AppRouterConst.userCreation,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          final isEdit = extra["isEdit"] as bool? ?? false;
          final user = extra["user"] as UserModel?;

          return UserCreationScreen(isUpdate: isEdit, user: user);
        },
      ),

      GoRoute(
        path: "/resetPassword",
        name: AppRouterConst.resetPassword,
        builder: (context, state) {
          return const ResetPasswordScreen();
        },
      ),
      GoRoute(
        path: "/userSettings",
        name: AppRouterConst.userSettings,
        builder: (context, state) {
          return const UserSettingsScreen();
        },
      ),
      GoRoute(
        path: "/addCompany",
        name: AppRouterConst.addCompany,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final name = extra["name"] as String;
          final companyName = extra["companyName"] as String;
          return AddCompanyScreen(name: name, companyName: companyName);
        },
      ),
      GoRoute(
        path: "/userDesignation",
        name: AppRouterConst.userDesignation,
        builder: (context, state) {
          return const UserDesignationScreen();
        },
      ),
    ],
  );
}

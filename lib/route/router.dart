import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_route_screen.dart';
import 'package:mpos_beat/presentation/common/widgets/loading_screen.dart';
import 'package:mpos_beat/presentation/views/admin_home/admin_home.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/customer_transactions.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/transaction_detail_page/transaction_detail_page.dart';
import 'package:mpos_beat/presentation/views/forgot_password/forgot_password.dart';
import 'package:mpos_beat/presentation/views/forgot_password/mailed_screen.dart';
import 'package:mpos_beat/presentation/views/home_screen/home_screen.dart';
import 'package:mpos_beat/presentation/views/login/login_screen.dart';
import 'package:mpos_beat/presentation/views/on_boarding/on_boarding.dart';
import 'package:mpos_beat/presentation/views/other_transactions_screen/add%20_items.dart';
import 'package:mpos_beat/presentation/views/other_transactions_screen/expense_entry_screen.dart';
import 'package:mpos_beat/presentation/views/other_transactions_screen/other_transactions_screen.dart';
import 'package:mpos_beat/presentation/views/other_transactions_screen/stock_journal_screen.dart';
import 'package:mpos_beat/presentation/views/other_transactions_screen/stock_receive_screen.dart';
import 'package:mpos_beat/presentation/views/otp/invalid_otp.dart';
import 'package:mpos_beat/presentation/views/otp/otp_authentication.dart';
import 'package:mpos_beat/presentation/views/signup/sign_up_screen.dart';
import 'package:mpos_beat/presentation/views/splash_screen/splash_screen.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class AppRouter {
  static final router = GoRouter(
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
        path: "/homescreen",
        name: AppRouterConst.homeScreen,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: "/othertransactions",
        name: AppRouterConst.otherTransaction,
        builder: (context, state) {
          return OtherTransOptionsScreen();
        },
      ),
      GoRoute(
        path: "/stockjournalscreen",
        name: "stockjournal",
        builder: (context, state) {
          return StockJournalScreen();
        },
      ),
      GoRoute(
        path: "/additem",
        name: "additem",
        builder: (context, state) {
          return AddItems();
        },
      ),
      GoRoute(
        path: "/stockreceivescreen",
        name: "stockreceive",
        builder: (context, state) {
          return StockReceiveScreen();
        },
      ),
      GoRoute(
        path: "/expenseentryscreen",
        name: "expenseentry",
        builder: (context, state) {
          return ExpenseEntryScreen();
        },
      ),
      GoRoute(
        path: "/customerTransactions",
        name: AppRouterConst.customerTransactions,
        builder: (context, state) {
          return const CustomerTransactions();
        },
      ),

      GoRoute(
        path: "/transactionDetailpage",
        name: AppRouterConst.transactionDetailpage,
        builder: (context, state) {
          return const TransactionDetailpage();
        },
      ),
    ],
  );
}

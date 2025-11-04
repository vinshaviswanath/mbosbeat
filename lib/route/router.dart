import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/data/models/route_list_model.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_route_screen.dart';
import 'package:mpos_beat/presentation/common/widgets/loading_screen.dart';
import 'package:mpos_beat/presentation/views/admin_home/admin_dashboard.dart';
import 'package:mpos_beat/presentation/views/admin_voucher_settings/voucher_settings_screen.dart';
import 'package:mpos_beat/presentation/views/company_settings/company_settings.dart';
import 'package:mpos_beat/presentation/views/company_user_mapping/company_user_mapping_screen.dart';
import 'package:mpos_beat/presentation/views/godown_route_voucher_screen/godown_route_voucher_screen.dart';
import 'package:mpos_beat/presentation/views/godown_wise_screen/godown_wise_screen.dart';
import 'package:mpos_beat/presentation/views/route_wise_screen/route_wise_screen.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/add_company/add_company_screen.dart';
import 'package:mpos_beat/presentation/views/admin_home/admin_home.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_create/user_creation_screen.dart';
import 'package:mpos_beat/presentation/views/company_creation/company_creation_screen.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/customer_transactions.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/transaction_detail_page/order_booking/order_booking.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/transaction_detail_page/order_booking/order_booking_item.dart';
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
import 'package:mpos_beat/presentation/views/reset_password/reset_password_screen.dart';
import 'package:mpos_beat/presentation/views/signup/sign_up_screen.dart';
import 'package:mpos_beat/presentation/views/splash_screen/splash_screen.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/manage_user_screen.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/user_designation_screen.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_management/user_management.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/user_settings_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/payment/payment_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/purchase/purchase_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/purchase_return/purchase_return_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/receipt_screen/receipt_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/replacement/replacement_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/sales/sales_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/sales_return/sales_return.dart';
import 'package:mpos_beat/presentation/views/transactions/telephonic_order/telephonic_order.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/order_booking_add_item_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';
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
          final user = extra["user"] as UserMasterList?;
          return UserCreationScreen(isUpdate: isEdit, user: user);
        },
      ),

      GoRoute(
        path: "/resetPassword",
        name: AppRouterConst.resetPassword,
        builder: (context, state) {
          final index = state.extra as int;
          return ResetPasswordScreen(index: index);
        },
      ),
      GoRoute(
        path: "/userSettings",
        name: AppRouterConst.userSettings,
        builder: (context, state) {
          final userId = state.extra as String;
          return UserSettingsScreen(userId: userId);
        },
      ),
      GoRoute(
        path: "/addCompany",
        name: AppRouterConst.addCompany,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final name = extra["name"] as String;
          final companyName = extra["companyName"] as String;
          final userId = extra["userId"] as int;
          // final company = extra["company"] as CompaniesListResponse;
          return AddCompanyScreen(name: name, companyName: companyName,userId: userId,);
      },
      ),
      GoRoute(
        path: "/userDesignation",
        name: AppRouterConst.userDesignation,
        builder: (context, state) {
          return const UserDesignationScreen();
        },
      ),
      GoRoute(
        path: "/transactionOrderBooking",
        name: AppRouterConst.transactionOrderBooking,
        builder: (context, state) {
          return const TransactionOrderBookingScreen();
        },
      ),
      GoRoute(
        path: "/orderBookingAddItemScreen",
        name: AppRouterConst.orderBookingAddItemScreen,
        builder: (context, state) {
          return const OrderBookingAddItemScreen();
        },
      ),
      GoRoute(
        path: "/telephonicOrderScreen",
        name: AppRouterConst.telephonicOrderScreen,
        builder: (context, state) {
          return const TelephonicOrderScreen();
        },
      ),
      GoRoute(
        path: "/salesScreen",
        name: AppRouterConst.salesScreen,
        builder: (context, state) {
          return const SalesScreen();
        },
      ),
      GoRoute(
        path: "/salesReturnScreen",
        name: AppRouterConst.salesReturnScreen,
        builder: (context, state) {
          return const SalesReturnScreen();
        },
      ),
      GoRoute(
        path: "/purchaseReturnSCreen",
        name: AppRouterConst.purchaseReturnSCreen,
        builder: (context, state) {
          return const PurchaseReturnScreen();
        },
      ),
      GoRoute(
        path: "/purchaseScreen",
        name: AppRouterConst.purchaseScreen,
        builder: (context, state) {
          return const PurchaseScreen();
        },
      ),
      GoRoute(
        path: "/receiptScreen",
        name: AppRouterConst.receiptScreen,
        builder: (context, state) {
          return const ReceiptScreen();
        },
      ),
      GoRoute(
        path: "/paymentScreen",
        name: AppRouterConst.paymentScreen,
        builder: (context, state) {
          return const PaymentScreen();
        },
      ),
      GoRoute(
        path: "/replacementScreen",
        name: AppRouterConst.replacementScreen,
        builder: (context, state) {
          return const ReplacementScreen();
        },
      ),

      //anver
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
          return const OtherTransOptionsScreen();
        },
      ),
      GoRoute(
        path: "/stockjournalscreen",
        name: "stockjournal",
        builder: (context, state) {
          return const StockJournalScreen();
        },
      ),
      GoRoute(
        path: "/additem",
        name: "additem",
        builder: (context, state) {
          return const AddItems();
        },
      ),
      GoRoute(
        path: "/stockreceivescreen",
        name: "stockreceive",
        builder: (context, state) {
          return const StockReceiveScreen();
        },
      ),
      GoRoute(
        path: "/expenseentryscreen",
        name: "expenseentry",
        builder: (context, state) {
          return const ExpenseEntryScreen();
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

      GoRoute(
        path: "/orderbookingpage",
        name: AppRouterConst.orderbooking,
        builder: (context, state) {
          return const OrderBooking();
        },
      ),

      GoRoute(
        path: "/orderbookingitemsscreen",
        name: AppRouterConst.orderbookingitems,
        builder: (context, state) {
          return const OrderBookingItems();
        },
      ),

      GoRoute(
        name: AppRouterConst.companyCreationScreen,
        path: '/companyCreationScreen',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final tabIndex = extra?['tabIndex'] as int? ?? 0;
          final companyData = extra?['companyData'] as CompanyViewList?;

          return CompanyCreationScreen(
            initialTabIndex: tabIndex,
            companyData: companyData,
          );
        },
      ),
      GoRoute(
        path: "/adminDashboard",
        name: AppRouterConst.adminDashboard,
        builder: (context, state) {
          return const AdminDashboard();
        },
      ),
      GoRoute(
        path: "/godownWiseScreen",
        name: AppRouterConst.godownWiseScreen,
        builder: (context, state) {
          return const GodownWiseScreen();
        },
      ),
      GoRoute(
        path: "/routeWiseScreen",
        name: AppRouterConst.routeWiseScreen,
        builder: (context, state) {
          return const RouteWiseScreen();
        },
      ),
      GoRoute(
        path: "/godownRouteVoucherScreen",
        name: AppRouterConst.godownRouteVoucherScreen,
        builder: (context, state) {
          return const GodownRouteVoucherScreen();
        },
      ),
      GoRoute(
        path: "/companySettingsScreen",
        name: AppRouterConst.companySettingsScreen,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final companyId = extra?['companyId'] as int? ?? 0;
          return CompanySettingsScreen(companyId: companyId);
        },
      ),
      GoRoute(
        path: "/companyUserMappingScreen",
        name: AppRouterConst.companyUserMappingScreen,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final name = extra["name"] as String;
          final companyName = extra["companyName"] as String;
          final companyId = extra["companyId"] as int;
          return CompanyUserMappingScreen(
            name: name,
            companyName: companyName,
            companyId: companyId,
          );
        },
      ),
      GoRoute(
        path: "/voucherSettingsScreen",
        name: AppRouterConst.voucherSettingsScreen,
        builder: (context, state) {
          final extra = state.extra;
          if (extra is Map<String, dynamic>) {
            final data = extra['data'];
            final voucherModeId = extra['voucherModeId'] as int;
            if (data is VehicleList) {
              return VoucherSettingsScreen<VehicleList>(
                data: data,
                voucherModeId: voucherModeId,
              );
            } else if (data is RouteList) {
              return VoucherSettingsScreen<RouteList>(
                data: data,
                voucherModeId: voucherModeId,
              );
            }
          }

          return const SizedBox.shrink();
        },
      ),
    ],
  );
}

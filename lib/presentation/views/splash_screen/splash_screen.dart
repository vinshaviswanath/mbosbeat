import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/data/models/route_list_model.dart';
import 'package:mpos_beat/domain/request/login_by_token_param.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = "splash-screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _loginByToken() async {
    final prefs = sl<SharedPreferences>();

    final token = prefs.getString("token") ?? '';
    final companyId = prefs.getInt('selected_company_id')?.toString() ?? '';

    if (token.isEmpty || companyId.isEmpty) {
      Logger.logError(
        "Missing token or company ID — cannot continue loginByToken.",
      );
      return;
    }
    final authProvider = context.read<AuthFormProvider>();
    final companyProvider = context.read<CompanyCreationProvider>();
    await authProvider.loginByToken(params: LoginByTokenParam(token: token));
    await companyProvider.getAllRoutess(context: context, companyId: companyId);
    await companyProvider.getAllGodowns(context: context, companyId: companyId);
    final firstVehicle =
        companyProvider.godownListResponse?.vehicleList.firstOrNull;
    final firstRoute = companyProvider.routeListResponse?.routeList.firstOrNull;

     companyProvider.setSelectedVehicle(
      firstVehicle ??
          VehicleList(id: 0, companyId: 0, code: '', name: '', active: 0),
    );

     companyProvider.setSelectedRoute(
      firstRoute ??
          RouteList(
            id: 0,
            companyId: 0,
            routeCode: '',
            routeName: '',
            active: 0,
          ),
    );

    // Step 4: Fetch voucher numbering
    final voucherModeId = companyProvider.isGodown
        ? companyProvider.selectedVehicle?.id ?? 0
        : companyProvider.selectedRoute?.id ?? 0;

    await companyProvider.getVoucherNumbering(
      context: context,
      companyId: companyId,
      voucherModeId: voucherModeId,
    );

    // Step 5: Log success information
    Logger.logSuccess(
      "Company ID: $companyId | "
      "Voucher Mode: ${companyProvider.isGodown ? "Godown" : "Route"} | "
      "Voucher Mode ID: $voucherModeId",
    );
  }

  @override
  void initState() {
    super.initState();

    context.read<UserManagementProvider>()
      ..loadDesignations()
      ..loadUsers();
    _loginByToken();
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        final prefs = sl<SharedPreferences>();
        final token = prefs.getString("token") ?? '';
        final isOnboardingCompleted =
            prefs.getBool("isOnboardingCompleted") ?? false;
        if (isOnboardingCompleted == true) {
          context.pushNamed(AppRouterConst.login);
          if (token.isEmpty) {
            context.pushNamed(AppRouterConst.login);
          } else {
            context.read<UserManagementProvider>().getDesignationList(context);

            // context.pushNamed(AppRouterConst.adminHome);
            context.pushNamed(AppRouterConst.adminDashboard);
      return;
         } else {
            context.read<UserManagementProvider>().getDesignationList(context);

            context.pushNamed(AppRouterConst.adminDashboard);
          }
        } else {
          context.pushNamed(AppRouterConst.onboardScreen);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Logger.logInfo("localized text: ${context.l10n.onboard_skip}");

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: context.getSize.height * 0.1,
            left: -context.getSize.width * 0.35,
            child: Image.asset(
              AppAssets.bgVector,
              height: context.getSize.height * 0.3,
            ),
          ),
          Positioned(
            bottom: -context.getSize.height * 0.08,
            right: -context.getSize.width * 0.35,
            child: Image.asset(
              AppAssets.bgVector,
              height: context.getSize.height * 0.3,
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Center(
                  child: Image.asset(
                    AppAssets.logo,
                    height: context.getSize.height * 0.14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   static const routeName = "splash-screen";

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _initialize();
//   }

//   Future<void> _initialize() async {
//     final prefs = sl<SharedPreferences>();
//     final token = prefs.getString("token") ?? '';
//     final isOnboardingCompleted =
//         prefs.getBool("isOnboardingCompleted") ?? false;

//     await Future.delayed(const Duration(seconds: 2));

//     if (!mounted) return;

//     if (!isOnboardingCompleted) {
//       context.pushNamed(AppRouterConst.onboardScreen);
//       return;
//     }

//     if (token.isEmpty) {
//       context.pushNamed(AppRouterConst.login);
//       return;
//     }

//     final userProvider = context.read<UserManagementProvider>();
//     userProvider.loadDesignations();
//     userProvider.loadUsers();

//     final authProvider = context.read<AuthFormProvider>();
//     final response = await authProvider.loginByToken(
//       params: LoginByTokenParam(token: token),
//     );

//     if (!mounted) return;

//     if (response == null) {
//       context.pushNamed(AppRouterConst.login);
//       return;
//     }

//     switch (response.status) {
//       case 1:
//         userProvider.getDesignationList(context);
//         context.pushNamed(AppRouterConst.adminDashboard);
//         break;

//       case 10:
//       case 20:
//       case 30:
//       case 40:
//         context.pushNamed(AppRouterConst.login);

//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (!mounted) return;

//           switch (response.status) {
//             case 10:
//               RegistrationDialogs.pendingRegisteredDialog(
//                 context,
//                 response.loginData?.companyName ?? '',
//                 id: response.loginData?.customerId,
//               );
//               break;
//             case 20:
//               RegistrationDialogs.customDialog(
//                 context: context,
//                 heading: "Pending",
//                 subTitle: "Please complete company creation",
//                 onTap: () {
//                   if (!mounted) return;
//                   context.pushNamed(
//                     AppRouterConst.companyCreationScreen,
//                     extra: 0,
//                   );
//                 },
//                 buttonText: "Redirect",
//               );
//               break;
//             case 30:
//               RegistrationDialogs.customDialog(
//                 context: context,
//                 heading: "Pending",
//                 subTitle: "Please complete Company Integration Settings",
//                 onTap: () {
//                   if (!mounted) return;
//                   context.pushNamed(
//                     AppRouterConst.companyCreationScreen,
//                     extra: 2,
//                   );
//                 },
//                 buttonText: "Redirect",
//               );
//               break;
//             case 40:
//               RegistrationDialogs.customDialog(
//                 context: context,
//                 heading: "Pending",
//                 subTitle: "Please complete Company VoucherType Configuration",
//                 onTap: () {
//                   if (!mounted) return;
//                   context.pushNamed(
//                     AppRouterConst.companyCreationScreen,
//                     extra: 1,
//                   );
//                 },
//                 buttonText: "Redirect",
//               );
//               break;
//           }
//         });
//         break;

//       default:
//         context.pushNamed(AppRouterConst.login);
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Logger.logInfo("localized text: ${context.l10n.onboard_skip}");

//     final size = context.getSize;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: size.height * 0.1,
//             left: -size.width * 0.35,
//             child: Image.asset(AppAssets.bgVector, height: size.height * 0.3),
//           ),
//           Positioned(
//             bottom: -size.height * 0.08,
//             right: -size.width * 0.35,
//             child: Image.asset(AppAssets.bgVector, height: size.height * 0.3),
//           ),
//           Center(
//             child: Image.asset(AppAssets.logo, height: size.height * 0.14),
//           ),
//         ],
//       ),
//     );
//   }
// }

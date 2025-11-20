import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/data/models/route_list_model.dart';
import 'package:mpos_beat/domain/request/login_by_token_param.dart';
import 'package:mpos_beat/presentation/dialogs/registration_dialogs.dart';
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
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  // Future<void> _initialize() async {
  //   final prefs = sl<SharedPreferences>();
  //   final token = prefs.getString("token") ?? '';
  //   final isOnboardingCompleted =
  //       prefs.getBool("isOnboardingCompleted") ?? false;

  //   await Future.delayed(const Duration(seconds: 2));

  //   if (!mounted) return;

  //   if (!isOnboardingCompleted) {
  //     context.pushNamed(AppRouterConst.onboardScreen);
  //     return;
  //   }

  //   if (token.isEmpty) {
  //     context.pushNamed(AppRouterConst.login);
  //     return;
  //   }

  //   final userProvider = context.read<UserManagementProvider>();
  //   userProvider.loadDesignations();
  //   userProvider.loadUsers();

  //   final authProvider = context.read<AuthFormProvider>();
  //   final response = await authProvider.loginByToken(
  //     params: LoginByTokenParam(token: token),
  //   );

  //   if (!mounted) return;

  //   if (response == null) {
  //     context.pushNamed(AppRouterConst.login);
  //     return;
  //   }

  //   switch (response.status) {
  //     case 1:
  //       userProvider.getDesignationList(context);
  //       context.pushNamed(AppRouterConst.adminDashboard);
  //       break;

  //     case 10:
  //     case 20:
  //     case 30:
  //     case 40:
  //       context.pushNamed(AppRouterConst.login);

  //       WidgetsBinding.instance.addPostFrameCallback((_) async {
  //         if (!mounted) return;

  //         // Fetch companies directly from API
  //         final companyProvider = context.read<CompanyCreationProvider>();
  //         await companyProvider.getAllCompanies(context);
  //         final companyList =
  //             companyProvider.companiesList?.companyViewList ?? [];

  //         if (companyList.isEmpty) {
  //           Logger.logError("No companies found!");
  //           return;
  //         }

  //         // Pass first company
  //         final companyData = companyList.first;

  //         switch (response.status) {
  //           case 10:
  //             RegistrationDialogs.pendingRegisteredDialog(
  //               context,
  //               response.loginData?.companyName ?? '',
  //               id: response.loginData?.customerId,
  //             );
  //             break;
  //           case 20:
  //             RegistrationDialogs.customDialog(
  //               margin: EdgeInsets.symmetric(horizontal: 70),
  //               context: context,
  //               heading: "Registration Completed!",
  //               subTitle:
  //                   "You have successfully completed the\nregistration on last login. Kindly go to company\ncreation page to continue.",
  //               onTap: () {
  //                 if (!mounted) return;
  //                 Logger.logSuccess(
  //                   "COMPANY ID from dialog: ${companyData.id}",
  //                 );
  //                 context.goNamed(
  //                   AppRouterConst.companyCreationScreen,
  //                   extra: {
  //                     'tabIndex': 0,
  //                     'companyData': companyData,
  //                     'isPop': true,
  //                   },
  //                 );
  //               },
  //               buttonText: "Go to Company Creation",
  //             );
  //             break;
  //           case 40:
  //             RegistrationDialogs.customDialog(
  //               margin: EdgeInsets.symmetric(horizontal: 103),
  //               context: context,
  //               heading: "Company Creation Completed!",
  //               subTitle:
  //                   "You have successfully completed voucher type configuration on last login. Kindly start the integration settings to continue.",

  //               onTap: () {
  //                 if (!mounted) return;
  //                 Logger.logSuccess(
  //                   "COMPANY ID from dialog: ${companyData.id}",
  //                 );

  //                 context.goNamed(
  //                   AppRouterConst.companyCreationScreen,
  //                   extra: {
  //                     'tabIndex': 2,
  //                     'companyData': companyData,
  //                     'isPop': true,
  //                   },
  //                 );
  //               },
  //               buttonText: "Continue",
  //             );
  //             break;
  //           case 30:
  //             RegistrationDialogs.customDialog(
  //               margin: EdgeInsets.symmetric(horizontal: 103),
  //               context: context,
  //               heading: "Company Creation Completed!",
  //               subTitle:
  //                   "You have successfully created company details on last login. Kindly start the voucher type configuration to continue.",
  //               onTap: () {
  //                 if (!mounted) return;
  //                 Logger.logSuccess(
  //                   "COMPANY ID from dialog: ${companyData.id}",
  //                 );

  //                 context.goNamed(
  //                   AppRouterConst.companyCreationScreen,
  //                   extra: {
  //                     'tabIndex': 1,
  //                     'companyData': companyData,
  //                     'isPop': true,
  //                   },
  //                 );
  //               },
  //               buttonText: "Continue",
  //             );
  //             break;
  //         }
  //       });
  //       break;

  //     default:
  //       context.pushNamed(AppRouterConst.login);
  //       break;
  //   }
  // }

  Future<void> _initialize() async {
    final prefs = sl<SharedPreferences>();
    final token = prefs.getString("token") ?? '';
    final isOnboardingCompleted =
        prefs.getBool("isOnboardingCompleted") ?? false;

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    // ONBOARD / LOGIN CHECKS
    if (!isOnboardingCompleted) {
      context.pushNamed(AppRouterConst.onboardScreen);
      return;
    }

    if (token.isEmpty) {
      context.pushNamed(AppRouterConst.login);
      return;
    }

    // USER PRELOAD DATA
    final userProvider = context.read<UserManagementProvider>();
    userProvider.loadDesignations();
    userProvider.loadUsers();

    // TOKEN LOGIN
    final authProvider = context.read<AuthFormProvider>();
    final response = await authProvider.loginByToken(
      params: LoginByTokenParam(token: token),
    );

    if (!mounted) return;

    if (response == null) {
      context.pushNamed(AppRouterConst.login);
      return;
    }

    // STATUS SWITCH
    switch (response.status) {
      case 1:
        // Normal login → Dashboard
        userProvider.getDesignationList(context);
        context.pushNamed(AppRouterConst.adminDashboard);
        break;

      case 10:
      case 20:
      case 30:
      case 40:
        context.pushNamed(AppRouterConst.login);

        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (!mounted) return;

          // FETCH COMPANY LIST
          final companyProvider = context.read<CompanyCreationProvider>();
          await companyProvider.getAllCompanies(context);
          final companyList =
              companyProvider.companiesList?.companyViewList ?? [];

          // IMPORTANT:
          // Even if companyList is empty, show dialogs for status 10/20.
          CompanyViewList? companyData = companyList.isNotEmpty
              ? companyList.first
              : null;

          // SHOW CORRESPONDING DIALOG
          switch (response.status) {
            case 10:
              // RegistrationDialogs.pendingRegisteredDialog(
              //   context,
              //   response.loginData?.companyName ?? '',
              //   id: response.loginData?.customerId,
              // );
              // break;

              RegistrationDialogs.customDialog(
                margin: EdgeInsets.symmetric(horizontal: 70),
                context: context,
                heading: "OTP not Varified",
                subTitle:
                    "You have successfully completed Login. Kindly\nverify with OTP to continue.",
                onTap: () async {
                  final customerId = response.loginData?.customerId;
                  await authProvider.resendOtp(context, id: customerId);
                  context.pushNamed(AppRouterConst.otpAuth);
                },
                buttonText: "Varify OTP",
              );
              break;

            case 20:
              RegistrationDialogs.customDialog(
                margin: const EdgeInsets.symmetric(horizontal: 70),
                context: context,
                heading: "Registration Completed!",
                subTitle:
                    "You have successfully completed the\nregistration on last login. Kindly go to company\ncreation page to continue.",
                onTap: () {
                  if (!mounted) return;

                  context.goNamed(
                    AppRouterConst.companyCreationScreen,
                    extra: {
                      'tabIndex': 0,
                      'companyData': companyData,
                      'isPop': true,
                    },
                  );
                },
                buttonText: "Go to Company Creation",
              );
              break;

            case 30:
              RegistrationDialogs.customDialog(
                margin: const EdgeInsets.symmetric(horizontal: 103),
                context: context,
                heading: "Company Creation Completed!",
                subTitle:
                    "You have successfully created company details on last login. Kindly start the voucher type configuration to continue.",
                onTap: () {
                  if (!mounted) return;

                  context.goNamed(
                    AppRouterConst.companyCreationScreen,
                    extra: {
                      'tabIndex': 1,
                      'companyData': companyData,
                      'isPop': true,
                    },
                  );
                },
                buttonText: "Continue",
              );
              break;

            case 40:
              RegistrationDialogs.customDialog(
                margin: const EdgeInsets.symmetric(horizontal: 103),
                context: context,
                heading: "Company Creation Completed!",
                subTitle:
                    "You have successfully completed voucher type configuration on last login. Kindly start the integration settings to continue.",
                onTap: () {
                  if (!mounted) return;

                  context.goNamed(
                    AppRouterConst.companyCreationScreen,
                    extra: {
                      'tabIndex': 2,
                      'companyData': companyData,
                      'isPop': true,
                    },
                  );
                },
                buttonText: "Continue",
              );
              break;
          }
        });
        break;

      // DEFAULT
      default:
        context.pushNamed(AppRouterConst.login);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Logger.logInfo("localized text: ${context.l10n.onboard_skip}");

    final size = context.getSize;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: size.height * 0.1,
            left: -size.width * 0.35,
            child: Image.asset(AppAssets.bgVector, height: size.height * 0.3),
          ),
          Positioned(
            bottom: -size.height * 0.08,
            right: -size.width * 0.35,
            child: Image.asset(AppAssets.bgVector, height: size.height * 0.3),
          ),
          Center(
            child: Image.asset(AppAssets.logo, height: size.height * 0.14),
          ),
        ],
      ),
    );
  }
}

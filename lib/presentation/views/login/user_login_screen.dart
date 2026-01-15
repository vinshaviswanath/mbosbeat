import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/domain/request/login_params.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  static const routeName = "login-screen";

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AuthFormProvider>(context, listen: false);
      provider.resetLoginForm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pref = sl<SharedPreferences>();
    final token = pref.getString("token");
   // Logger.logInfo(context.textStyle.s22.w700.white.fontFamily);
   // Logger.logSuccess("TOKEN : $token");

    final appLocalization = context.l10n;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        AuthDialogs.show(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Consumer<AuthFormProvider>(
          builder: (context, provider, _) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: context.getSize.height * 0.39,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(45),
                                    bottomRight: Radius.circular(45),
                                  ),
                                  color: ColorResources.indigoBlue,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      context.l10n.login,
                                      style: context
                                          .textStyle
                                          .s22
                                          .bold
                                          .white
                                          .roboto,
                                    ),
                                    h24,
                                    Text(
                                      context.l10n.login_welcome_back,
                                      style: context
                                          .textStyle
                                          .s18
                                          .white
                                          .w400
                                          .shade900
                                          .roboto,
                                      textAlign: TextAlign.center,
                                    ),
                                    h24,
                                  ],
                                ),
                              ),
                              Positioned(
                                top: -context.getSize.height * 0.075,
                                right: -context.getSize.width * 0.24,
                                child: Image.asset(
                                  AppAssets.bgVector,
                                  height: 300,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                h32,
                                Text(
                                  context.l10n.login_email_or_phone,
                                  style: context
                                      .textStyle
                                      .s12
                                      .bluishGray
                                      .w400
                                      .roboto,
                                ),
                                h4,
                                CustomTextField(
                                  controller: userEmailController,
                                  hint: appLocalization.enter_email_or_phone,
                                  hintTextStyle: context
                                      .textStyle
                                      .s12
                                      .w300
                                      .silverGray
                                      .roboto,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: SvgPicture.asset(
                                      AppAssets.userCircle,
                                      height: context.getSize.height * 0.02,
                                    ),
                                  ),
                                  backgroundColor: ColorResources.lightGray,
                                  autovalidateMode:
                                      provider.loginAutovalidateMode,
                                  failure: provider.emailOrPhone.getFailure,
                                  onChange: provider.updateEmailOrPhone,
                                  inputType: TextInputType.emailAddress,
                                  borderRadius: 12,
                                  hintColor: ColorResources.silverGray,
                                  borderColor: ColorResources.transparent,
                                ),
                                h20,
                                Text(
                                  appLocalization.password,
                                  style: context
                                      .textStyle
                                      .s12
                                      .bluishGray
                                      .w400
                                      .roboto,
                                ),
                                h4,
                                CustomTextField(
                                  controller: userPasswordController,
                                  hint: appLocalization.enter_password,
                                  hintTextStyle: context
                                      .textStyle
                                      .s12
                                      .w300
                                      .silverGray
                                      .roboto,
                                  suffixIcon: InkWell(
                                    onTap: () =>
                                        provider.userToggleVisibility(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: SvgPicture.asset(
                                        provider.isUserPasswordVisible
                                            ? AppAssets.featherEyeOn
                                            : AppAssets.featherEyeOff,
                                        height: context.getSize.height * 0.02,
                                      ),
                                    ),
                                  ),
                                  obscureText: !provider.isUserPasswordVisible,
                                  backgroundColor: ColorResources.lightGray,
                                  autovalidateMode:
                                      provider.loginAutovalidateMode,
                                  failure: provider.password.getFailure,
                                  onChange: (value) {
                                    provider.updatePassword(value, '');
                                  },

                                  inputType: TextInputType.visiblePassword,
                                  borderRadius: 12,
                                  hintColor: ColorResources.silverGray,
                                  borderColor: ColorResources.transparent,
                                ),
                                h26,
                                CustomButton(
                                  buttonText: appLocalization.login,
                                  isborderEnable: false,
                                  textStyle:
                                      context.textStyle.s16.white.bold.roboto,
                                  borderRadius: BorderRadius.circular(45),
                                  onTap: () async {
                                    // Proceed with login
                                    await provider.submitLogin(
                                      context,
                                      params: LoginParams(
                                        username: userEmailController.text,
                                        password: userPasswordController.text,
                                        isAdmin: false,
                                      ),
                                    );
                                  },
                                ),
                                h10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () async {
                                        reset();
                                        provider.resetUserPasswordVisibility();
                                        await context.pushNamed(
                                          AppRouterConst.forgotPassword,
                                        );
                                      },
                                      child: Text(
                                        appLocalization.login_forgot_password,
                                        style: context
                                            .textStyle
                                            .s12
                                            .bluishGray
                                            .w300
                                            .roboto,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),
                          Row(
                            mainAxisAlignment: .center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  reset();
                                  provider.resetUserPasswordVisibility();
                                  context.pushNamed(AppRouterConst.login);
                                },
                                child: Container(
                                  padding: .symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorResources.ashGray,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Login as ",
                                          style: context
                                              .textStyle
                                              .s12
                                              .bluishGray
                                              .w400,
                                        ),
                                        TextSpan(
                                          text: "Admin",
                                          style: context
                                              .textStyle
                                              .s12
                                              .bluishGray
                                              .bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          h48,
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void reset() {
    FocusScope.of(context).requestFocus(FocusNode());
    userPasswordController.clear();
    userEmailController.clear();
    context.read<AuthFormProvider>().resetLoginForm();
  }
}

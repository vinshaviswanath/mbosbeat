import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/animations/stepper_transition.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_textField.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = "login-screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        AuthDialogs.exitApp();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Consumer<AuthFormProvider>(
          builder: (context, provider, _) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  // padding: const EdgeInsets.only(bottom: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          // Top header
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
                                      style: context.textStyle.s22.w700.white,
                                    ),
                                    gap24,
                                    Text(
                                      context.l10n.welcome_back,
                                      style: context.textStyle.s18.white.w300,
                                      textAlign: TextAlign.center,
                                    ),
                                    gap24,
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: -context.getSize.height * 0.08,
                                  right: -context.getSize.width * 0.2,
                                  child: Image.asset(AppAssets.bgVector)),
                            ],
                          ),

                          // Form section
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                gap32,
                                StepperTransition(
                                  delay: 200,
                                  child: Text(
                                    "Email ID / Mobile Number",
                                    style: context.textStyle.s12.bluishGray,
                                  ),
                                ),
                                gap4,
                                StepperTransition(
                                  delay: 200,
                                  child: CustomTextField(
                                    controller: emailController,
                                    hint: "Mobile / Email ID",
                                    // suffixIcon: const Icon(
                                    //   Icons.person_outlined,
                                    //   color: Color(0xFF98A6BE),
                                    // ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: SvgPicture.asset(
                                        AppAssets.userCircle,
                                        height: 18,
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
                                ),
                                gap20,
                                StepperTransition(
                                  delay: 400,
                                  child: Text(
                                    "Password",
                                    style: context.textStyle.s12.bluishGray,
                                  ),
                                ),
                                gap4,
                                StepperTransition(
                                  delay: 400,
                                  child: CustomTextField(
                                    controller: passwordController,
                                    hint: "Password",
                                    // suffixIcon: IconButton(
                                    //   color: const Color(0xFF98A6BE),
                                    //   onPressed: () {
                                    //     provider.toggleVisibility();
                                    //   },
                                    //   icon: Icon(
                                    //     provider.isVisible
                                    //         ? Icons.visibility_outlined
                                    //         : Icons.visibility_off_outlined,
                                    //   ),
                                    // ),
                                    suffixIcon: InkWell(
                                      onTap: () => provider.toggleVisibility(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: SvgPicture.asset(
                                          provider.isVisible
                                              ? AppAssets.featherEyeOn
                                              : AppAssets.featherEyeOff,
                                          height: 18,
                                        ),
                                      ),
                                    ),
                                    obscureText: !provider.isVisible,
                                    backgroundColor: ColorResources.lightGray,
                                    autovalidateMode:
                                        provider.loginAutovalidateMode,
                                    failure: provider.password.getFailure,
                                    onChange: provider.updatePassword,
                                    // initialValue: provider.password.getValue,
                                    inputType: TextInputType.visiblePassword,
                                    borderRadius: 12,
                                    hintColor: ColorResources.silverGray,
                                    borderColor: ColorResources.transparent,
                                  ),
                                ),
                                gap26,
                                StepperTransition(
                                  delay: 800,
                                  child: CustomButton(
                                    buttonText: "Login",
                                    isborderEnable: false,
                                    textStyle: context.textStyle.s16.white.bold,
                                    borderRadius: BorderRadius.circular(45),
                                    onTap: () {
                                      // provider.resetSignUpForm();
                                      provider.submitLogin(context);
                                    },
                                  ),
                                ),
                                gap10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        reset();

                                        context.pushNamed(
                                            AppRouterConst.forgotPassword);
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: context.textStyle.s12.bluishGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),

                          // Footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: context.textStyle.s12.bluishGray,
                              ),
                              gap10,
                              InkWell(
                                onTap: () async {
                                  reset();
                                  // AppRoute.pushNamed(SignUpScreen.routeName);
                                  GoRouter.of(context)
                                      .push(AppRouterConst.signup);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: context.textStyle.s12.amber.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          gap48,
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
    passwordController.clear();
    emailController.clear();

    context.read<AuthFormProvider>().resetLoginForm();
  }
}

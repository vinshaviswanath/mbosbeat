import 'package:flutter/services.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/common/widgets/sliverSpace.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "signup-screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final compnyController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final compnyFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    compnyController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    compnyFocusNode.dispose();
    phoneFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  final noSpaceFormatter = FilteringTextInputFormatter.deny(RegExp(r'\s'));

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;

    return Consumer<AuthFormProvider>(
      builder: (context, provider, _) {
        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              context.read<AuthFormProvider>().resetSignUpForm();
              provider.resetVisibilitySignUp();
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: false,
                  foregroundColor: ColorResources.transparent,
                  surfaceTintColor: ColorResources.transparent,
                  backgroundColor: ColorResources.transparent,
                  centerTitle: true,
                  title: Text(
                    appLocalization.sign_up,
                    style: context.textStyle.s22.indigoBlue.bold.roboto,
                  ),
                ),
                const SliverSpace(diamention: h16),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          appLocalization.sign_up_company_name,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        h4,
                        CustomTextField(
                          hint: appLocalization.sign_up_enter_company_name,
                          controller: compnyController,
                          focusNode: compnyFocusNode,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(phoneFocusNode);
                          },
                          backgroundColor: ColorResources.lightGray,
                          autovalidateMode: provider.registerAutovalidateMode,
                          failure: provider.companyName.getFailure,
                          inputFormatters: [noSpaceFormatter],
                          onChange: provider.updateCompanyName,
                          inputType: TextInputType.emailAddress,
                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        h20,
                        Text(
                          appLocalization.mobile_number,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        h4,
                        CustomTextField(
                          hint: appLocalization.enter_mobile_number,
                          controller: phoneController,
                          focusNode: phoneFocusNode,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(emailFocusNode);
                          },
                          maxLength: 10,
                          backgroundColor: ColorResources.lightGray,
                          autovalidateMode: provider.registerAutovalidateMode,
                          failure: provider.phone.getFailure,
                          onChange: provider.updatePhone,
                          inputType: TextInputType.phone,
                          inputFormatters: [noSpaceFormatter],
                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        h20,
                        Text(
                          appLocalization.email_ID,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        h4,
                        CustomTextField(
                          hint: appLocalization.enter_email,
                          controller: emailController,
                          focusNode: emailFocusNode,
                          onFieldSubmitted: (_) {
                            FocusScope.of(
                              context,
                            ).requestFocus(passwordFocusNode);
                          },
                          backgroundColor: ColorResources.lightGray,
                          autovalidateMode: provider.registerAutovalidateMode,
                          failure: provider.email.getFailure,
                          onChange: provider.updateEmail,
                          inputType: TextInputType.emailAddress,
                          inputFormatters: [noSpaceFormatter],

                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        h20,
                        Text(
                          appLocalization.password,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        h4,
                        CustomTextField(
                          hint: appLocalization.enter_password,
                          controller: passwordController,
                          obscureText: !provider.isVisibleSignupPassword,
                          focusNode: passwordFocusNode,
                          onFieldSubmitted: (_) {
                            FocusScope.of(
                              context,
                            ).requestFocus(confirmPasswordFocusNode);
                          },
                          suffixIcon: InkWell(
                            onTap: () =>
                                provider.toggleVisibilitySignUpPassword(),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                provider.isVisibleSignupPassword
                                    ? AppAssets.featherEyeOn
                                    : AppAssets.featherEyeOff,
                                height: context.getSize.height * 0.02,
                              ),
                            ),
                          ),
                          backgroundColor: ColorResources.lightGray,
                          autovalidateMode: provider.registerAutovalidateMode,
                          failure: provider.password.getFailure,
                          inputFormatters: [noSpaceFormatter],
                          onChange: (value) {
                            provider.updatePassword(
                              value,
                              confirmPasswordController.text,
                            );
                          },
                          inputType: TextInputType.emailAddress,
                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        h20,
                        Text(
                          appLocalization.confirm_password,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        h4,
                        CustomTextField(
                          hint: appLocalization.confirm_password,
                          controller: confirmPasswordController,
                          focusNode: confirmPasswordFocusNode,
                          onFieldSubmitted: (_) {
                            // Close keyboard or submit form
                            confirmPasswordFocusNode.unfocus();
                          },
                          suffixIcon: InkWell(
                            onTap: () => provider
                                .toggleVisibilitySignUpConfirmPassword(),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                provider.isVisibleSignupConfirmPassword
                                    ? AppAssets.featherEyeOn
                                    : AppAssets.featherEyeOff,
                                height: context.getSize.height * 0.02,
                              ),
                            ),
                          ),
                          obscureText: !provider.isVisibleSignupConfirmPassword,
                          backgroundColor: ColorResources.lightGray,
                          autovalidateMode: provider.registerAutovalidateMode,
                          failure: provider.confirmPassword.getFailure,
                          inputFormatters: [noSpaceFormatter],
                          onChange: provider.updateConfirmPassword,
                          inputType: TextInputType.emailAddress,
                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        h20,
                        if (MediaQuery.of(context).viewInsets.bottom > 0) h200,
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 24,
                        ),
                        child: CustomButton(
                          onTap: () async {
                            FocusScope.of(context).unfocus();

                            final response = await provider.submitSignUp(
                              context,
                            );
                            if (response != null && response.status == 1 ||
                                response?.status == 20) {
                              compnyController.clear();
                              phoneController.clear();
                              emailController.clear();
                              passwordController.clear();
                              confirmPasswordController.clear();
                              // provider.resetSignUpForm();
                            }
                          },
                          buttonText: appLocalization.sign_up,
                          textStyle: context.textStyle.s16.white.bold.roboto,
                          isborderEnable: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

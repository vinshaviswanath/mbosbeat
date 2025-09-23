import 'package:flutter/services.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_textField.dart';
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
  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Consumer<AuthFormProvider>(
      builder: (context, provider, _) {
        return PopScope(
          canPop: true, // allow normal back navigation
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              // reset invalid OTP flag when leaving OTP screen
              context.read<AuthFormProvider>().resetSignUpForm();
            }
          },
          child: Scaffold(
            bottomSheet: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: CustomButton(
                onTap: () {
                  provider.submitSignUp(context);
                },
                buttonText: appLocalization.sign_up,
                textStyle: context.textStyle.s16.white.bold.roboto,
                isborderEnable: false,
              ),
            ),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  foregroundColor: ColorResources.transparent,
                  surfaceTintColor: ColorResources.transparent,
                  backgroundColor: ColorResources.transparent,
                  centerTitle: true,
                  title: Text(
                    appLocalization.sign_up,
                    style: context.textStyle.s22.indigoBlue.bold.roboto,
                  ),
                ),
                const SliverGap(16),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalization.company_name,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        gap4,
                        CustomTextField(
                          hint: appLocalization.enter_company_name,
                          controller: compnyController,
                          backgroundColor: ColorResources.lightGray,
                          autovalidateMode: provider.registerAutovalidateMode,
                          failure: provider.companyName.getFailure,
                          onChange: provider.updateCompanyName,
                          // initialValue: provider.companyName.getValue,
                          inputType: TextInputType.emailAddress,
                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        gap20,
                        Text(
                          appLocalization.mobile_number,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        gap4,
                        CustomTextField(
                          hint: appLocalization.enter_mobile_number,
                          controller: phoneController,
                          maxLength: 10,
                          backgroundColor: ColorResources.lightGray,
                          autovalidateMode: provider.registerAutovalidateMode,
                          failure: provider.phone.getFailure,
                          onChange: provider.updatePhone,
                          // initialValue: provider.phone.getValue,
                          inputType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        gap20,
                        Text(
                          appLocalization.email_ID,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        gap4,
                        CustomTextField(
                          hint: appLocalization.enter_email,
                          controller: emailController,
                          backgroundColor: ColorResources.lightGray,
                          autovalidateMode: provider.registerAutovalidateMode,
                          failure: provider.email.getFailure,
                          onChange: provider.updateEmail,
                          // initialValue: provider.email.getValue,
                          inputType: TextInputType.emailAddress,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z0-9@._-]"),
                            ),
                          ],
                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        gap20,
                        Text(
                          appLocalization.password,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        gap4,
                        CustomTextField(
                          hint: appLocalization.enter_password,
                          controller: passwordController,
                          backgroundColor: ColorResources.lightGray,
                          autovalidateMode: provider.registerAutovalidateMode,
                          failure: provider.password.getFailure,
                          onChange: provider.updatePassword,
                          // initialValue: provider.password.getValue,
                          inputType: TextInputType.emailAddress,
                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        gap20,
                        Text(
                          appLocalization.confirm_password,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        gap4,
                        CustomTextField(
                          hint: appLocalization.confirm_password,
                          controller: confirmPasswordController,
                          backgroundColor: ColorResources.lightGray,
                          autovalidateMode: provider.registerAutovalidateMode,
                          failure: provider.confirmPassword.getFailure,
                          onChange: provider.updateConfirmPassword,
                          // initialValue: provider.confirmPassword.getValue,
                          inputType: TextInputType.emailAddress,
                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        gap20,
                        //enable it while keyboard is enabled
                        if (MediaQuery.of(context).viewInsets.bottom > 0)
                          const Gap(200),
                      ],
                    ),
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

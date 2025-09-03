import 'package:flutter/services.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/animations/stepper_transition.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_textField.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = "signup-screen";

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            bottomSheet: StepperTransition(
              delay: 1200,
              child: Padding(
                padding:
                    const EdgeInsetsGeometry.only(left: 16, right: 16, bottom: 24),
                child: CustomButton(
                    onTap: () {
                      provider.submitSignUp(context);
                    },
                    buttonText: "Sign up",
                    isborderEnable: false),
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
                    "Sign Up",
                    style: context.textStyle.s22.indigoBlue,
                  ),
                ),
                const SliverGap(16),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StepperTransition(
                          delay: 200,
                          child: Text(
                            "Company Name",
                            style: context.textStyle.s12.bluishGray,
                          ),
                        ),
                        gap4,
                        StepperTransition(
                          delay: 200,
                          child: CustomTextField(
                            hint: "Enter Company Name",
                            backgroundColor: ColorResources.lightGray,
                            autovalidateMode: provider.companyValidationMode,
                            failure: provider.companyFailure,
                            onChange: provider.updateCompanyName,
                            initialValue: provider.companyName.getValue,
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
                            "Mobile Number",
                            style: context.textStyle.s12.bluishGray,
                          ),
                        ),
                        gap4,
                        StepperTransition(
                          delay: 400,
                          child: CustomTextField(
                            hint: "Enter Mobile Number",
                            maxLength: 15,
                            backgroundColor: ColorResources.lightGray,
                            autovalidateMode: provider.phoneValidationMode,
                            failure: provider.phoneFailure,
                            onChange: provider.updatePhone,
                            initialValue: provider.phone.getValue,
                            inputType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            borderRadius: 12,
                            hintColor: ColorResources.silverGray,
                            borderColor: ColorResources.transparent,
                          ),
                        ),
                        gap20,
                        StepperTransition(
                          delay: 600,
                          child: Text(
                            "Email ID",
                            style: context.textStyle.s12.bluishGray,
                          ),
                        ),
                        gap4,
                        StepperTransition(
                          delay: 600,
                          child: CustomTextField(
                            hint: "Enter Email",
                            backgroundColor: ColorResources.lightGray,
                            autovalidateMode: provider.emailValidationMode,
                            failure: provider.emailFailure,
                            onChange: provider.updateEmail,
                            initialValue: provider.email.getValue,
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
                        ),
                        gap20,
                        StepperTransition(
                          delay: 800,
                          child: Text(
                            "Password",
                            style: context.textStyle.s12.bluishGray,
                          ),
                        ),
                        gap4,
                        StepperTransition(
                          delay: 800,
                          child: CustomTextField(
                            hint: "Enter Password",
                            backgroundColor: ColorResources.lightGray,
                            autovalidateMode: provider.passwordValidationMode,
                            failure: provider.passwordFailure,
                            onChange: provider.updatePassword,
                            initialValue: provider.password.getValue,
                            inputType: TextInputType.emailAddress,
                            borderRadius: 12,
                            hintColor: ColorResources.silverGray,
                            borderColor: ColorResources.transparent,
                          ),
                        ),
                        gap20,
                        StepperTransition(
                          delay: 1000,
                          child: Text(
                            "Confirm Password",
                            style: context.textStyle.s12.bluishGray,
                          ),
                        ),
                        gap4,
                        StepperTransition(
                          delay: 1000,
                          child: CustomTextField(
                            hint: "Confirm Password",
                            backgroundColor: ColorResources.lightGray,
                            autovalidateMode:
                                provider.confirmPasswordValidationMode,
                            failure: provider.confirmPasswordFailure,
                            onChange: provider.updateConfirmPassword,
                            initialValue: provider.confirmPassword.getValue,
                            inputType: TextInputType.emailAddress,
                            borderRadius: 12,
                            hintColor: ColorResources.silverGray,
                            borderColor: ColorResources.transparent,
                          ),
                        ),
                        gap20,
                        //enable it while keyboard is enabled
                        if (MediaQuery.of(context).viewInsets.bottom > 0)
                          const Gap(200)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

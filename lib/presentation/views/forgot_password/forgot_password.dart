import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/base_box.dart';
import 'package:mpos_beat/presentation/common/widgets/base_scaffold.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_appBar.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class ForgotPassword extends StatefulWidget {
  static const routeName = "forgot-password";
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // String? validateEmail(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "Email is required";
  //   }
  //   final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //   if (!emailRegex.hasMatch(value)) {
  //     return "Enter a valid email";
  //   }
  //   return null;
  // }

  // void submit() {
  //   if (_formKey.currentState!.validate()) {
  //     context.pushNamed(AppRouterConst.mailedScreen);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthFormProvider>(
      builder: (context, provider, _) {
        return Form(
          key: provider.formKey,
          child: BaseScaffold(
            widget: SizedBox(
              height: context.getSize.height,
              width: context.getSize.width,
              child: CustomScrollView(
                slivers: [
                  CustomSliverAppBar(
                    title: "Forgot Password",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SliverGap(24),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseBox(
                          height: context.getSize.height * 0.44,
                          widgwt: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Lottie.asset(AppAssets.forgot_password,
                                    height: 100),
                                gap8,
                                Text(
                                  "Enter the email associated with your account and we will send an email to reset your password.",
                                  style: context.textStyle.s12,
                                  textAlign: TextAlign.center,
                                  textScaler: const TextScaler.linear(0.8),
                                ),
                                gap24,
                                Row(
                                  children: [
                                    Text(
                                      "Email Address",
                                      style: context.textStyle.s12.bluishGray,
                                    ),
                                  ],
                                ),
                                gap4,
                                Row(
                                  children: [
                                    Expanded(
                                        child: TextFormField(
                                      controller: provider.emailController,
                                      validator: provider.validateEmail,
                                      autovalidateMode:
                                          provider.loginAutovalidateMode,
                                      keyboardType: TextInputType.emailAddress,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r"[a-zA-Z0-9@._-]"),
                                        ),
                                      ],
                                      decoration: InputDecoration(
                                        hintText: "Enter Email",
                                        filled: true,
                                        fillColor: ColorResources.lightGray,
                                        hintStyle: TextStyle(
                                            color: ColorResources.silverGray),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                                gap16,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: CustomButton(
                                    onTap: () {
                                      provider.resetPassword(context);
                                    },
                                    buttonText: "Send",
                                    isborderEnable: false,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

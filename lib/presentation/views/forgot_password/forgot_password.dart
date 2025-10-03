import 'package:flutter/services.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/base_box.dart';
import 'package:mpos_beat/presentation/common/widgets/base_scaffold.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';

class ForgotPassword extends StatefulWidget {
  static const routeName = "forgot-password";
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Consumer<AuthFormProvider>(
      builder: (context, provider, _) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;

            provider.emailController.clear();
            Navigator.pop(context, result);
          },
          child: Form(
            key: provider.formKey,
            child: BaseScaffold(
              widget: SizedBox(
                height: context.getSize.height,
                width: context.getSize.width,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      foregroundColor: ColorResources.transparent,
                      surfaceTintColor: ColorResources.transparent,
                      backgroundColor: ColorResources.transparent,
                      title: Text(
                        appLocalization.forgot_password,
                        style: context.textStyle.s22.white.bold,
                      ),
                      centerTitle: true,
                      leading: InkWell(
                        onTap: () {
                          provider.emailController.clear();
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.left,
                                colorFilter: const ColorFilter.mode(
                                  ColorResources.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: h24,
                    ),
                    SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseBox(
                            height: context.getSize.height * 0.48,
                            widgwt: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  AppAssets.forgotPassword,
                                  height: context.getSize.height * 0.14,
                                ),
                                h8,
                                Text(
                                  appLocalization.forgot_password_description,
                                  style: context.textStyle.s12.w400.bluishGray,
                                  textAlign: TextAlign.center,
                                ),
                                h24,
                                Row(
                                  children: [
                                    Text(
                                      appLocalization.email_address,
                                      style: context.textStyle.s12.bluishGray,
                                    ),
                                  ],
                                ),
                                h4,
                                Row(
                                  children: [
                                    Expanded(
                                      child: FormField<String>(
                                        validator: provider.validateEmail,
                                        autovalidateMode:
                                            provider.loginAutovalidateMode,
                                        builder: (field) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextFormField(
                                                controller:
                                                    provider.emailController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter.allow(
                                                    RegExp(r"[a-zA-Z0-9@._-]"),
                                                  ),
                                                ],
                                                onChanged: (value) {
                                                  field.didChange(
                                                    value,
                                                  );
                                                },
                                                decoration: InputDecoration(
                                                  hintText: appLocalization
                                                      .enter_email,

                                                  filled: true,
                                                  fillColor:
                                                      ColorResources.lightGray,
                                                  hintStyle: context
                                                      .textStyle
                                                      .s12
                                                      .w300
                                                      .silverGray,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                        borderSide:
                                                            const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                      ),

                                                  errorBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                    borderSide:
                                                        const BorderSide(
                                                          color: ColorResources
                                                              .roseRed,
                                                        ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                        borderSide:
                                                            const BorderSide(
                                                              color: Colors.red,
                                                            ),
                                                      ),
                                                ),
                                              ),
                                              if (field.hasError)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 4,
                                                        top: 4,
                                                      ),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppAssets.alertError,
                                                        height: 16,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        field.errorText ?? "",
                                                        style: context
                                                            .textStyle
                                                            .s10
                                                            .w400
                                                            .roseRed
                                                            .raleway,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                h16,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: CustomButton(
                                    onTap: () {
                                      provider.resetPassword(context);
                                    },
                                    buttonText: appLocalization.send,
                                    isborderEnable: false,
                                  ),
                                ),
                                h16,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

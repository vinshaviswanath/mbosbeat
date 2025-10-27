import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  final int index;
  const ResetPasswordScreen({super.key, required this.index});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _submitted = false;
  String? passwordError;
  String? confirmPasswordError;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManagementProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorResources.transparent,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: ColorResources.indigoBlue,
              ),
            ),
            title: Text(
              "Reset Password",
              style: context.textStyle.s20.indigoBlue.bold.roboto,
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.sizeOf(context).width, 25),
              child: Container(color: Colors.white),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Text(
                      "New Password",
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    h4,
                    CustomTextField(
                      hint: "Enter New Password",
                      controller: passwordController,
                      backgroundColor: ColorResources.lightGray,
                      inputType: TextInputType.text,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: _submitted && passwordError != null
                          ? ColorResources.roseRed
                          : ColorResources.transparent,
                    ),
                    if (_submitted && passwordError != null) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.alertError, height: 16),
                          const SizedBox(width: 2),
                          Text(
                            passwordError!,
                            style: context.textStyle.s09.roseRed.w400.roboto,
                          ),
                        ],
                      ),
                    ],
                    h16,
                    Text(
                      "Confirm Password",
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    h4,
                    CustomTextField(
                      hint: "Confirm Password",
                      controller: confirmPasswordController,
                      backgroundColor: ColorResources.lightGray,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: _submitted && confirmPasswordError != null
                          ? ColorResources.roseRed
                          : ColorResources.transparent,
                    ),
                    if (_submitted && confirmPasswordError != null) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.alertError, height: 16),
                          const SizedBox(width: 2),
                          Text(
                            confirmPasswordError!,
                            style: context.textStyle.s09.roseRed.w400.roboto,
                          ),
                        ],
                      ),
                    ],
                    h16,
                  ]),
                ),
              ),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onTap: () {
                          setState(() {
                            _submitted = true;
                            passwordError = null;
                            confirmPasswordError = null;

                            if (passwordController.text.isEmpty) {
                              passwordError = "Please enter new password";
                            } else if (passwordController.text.length < 6) {
                              passwordError =
                                  "Password must be at least 6 characters";
                            }

                            if (confirmPasswordController.text.isEmpty) {
                              confirmPasswordError = "Please confirm password";
                            } else if (confirmPasswordController.text !=
                                passwordController.text) {
                              confirmPasswordError = "Passwords do not match";
                            }

                            if (passwordError == null &&
                                confirmPasswordError == null) {
                              final userList =
                                  provider.usersList?.userMasterList;
                              if (userList != null &&
                                  widget.index < userList.length) {
                                final userId = userList[widget.index].id;
                                if (userId != null) {
                                  provider
                                      .resetUserPassword(
                                        context: context,
                                        userId: userId,
                                        newPassword: passwordController.text,
                                      )
                                      .then((_) {
                                        passwordController.clear();
                                        confirmPasswordController.clear();
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                              context.pop();
                                            });
                                      });
                                }
                              }
                            }
                          });
                        },
                        buttonText: "Update Password",
                        isborderEnable: false,
                      ),
                      h24,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

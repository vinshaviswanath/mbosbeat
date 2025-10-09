import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/add_designation_widget.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/manage_user_screen.dart';

class UserCreationScreen extends StatefulWidget {
  final bool isUpdate;
  final UserModel? user;
  const UserCreationScreen({super.key, this.isUpdate = false, this.user});

  @override
  State<UserCreationScreen> createState() => _UserCreationScreenState();
}

class _UserCreationScreenState extends State<UserCreationScreen> {
  final userController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final whatsappController = TextEditingController();
  final designationController = TextEditingController();
  final reportingToController = TextEditingController();

  String? selectedDesignation;
  String? selectedReportingTo;

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate && widget.user != null) {
      final user = widget.user!;
      userController.text = user.name;
      phoneController.text = user.phone;
      emailController.text = user.email;
      passwordController.text = user.password;
      whatsappController.text = user.whatsAppNumber;

      selectedDesignation = user.designation;
      selectedReportingTo = user.reportingTo;
    }
  }

  @override
  void dispose() {
    userController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    whatsappController.dispose();
    designationController.dispose();
    reportingToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Consumer<UserManagementProvider>(
      builder: (context, provider, _) {
        final designationList = provider.designations
            .where((d) => d.status == "Active")
            .map((d) => d.userName)
            .toList();
        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              context.read<UserManagementProvider>().resetUserCreateForm();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorResources.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  color: ColorResources.indigoBlue,
                ),
              ),
              title: Text(
                appLocalizations.user_creation_screen_user_creation,
                style: context.textStyle.s20.indigoBlue.bold.roboto,
              ),
              centerTitle: true,
            ),
            body: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Text(
                        appLocalizations.user_creation_screen_enter_name,
                        style: context.textStyle.s12.bluishGray.w400.roboto,
                      ),
                      h4,
                      CustomTextField(
                        hint: appLocalizations.user_creation_screen_enter_name,
                        controller: userController,
                        autovalidateMode: provider.userCreateAutovalidateMode,
                        failure: provider.user.getFailure,
                        onChange: provider.updateUser,
                        backgroundColor: ColorResources.lightGray,
                        inputType: TextInputType.emailAddress,
                        borderRadius: 12,
                        hintColor: ColorResources.silverGray,
                        borderColor: ColorResources.transparent,
                      ),
                      h16,
                      Text(
                        appLocalizations.mobile_number,
                        style: context.textStyle.s12.bluishGray.w400.roboto,
                      ),
                      h4,
                      CustomTextField(
                        hint: appLocalizations.enter_mobile_number,
                        maxLength: 10,
                        controller: phoneController,
                        autovalidateMode: provider.userCreateAutovalidateMode,
                        failure: provider.phone.getFailure,
                        onChange: provider.updatePhone,
                        backgroundColor: ColorResources.lightGray,
                        inputType: TextInputType.phone,
                        borderRadius: 12,
                        hintColor: ColorResources.silverGray,
                        borderColor: ColorResources.transparent,
                      ),
                      h16,
                      Text(
                        appLocalizations.password,
                        style: context.textStyle.s12.bluishGray.w400.roboto,
                      ),
                      h4,
                      CustomTextField(
                        hint: appLocalizations.enter_password,
                        controller: passwordController,
                        autovalidateMode: provider.userCreateAutovalidateMode,
                        failure: provider.password.getFailure,
                        onChange: provider.updatePassword,
                        backgroundColor: ColorResources.lightGray,
                        inputType: TextInputType.visiblePassword,
                        borderRadius: 12,
                        hintColor: ColorResources.silverGray,
                        borderColor: ColorResources.transparent,
                      ),
                      h16,
                      Text(
                        appLocalizations.user_creation_screen_whatsapp_number,
                        style: context.textStyle.s12.bluishGray.w400.roboto,
                      ),
                      h4,
                      CustomTextField(
                        hint: appLocalizations
                            .user_creation_screen_enter_whatsapp_number,
                        maxLength: 10,
                        controller: whatsappController,
                        autovalidateMode: provider.userCreateAutovalidateMode,
                        failure: provider.whatsAppNumber.getFailure,
                        onChange: provider.updateWhatsAppNumber,
                        backgroundColor: ColorResources.lightGray,
                        inputType: TextInputType.phone,
                        borderRadius: 12,
                        hintColor: ColorResources.silverGray,
                        borderColor: ColorResources.transparent,
                      ),
                      h16,
                      Text(
                        appLocalizations.email_ID,
                        style: context.textStyle.s12.bluishGray.w400.roboto,
                      ),
                      h4,
                      CustomTextField(
                        hint: appLocalizations.enter_email,
                        controller: emailController,
                        autovalidateMode: provider.userCreateAutovalidateMode,
                        failure: provider.email.getFailure,
                        onChange: provider.updateEmail,
                        backgroundColor: ColorResources.lightGray,
                        inputType: TextInputType.emailAddress,
                        borderRadius: 12,
                        hintColor: ColorResources.silverGray,
                        borderColor: ColorResources.transparent,
                      ),
                      h16,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child:
                                //  CustomDropdown(
                                //   label: "Designation",
                                //   hintText: "Select Designation",
                                //   items: designationList,
                                //   value: provider.designation.value.fold(
                                //     (l) => null,
                                //     (r) => r,
                                //   ),
                                //   autovalidateMode:
                                //       provider.userCreateAutovalidateMode,
                                //   failure: provider.designation.getFailure,
                                //   onChanged: (value) {
                                //     provider.updateDesignation(value ?? '');
                                //   },
                                // ),
                                CustomDropdown(
                                  label: appLocalizations
                                      .user_creation_screen_designation,
                                  hintText: appLocalizations
                                      .user_creation_screen_select_designation,
                                  items: designationList,
                                  value: selectedDesignation,
                                  failure: provider.designation.getFailure,
                                  onChanged: (value) {
                                    setState(() => selectedDesignation = value);
                                    provider.updateDesignation(value ?? '');
                                  },
                                ),
                          ),
                          w8,
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  CustomDialog.showBottomCustomDialog(
                                    chid: AddDesignationWidget(
                                      designationController:
                                          designationController,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.add_circle,
                                  size: context.getSize.height * 0.03,
                                  color: ColorResources.indigoBlue,
                                ),
                              ),
                              provider.userCreateAutovalidateMode ==
                                      AutovalidateMode.disabled
                                  ? h10
                                  : h32,
                            ],
                          ),
                        ],
                      ),
                      h16,
                      CustomDropdown(
                        label:
                            appLocalizations.user_creation_screen_reporting_to,
                        hintText: appLocalizations
                            .user_creation_screen_choose_reporting_person,
                        items: const [
                          "Manager",
                          "Lead",
                          "Developer",
                          "Designer",
                          "Tester",
                          "HR",
                        ],
                        value: selectedReportingTo,
                        autovalidateMode: provider.userCreateAutovalidateMode,
                        failure: provider.reportingTo.getFailure,
                        onChanged: (value) {
                          setState(() => selectedReportingTo = value);
                          provider.updateReportingTo(value ?? '');
                        },
                      ),
                      h40,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              appLocalizations.help,
                              style: context.textStyle.s12.dustyBlue.bold.roboto
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        context.textStyle.dustyBlue.color,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                      h24,
                      CustomButton(
                        onTap: () {
                          if (widget.isUpdate && widget.user != null) {
                            final updatedUser = widget.user!.copyWith(
                              name: userController.text.trim(),
                              phone: phoneController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              whatsAppNumber: whatsappController.text.trim(),
                              designation: provider.designation.getValue ?? '',
                              reportingTo: provider.reportingTo.getValue ?? '',
                            );

                            provider.editUser(widget.user!.id, updatedUser);
                            Navigator.pop(context);
                          } else {
                            provider.submitUser(
                              context,
                              name: userController.text.trim(),
                              phone: phoneController.text.trim(),
                              password: passwordController.text.trim(),
                              whatsAppNumber: whatsappController.text.trim(),
                              email: emailController.text.trim(),
                            );
                          }
                        },
                        buttonText: widget.isUpdate
                            ? appLocalizations.update
                            : appLocalizations.save,
                        isborderEnable: false,
                      ),

                      h24,
                    ]),
                  ),
                ),
                // SliverFillRemaining(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 16),
                //     child: Column(
                //       children: [
                //         const Spacer(),
                //         CustomButton(
                //           onTap: () {
                //             if (widget.isUpdate) {
                //             } else {
                //               provider.submitUser(context);
                //               WidgetsBinding.instance.addPostFrameCallback((
                //                 timeStamp,
                //               ) {
                //                 userController.clear();
                //                 phoneController.clear();
                //                 emailController.clear();
                //                 passwordController.clear();
                //                 designationController.clear();
                //               });
                //             }
                //           },
                //           buttonText: widget.isUpdate ? "Update" : "Save",
                //           isborderEnable: false,
                //         ),
                //         gap24,
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}

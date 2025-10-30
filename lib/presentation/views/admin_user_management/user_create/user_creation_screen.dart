import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/user_designation_list_model.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/add_designation_widget.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown_type_generic.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCreationScreen extends StatefulWidget {
  final bool isUpdate;
  final UserMasterList? user;
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

  UserDesignationList? selectedDesignation;
  UserMasterList? selectedReportingTo;
  bool _submitted = false;

  Future<void> _loadData() async {
    final provider = Provider.of<UserManagementProvider>(
      context,
      listen: false,
    );
    if (mounted) {
      await provider.getDesignationList(context);
      await provider.getDesignationList(context);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadData());
    if (widget.isUpdate && widget.user != null) {
      final user = widget.user!;
      userController.text = user.name ?? '';
      phoneController.text = user.mobile ?? '';
      emailController.text = user.email ?? '';
      passwordController.text = user.passwordHash ?? '';
      whatsappController.text = user.whatsappNo ?? '';
      // selectedDesignation = user.designation ?? '';
      // selectedReportingTo = user.parentName ?? '';
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Consumer<UserManagementProvider>(
      builder: (context, provider, _) {
        final designationList =
            provider.designationList?.userDesignationList
                .where((d) => d.active == 1)
                .toList() ??
            [];

        final currentUserName = widget.isUpdate
            ? widget.user?.name?.trim()
            : null;

        final usersList =
            provider.usersList?.userMasterList
                .where(
                  (e) => e.active == 1 && e.name?.trim() != currentUserName,
                )
                .toList() ??
            [];

        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              context.read<UserManagementProvider>().resetUserCreateForm();
            }
          },
          child: Form(
            key: _formKey,
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
              body: RefreshIndicator(
                onRefresh: () async {
                  final provider = Provider.of<UserManagementProvider>(
                    context,
                    listen: false,
                  );

                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => _loadData(),
                  );
                  if (widget.isUpdate && widget.user != null) {
                    final user = widget.user!;
                    setState(() {
                      userController.text = user.name ?? '';
                      phoneController.text = user.mobile ?? '';
                      emailController.text = user.email ?? '';
                      passwordController.text = user.passwordHash ?? '';
                      whatsappController.text = user.whatsappNo ?? '';
                      selectedDesignation = provider
                          .designationList
                          ?.userDesignationList
                          .where((e) => e.id == user.id)
                          .firstOrNull;
                      selectedReportingTo = provider.usersList?.userMasterList
                          .where((e) => e.id == user.id)
                          .firstOrNull;
                    });
                  }
                },
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
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
                          TextFormField(
                            controller: userController,
                            decoration: InputDecoration(
                              hintText: appLocalizations
                                  .user_creation_screen_enter_name,
                              filled: true,
                              fillColor: ColorResources.lightGray,
                              hintStyle: const TextStyle(
                                color: ColorResources.silverGray,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: ColorResources.transparent,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color:
                                      _submitted && userController.text.isEmpty
                                      ? ColorResources.roseRed
                                      : Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: ColorResources.transparent,
                                ),
                              ),
                            ),
                            autovalidateMode:
                                provider.userCreateAutovalidateMode,
                            validator: (_) {
                              return null; // Disable built-in error display
                            },
                            keyboardType: TextInputType.emailAddress,
                            onChanged: provider.updateUser,
                          ),
                          if (_submitted && (userController.text.isEmpty)) ...[
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.alertError,
                                  height: 16,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "Please enter full name",
                                  style: context
                                      .textStyle
                                      .s10
                                      .w300
                                      .roseRed
                                      .raleway,
                                ),
                              ],
                            ),
                          ],
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
                            autovalidateMode:
                                provider.userCreateAutovalidateMode,
                            failure: provider.phone.getFailure,
                            onChange: provider.updatePhone,
                            backgroundColor: ColorResources.lightGray,
                            inputType: TextInputType.phone,
                            borderRadius: 12,
                            hintColor: ColorResources.silverGray,
                            borderColor: ColorResources.transparent,
                          ),
                          h16,
                          if (widget.isUpdate == false) ...[
                            Text(
                              appLocalizations.password,
                              style:
                                  context.textStyle.s12.bluishGray.w400.roboto,
                            ),
                            h4,
                            CustomTextField(
                              hint: appLocalizations.enter_password,
                              controller: passwordController,
                              autovalidateMode:
                                  provider.userCreateAutovalidateMode,
                              failure: provider.password.getFailure,
                              onChange: provider.updatePassword,
                              suffixIcon: InkWell(
                                onTap: () =>
                                    provider.toggleVisibilityPassword(),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                    provider.isVisiblePassword
                                        ? AppAssets.featherEyeOn
                                        : AppAssets.featherEyeOff,
                                    height: context.getSize.height * 0.02,
                                  ),
                                ),
                              ),
                              obscureText: !provider.isVisiblePassword,
                              backgroundColor: ColorResources.lightGray,
                              inputType: TextInputType.visiblePassword,
                              borderRadius: 12,
                              hintColor: ColorResources.silverGray,
                              borderColor: ColorResources.transparent,
                            ),
                            h16,
                          ],
                          Text(
                            appLocalizations
                                .user_creation_screen_whatsapp_number,
                            style: context.textStyle.s12.bluishGray.w400.roboto,
                          ),
                          h4,
                          CustomTextField(
                            hint: appLocalizations
                                .user_creation_screen_enter_whatsapp_number,
                            maxLength: 10,
                            controller: whatsappController,
                            autovalidateMode:
                                provider.userCreateAutovalidateMode,
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
                            autovalidateMode:
                                provider.userCreateAutovalidateMode,
                            failure: provider.email.getFailure,
                            onChange: provider.updateEmail,
                            backgroundColor: ColorResources.lightGray,
                            inputType: TextInputType.emailAddress,
                            borderRadius: 12,
                            hintColor: ColorResources.silverGray,
                            borderColor: ColorResources.transparent,
                          ),
                          h16,
                          Text(
                            appLocalizations.user_creation_screen_designation,
                            style: context.textStyle.s12.bluishGray.w400.roboto,
                          ),
                          h4,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child:
                                    // CustomDropdownTypeGeneric<UserDesignationList>(
                                    //   label: appLocalizations
                                    //       .user_creation_screen_designation,
                                    //   hintText: appLocalizations
                                    //       .user_creation_screen_select_designation,
                                    //   items: designationList,
                                    //   value: selectedDesignation,
                                    //   failure: provider.designation.getFailure,
                                    //   onChanged: (value) {
                                    //     setState(() => selectedDesignation = value);
                                    //     provider.updateDesignation(value?.name ?? '');
                                    //     Logger.logSuccess(
                                    //       "Designation Id : ${selectedDesignation?.id}",
                                    //     );
                                    //   },
                                    // ),
                                    DropdownButtonFormField<
                                      UserDesignationList
                                    >(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: ColorResources.lightGray,

                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 14,
                                            ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          borderSide: BorderSide(
                                            color:
                                                _submitted &&
                                                    selectedDesignation == null
                                                ? ColorResources.roseRed
                                                : Colors.transparent,
                                            width: 1.5,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          borderSide: const BorderSide(
                                            color: ColorResources.roseRed,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                      ),
                                      isExpanded: true,
                                      style: context.textStyle.s12,
                                      // validator: (value) {
                                      //   if (value == null) {
                                      //     return "Please select designation";
                                      //   }
                                      //   return null;
                                      // },
                                      value: widget.isUpdate
                                          ? designationList.firstWhere(
                                              (e) =>
                                                  e.id ==
                                                  widget.user?.designationId,
                                              orElse: () =>
                                                  designationList.first,
                                            )
                                          : null,
                                      hint: Text(
                                        appLocalizations
                                            .user_creation_screen_choose_reporting_person,
                                        style: context.textStyle.s14.silverGray,
                                      ),
                                      items: designationList.map((user) {
                                        return DropdownMenuItem(
                                          value: user,
                                          child: Text(user.name ?? ''),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(
                                          () => selectedDesignation = value,
                                        );
                                        provider.updateReportingTo(
                                          value?.name ?? '',
                                        );
                                        Logger.logSuccess(
                                          "Desig ID : ${selectedDesignation?.id}",
                                        );
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
                          if (_submitted && selectedDesignation == null) ...[
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.alertError,
                                  height: 16,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "Please select designation",
                                  style: context
                                      .textStyle
                                      .s10
                                      .w300
                                      .roseRed
                                      .raleway,
                                ),
                              ],
                            ),
                          ],
                          h16,
                          // CustomDropdownTypeGeneric<UserMasterList>(
                          //   label: appLocalizations
                          //       .user_creation_screen_reporting_to,
                          //   hintText: appLocalizations
                          //       .user_creation_screen_choose_reporting_person,
                          //   items: usersList,
                          //   value: usersList.contains(selectedReportingTo)
                          //       ? selectedReportingTo
                          //       : null,
                          //   autovalidateMode: provider.userCreateAutovalidateMode,
                          //   failure: provider.reportingTo.getFailure,
                          //   onChanged: (value) {
                          //     setState(() => selectedReportingTo = value);
                          //     provider.updateReportingTo(value.name ?? '');
                          //     Logger.logSuccess(
                          //       "RePORT ID : ${selectedReportingTo?.id}",
                          //     );
                          //   },
                          // ),
                          Text(
                            appLocalizations.user_creation_screen_reporting_to,
                            style: context.textStyle.s12.bluishGray.w400.roboto,
                          ),
                          h4,
                          DropdownButtonFormField<UserMasterList>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorResources.lightGray,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color:
                                      _submitted && selectedDesignation == null
                                      ? ColorResources.roseRed
                                      : Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: ColorResources.roseRed,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            isExpanded: true,
                            style: context.textStyle.s12,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // validator: (value) {
                            //   if (value == null) {
                            //     return "Please select reporting person";
                            //   }
                            //   return null;
                            // },
                            initialValue: widget.isUpdate
                                ? usersList.firstWhere(
                                    (e) => e.id == widget.user?.parentId,
                                    orElse: () => usersList.first,
                                  )
                                : null,
                            hint: Text(
                              appLocalizations
                                  .user_creation_screen_choose_reporting_person,
                              style: context.textStyle.s14.silverGray,
                            ),
                            items: usersList.map((user) {
                              return DropdownMenuItem(
                                value: user,
                                child: Text(user.name ?? ''),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() => selectedReportingTo = value);
                              provider.updateReportingTo(value?.name ?? '');
                              Logger.logSuccess(
                                "RePORT ID : ${selectedReportingTo?.id}",
                              );
                            },
                          ),
                          if (_submitted &&
                              selectedReportingTo == null &&
                              provider
                                  .designationList!
                                  .userDesignationList
                                  .isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.alertError,
                                  height: 16,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "Please select reporting person",
                                  style: context
                                      .textStyle
                                      .s10
                                      .w300
                                      .roseRed
                                      .raleway,
                                ),
                              ],
                            ),
                          ],

                          h40,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  appLocalizations.help,
                                  style: context
                                      .textStyle
                                      .s12
                                      .dustyBlue
                                      .bold
                                      .roboto
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
                              setState(() => _submitted = true);
                              if (_formKey.currentState!.validate()) {
                                if (widget.isUpdate && widget.user != null) {
                                  Logger.logSuccess(
                                    "REP ID : ${selectedReportingTo!.id!} ",
                                  );
                                  final pref = sl<SharedPreferences>();
                                  final customerId =
                                      pref.getInt('customerId') ?? 0;
                                  if (selectedDesignation != null) {
                                    provider
                                        .createUser(
                                          context: context,
                                          id: widget.user?.id ?? 0,
                                          customerId: customerId,
                                          fullName: userController.text,
                                          mobile: phoneController.text,
                                          whatsappNo: whatsappController.text,
                                          email: emailController.text,
                                          designationId:
                                              selectedDesignation!.id!,
                                          paretId: selectedReportingTo!.id!,
                                          userName: userController.text,
                                          password: passwordController.text,
                                          active: 1,
                                        )
                                        .then((_) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                                userController.clear();
                                                phoneController.clear();
                                                emailController.clear();
                                                passwordController.clear();
                                                whatsappController.clear();
                                                designationController.clear();
                                                reportingToController.clear();
                                              });
                                        });
                                  }
                                } else {
                                  final pref = sl<SharedPreferences>();
                                  final customerId =
                                      pref.getInt('customerId') ?? 0;
                                  provider
                                      .createUser(
                                        context: context,
                                        id: 0,
                                        customerId: customerId,
                                        fullName: userController.text,
                                        mobile: phoneController.text,
                                        whatsappNo: whatsappController.text,
                                        email: emailController.text,
                                        designationId: selectedDesignation!.id!,
                                        paretId: selectedReportingTo?.id! ?? 0,
                                        userName: userController.text,
                                        password: passwordController.text,
                                        active: 1,
                                      )
                                      .then((_) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                              userController.clear();
                                              phoneController.clear();
                                              emailController.clear();
                                              passwordController.clear();
                                              whatsappController.clear();
                                              designationController.clear();
                                              reportingToController.clear();
                                            });
                                      });
                                }
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

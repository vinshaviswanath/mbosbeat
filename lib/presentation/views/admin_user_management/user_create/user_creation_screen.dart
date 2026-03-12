import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/user_designation_list_model.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/add_designation_widget.dart';
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
  bool _nameFieldTouched = false;

  Future<void> _loadData() async {
    final provider = Provider.of<UserManagementProvider>(
      context,
      listen: false,
    );
    if (mounted) {
      await provider.getDesignationList(context);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadData();
      await Future.delayed(Duration.zero);
      _initializeUpdateData();
    });
  }

  void _initializeUpdateData() {
    if (!(widget.isUpdate && widget.user != null)) return;

    final provider = context.read<UserManagementProvider>();
    final user = widget.user!;

    UserDesignationList? foundDesignation;
    if (provider.designationList?.userDesignationList != null) {
      try {
        foundDesignation = provider.designationList!.userDesignationList
            .firstWhere((e) => e.id == user.designationId);
      } catch (e) {
        foundDesignation = null;
      }
    }

    // safe find for reportingTo
    UserMasterList? foundReportingTo;
    if (provider.usersList?.userMasterList != null) {
      try {
        foundReportingTo = provider.usersList!.userMasterList.firstWhere(
          (e) => e.id == user.parentId,
        );
      } catch (e) {
        foundReportingTo = null;
      }
    }
    provider.updateSelectedDesignation(foundDesignation);
    provider.updateSelectedReportingTo(foundReportingTo);
    userController.text = user.name ?? '';
    phoneController.text = user.mobile ?? '';
    whatsappController.text = user.whatsappNo ?? '';
    passwordController.text = user.passwordHash ?? '';
    emailController.text = user.email ?? '';
  }

  void _submitForm() async {
    final pref = sl<SharedPreferences>();
    final customerId = pref.getInt('customerId') ?? 0;

    final provider = context.read<UserManagementProvider>();

    setState(() => _submitted = true);

    // Form validation
    if (!_formKey.currentState!.validate()) return;

    // Custom validations
    if (provider.selectedDesignation == null ||
        provider.selectedReportingTo == null ||
        !provider.user.isValid() ||
        (!provider.password.isValid() &&
            passwordController.text.trim().length < 3)) {
      return;
    }

    // API Call
    await provider.createUser(
      context: context,
      id: widget.isUpdate ? widget.user?.id ?? 0 : 0,
      customerId: customerId,
      fullName: userController.text.trim(),
      mobile: phoneController.text.trim(),
      whatsappNo: whatsappController.text.trim(),
      email: emailController.text.trim(),
      designationId: provider.selectedDesignation!.id!,
      paretId: provider.selectedReportingTo!.id!,
      userName: emailController.text.trim(),
      password: passwordController.text.trim(),
      active: 1,
    );

    // ❗ Do not clear fields here
    // Provider handles success case
  }

  void _clearFields() {
    final provider = context.read<UserManagementProvider>();
    _formKey.currentState?.reset();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // userController.clear();
      // phoneController.clear();
      // emailController.clear();
      // passwordController.clear();
      // whatsappController.clear();

      setState(() {
        _submitted = false;
        _nameFieldTouched = false;
      });

      // provider.updateSelectedDesignation(null);
      // provider.updateSelectedReportingTo(null);

      provider.userCreateAutovalidateMode = AutovalidateMode.disabled;
      provider.resetUserCreateForm();
      provider.resetVisibilityPassword();
    });
  }

  final FocusNode field1 = FocusNode();
  final FocusNode field2 = FocusNode();
  final FocusNode field3 = FocusNode();
  final FocusNode field4 = FocusNode();
  final FocusNode field5 = FocusNode();
  final FocusNode field6 = FocusNode();
  final FocusNode field7 = FocusNode();

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
                .where((e) => e.active == 1 && e.name!.toLowerCase() != "admin")
                .toList() ??
            [];
        final usersList =
            provider.usersList?.userMasterList
                .where((e) => e.active == 1 && e.id != widget.user?.id)
                .toList() ??
            [];
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (provider.selectedDesignation != null &&
              !designationList.contains(provider.selectedDesignation)) {
            provider.updateSelectedDesignation(null);
          }

          if (provider.selectedReportingTo != null &&
              !usersList.contains(provider.selectedReportingTo)) {
            provider.updateSelectedReportingTo(null);
          }
        });
        final bool showNameErrorBorder =
            _submitted && userController.text.trim().isEmpty;

        final bool isPasswordInvalid =
            _submitted &&
            (passwordController.text.trim().isEmpty ||
                passwordController.text.trim().length < 3);

        final bool isEmailInvalid =
            _submitted &&
            (emailController.text.trim().isEmpty ||
                !RegExp(
                  r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(emailController.text.trim()));

        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              context.read<UserManagementProvider>().resetUserCreateForm();
              provider.resetVisibilityPassword();
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
              body: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Text(
                        //   appLocalizations.user_creation_screen_enter_name,
                        //   style: context.textStyle.s12.bluishGray.w400.roboto,
                        // ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    appLocalizations.user_creation_screen_name,
                                style: context
                                    .textStyle
                                    .s12
                                    .bluishGray
                                    .w400
                                    .roboto,
                              ),
                              TextSpan(
                                text: '*',
                                style:
                                    context.textStyle.s12.roseRed.w400.roboto,
                              ),
                            ],
                          ),
                        ),
                        h4,
                        TextFormField(
                          focusNode: field1,
                          controller: userController,
                          onFieldSubmitted: (value) =>
                              FocusScope.of(context).requestFocus(field2),
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
                                color: showNameErrorBorder
                                    ? ColorResources.roseRed
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: showNameErrorBorder
                                    ? ColorResources.roseRed
                                    : ColorResources.transparent,
                              ),
                            ),
                          ),
                          autovalidateMode: provider.userCreateAutovalidateMode,
                          validator: (_) {
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            provider.updateUser(value);
                            setState(() {
                              _nameFieldTouched = true;
                            });
                          },
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
                                appLocalizations.user_creation_enter_full_name,
                                style:
                                    context.textStyle.s10.w300.roseRed.raleway,
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
                          focusNode: field2,
                          hint: appLocalizations.enter_mobile_number,
                          maxLength: 10,
                          onFieldSubmitted: (value) =>
                              FocusScope.of(context).requestFocus(field3),
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
                        // if (widget.isUpdate == false) ...[
                        Text(
                          appLocalizations.password,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        h4,
                        CustomTextField(
                          hint: appLocalizations.enter_password,
                          controller: passwordController,
                          focusNode: field3,
                          onFieldSubmitted: (value) =>
                              FocusScope.of(context).requestFocus(field4),
                          autovalidateMode: provider.userCreateAutovalidateMode,
                          onChange: provider.updatePassword,
                          suffixIcon: InkWell(
                            onTap: () => provider.toggleVisibilityPassword(),
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

                          /// 🔴 border validation like Name field
                          borderColor: isPasswordInvalid
                              ? ColorResources.roseRed
                              : ColorResources.transparent,
                        ),
                        h4,
                        if (isPasswordInvalid) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.alertError,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                passwordController.text.trim().isEmpty
                                    ? appLocalizations.enter_password
                                    : appLocalizations
                                          .password_must_be_at_least_3_characters,
                                style:
                                    context.textStyle.s10.w300.roseRed.raleway,
                              ),
                            ],
                          ),
                        ],

                        h16,
                        // ],
                        Text(
                          appLocalizations.user_creation_screen_whatsapp_number,
                          style: context.textStyle.s12.bluishGray.w400.roboto,
                        ),
                        h4,
                        CustomTextField(
                          hint: appLocalizations
                              .user_creation_screen_enter_whatsapp_number,
                          maxLength: 10,
                          focusNode: field4,
                          onFieldSubmitted: (value) =>
                              FocusScope.of(context).requestFocus(field5),
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
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: appLocalizations.email_ID,
                                style: context
                                    .textStyle
                                    .s12
                                    .bluishGray
                                    .w400
                                    .roboto,
                              ),
                              TextSpan(
                                text: '*',
                                style:
                                    context.textStyle.s12.roseRed.w400.roboto,
                              ),
                            ],
                          ),
                        ),

                        h4,
                        CustomTextField(
                          hint: appLocalizations.enter_email,
                          controller: emailController,
                          focusNode: field5,
                          onFieldSubmitted: (value) =>
                              FocusScope.of(context).requestFocus(field6),
                          autovalidateMode: provider.userCreateAutovalidateMode,
                          failure: provider.email.getFailure,
                          onChange: provider.updateEmail,
                          backgroundColor: ColorResources.lightGray,
                          inputType: TextInputType.emailAddress,
                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: isEmailInvalid
                              ? ColorResources.roseRed
                              : ColorResources.transparent,
                        ),
                        h4,
                        // Text(
                        //   appLocalizations.user_creation_screen_designation,
                        //   style: context.textStyle.s12.bluishGray.w400.roboto,
                        // ),
                        if (isEmailInvalid) ...[
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.alertError,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                emailController.text.trim().isEmpty
                                    ? appLocalizations.enter_email
                                    : "Enter a valid email id",
                                style:
                                    context.textStyle.s10.w300.roseRed.raleway,
                              ),
                            ],
                          ),
                        ],
                        h16,
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: appLocalizations
                                    .user_creation_screen_designation,
                                style: context
                                    .textStyle
                                    .s12
                                    .bluishGray
                                    .w400
                                    .roboto,
                              ),
                              TextSpan(
                                text: '*',
                                style:
                                    context.textStyle.s12.roseRed.w400.roboto,
                              ),
                            ],
                          ),
                        ),
                        h4,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownButtonFormField<UserDesignationList>(
                                    dropdownColor: ColorResources.white,
                                    borderRadius: BorderRadius.circular(10),
                                    focusNode: field6,
                                    onSaved: (value) => FocusScope.of(
                                      context,
                                    ).requestFocus(field7),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: ColorResources.lightGray,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 14,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color:
                                              _submitted &&
                                                  provider.selectedDesignation ==
                                                      null
                                              ? ColorResources.roseRed
                                              : Colors.transparent,
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color:
                                              _submitted &&
                                                  provider.selectedDesignation ==
                                                      null
                                              ? ColorResources.roseRed
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    initialValue: provider.selectedDesignation,
                                    hint: Text(
                                      appLocalizations
                                          .user_creation_screen_select_designation,
                                      style: context.textStyle.s14.silverGray,
                                    ),
                                    items: designationList.map((d) {
                                      return DropdownMenuItem(
                                        value: d,
                                        child: Text(d.name ?? ''),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      provider.updateSelectedDesignation(value);
                                    },
                                  ),

                                  /// ERROR TEXT (if submitted & empty)
                                  if (_submitted &&
                                      provider.selectedDesignation == null) ...[
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.alertError,
                                          height: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          appLocalizations
                                              .user_creation_please_select_designation,
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
                                ],
                              ),
                            ),

                            const SizedBox(width: 8),

                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    CustomDialog.showBottomCustomDialog(
                                      child: AddDesignationWidget(
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
                                !_submitted ||
                                        _submitted &&
                                            (provider.selectedDesignation !=
                                                null)
                                    ? h10
                                    : h32,
                              ],
                            ),
                          ],
                        ),
                        h16,
                        // Text(
                        //   appLocalizations.user_creation_screen_reporting_to,
                        //   style: context.textStyle.s12.bluishGray.w400.roboto,
                        // ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: appLocalizations
                                    .user_creation_screen_reporting_to,
                                style: context
                                    .textStyle
                                    .s12
                                    .bluishGray
                                    .w400
                                    .roboto,
                              ),
                              TextSpan(
                                text: '*',
                                style:
                                    context.textStyle.s12.roseRed.w400.roboto,
                              ),
                            ],
                          ),
                        ),
                        h4,
                        DropdownButtonFormField<UserMasterList>(
                          dropdownColor: ColorResources.white,
                          borderRadius: BorderRadius.circular(10),
                          focusNode: field7,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorResources.lightGray,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color:
                                    _submitted &&
                                        provider.selectedReportingTo == null
                                    ? ColorResources.roseRed
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color:
                                    _submitted &&
                                        provider.selectedReportingTo == null
                                    ? ColorResources.roseRed
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          initialValue:
                              usersList
                                  .where(
                                    (e) =>
                                        e.id ==
                                        provider.selectedReportingTo?.id,
                                  )
                                  .isNotEmpty
                              ? usersList.firstWhere(
                                  (e) =>
                                      e.id == provider.selectedReportingTo?.id,
                                )
                              : null,
                          hint: Text(
                            appLocalizations
                                .user_creation_screen_choose_reporting_person,
                            style: context.textStyle.s14.silverGray,
                          ),
                          items: usersList.map((u) {
                            return DropdownMenuItem(
                              value: u,
                              child: Text(u.name ?? ''),
                            );
                          }).toList(),
                          onChanged: (value) {
                            provider.updateSelectedReportingTo(value);
                          },
                        ),

                        if (_submitted &&
                            provider.selectedReportingTo == null) ...[
                          SizedBox(height: 4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.alertError,
                                height: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                appLocalizations
                                    .user_creation_please_select_reporting_person,
                                style:
                                    context.textStyle.s10.w300.roseRed.raleway,
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
                          onTap: _submitForm,
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
        );
      },
    );
  }
}

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
    emailController.text = user.email ?? '';
  }

  void _submitForm() async {
    setState(() => _submitted = true);

    final provider = context.read<UserManagementProvider>();
    if (!_formKey.currentState!.validate()) return;

    if (provider.selectedDesignation == null ||
        provider.selectedReportingTo == null ||
        !provider.user.isValid()) {
      return;
    }

    final pref = sl<SharedPreferences>();
    final customerId = pref.getInt('customerId') ?? 0;

    if (widget.isUpdate && widget.user != null) {
      await provider.createUser(
        context: context,
        id: widget.user?.id ?? 0,
        customerId: customerId,
        fullName: userController.text,
        mobile: phoneController.text,
        whatsappNo: whatsappController.text,
        email: emailController.text,
        designationId: provider.selectedDesignation!.id!,
        paretId: provider.selectedReportingTo!.id!,
        userName: userController.text,
        password: passwordController.text,
        active: 1,
      );

      provider.updateUser('');
      _clearFields();
      return;
    }

    await provider.createUser(
      context: context,
      id: 0,
      customerId: customerId,
      fullName: userController.text,
      mobile: phoneController.text,
      whatsappNo: whatsappController.text,
      email: emailController.text,
      designationId: provider.selectedDesignation!.id!,
      paretId: provider.selectedReportingTo!.id!,
      userName: userController.text,
      password: passwordController.text,
      active: 1,
    );

    provider.updateUser('');
    _clearFields();
  }

  void _clearFields() {
    final provider = context.read<UserManagementProvider>();
    _formKey.currentState?.reset();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      userController.clear();
      phoneController.clear();
      emailController.clear();
      passwordController.clear();
      whatsappController.clear();

      setState(() {
        _submitted = false;
        _nameFieldTouched = false;
      });

      provider.updateSelectedDesignation(null);
      provider.updateSelectedReportingTo(null);

      provider.userCreateAutovalidateMode = AutovalidateMode.disabled;
      provider.resetUserCreateForm();
      provider.resetVisibilityPassword();
    });
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
                ?.where(
                  (e) => e.active == 1 && e.name!.toLowerCase() != "admin",
                )
                .toList() ??
            [];

        if (provider.selectedDesignation != null &&
            !designationList.contains(provider.selectedDesignation)) {
          provider.updateSelectedDesignation(null);
        }

        final usersList =
            provider.usersList?.userMasterList
                ?.where((e) => e.active == 1 && e.id != widget.user?.id)
                .toList() ??
            [];

        if (provider.selectedReportingTo != null &&
            !usersList.contains(provider.selectedReportingTo)) {
          provider.updateSelectedReportingTo(null);
        }

        final bool showNameErrorBorder =
            (_submitted && _nameFieldTouched && userController.text.isEmpty);

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
                            return null; // Disable built-in error display
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
                        if (widget.isUpdate == false) ...[
                          Text(
                            appLocalizations.password,
                            style: context.textStyle.s12.bluishGray.w400.roboto,
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
                            borderColor: ColorResources.transparent,
                          ),
                          h16,
                        ],
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
                        // Text(
                        //   appLocalizations.user_creation_screen_designation,
                        //   style: context.textStyle.s12.bluishGray.w400.roboto,
                        // ),
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
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
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
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          initialValue: provider.selectedReportingTo,
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

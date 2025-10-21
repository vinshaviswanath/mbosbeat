import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/domain/request/company_creation_params.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class CompanyInfoWidget extends StatefulWidget {
  const CompanyInfoWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<CompanyInfoWidget> createState() => _CompanyInfoWidgetState();
}

class _CompanyInfoWidgetState extends State<CompanyInfoWidget> {
  late TextEditingController compnyNameController;
  late TextEditingController displayNameController;
  late TextEditingController address1Controller;
  late TextEditingController address2Controller;
  late TextEditingController address3Controller;
  late TextEditingController pincodeController;
  late TextEditingController countrytController;
  late TextEditingController stateController;
  late TextEditingController regTypeController;

  @override
  void initState() {
    super.initState();
    compnyNameController = TextEditingController();
    displayNameController = TextEditingController();
    address1Controller = TextEditingController();
    address2Controller = TextEditingController();
    address3Controller = TextEditingController();
    pincodeController = TextEditingController();
    countrytController = TextEditingController();
    stateController = TextEditingController();
    regTypeController = TextEditingController();

    final provider = context.read<CompanyCreationProvider>();
    provider.fectchCountryList(context);
  }

  @override
  Widget build(BuildContext context) {
    //String? selectedReportingTo;
    final appLocalizations = context.l10n;
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        final countries = provider.countries;
        final items = countries
            .map((e) => e.countryName.trim())
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList();

        final selectedValue =
            items.contains(provider.selectedCountry?.countryName)
            ? provider.selectedCountry?.countryName
            : null;

        final stateItems = provider.statelists
            .map((e) => e.stateName.trim())
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList();

        final selectedStateValue =
            stateItems.contains(provider.selectedState?.stateName)
            ? provider.selectedState?.stateName
            : null;

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appLocalizations.sign_up_company_name,
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    h4,
                    CustomTextField(
                      controller: compnyNameController,
                      hint: appLocalizations.sign_up_enter_company_name,
                      hintTextStyle: context.textStyle.s12.silverGray.w300,
                      backgroundColor: ColorResources.lightGray,
                      onChange: provider.updateCompanyName,
                      inputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                      autovalidateMode: provider.companyinfoAutovalidateMode,
                      failure: provider.companyName.getFailure,
                    ),
                    h16,
                    Text(
                      appLocalizations.company_info_widget_display_name,
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    h4,
                    CustomTextField(
                      hint: appLocalizations
                          .company_info_widget_enter_display_name,
                      hintTextStyle: context.textStyle.s12.silverGray.w300,
                      controller: displayNameController,
                      backgroundColor: ColorResources.lightGray,
                      onChange: provider.updateDisplayName,
                      inputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                      autovalidateMode: provider.companyinfoAutovalidateMode,
                      failure: provider.displayName.getFailure,
                    ),
                    h16,

                    Text(
                      appLocalizations.company_info_widget_address_1,
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    h4,
                    CustomTextField(
                      hint: appLocalizations.company_info_widget_enter_address,
                      hintTextStyle: context.textStyle.s12.silverGray.w300,
                      controller: address1Controller,
                      backgroundColor: ColorResources.lightGray,
                      onChange: provider.updateAddress1,
                      inputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                      autovalidateMode: provider.companyinfoAutovalidateMode,
                      failure: provider.address1.getFailure,
                    ),
                    h16,

                    Text(
                      appLocalizations.company_info_widget_address_2,
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    h4,
                    CustomTextField(
                      hint: appLocalizations.company_info_widget_enter_address,
                      hintTextStyle: context.textStyle.s12.silverGray.w300,
                      controller: address2Controller,
                      backgroundColor: ColorResources.lightGray,
                      inputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                    ),
                    h16,

                    Text(
                      appLocalizations.company_info_widget_address_3,
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    h4,
                    CustomTextField(
                      hint: appLocalizations.company_info_widget_enter_address,
                      hintTextStyle: context.textStyle.s12.silverGray.w300,
                      controller: address3Controller,
                      backgroundColor: ColorResources.lightGray,
                      inputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                    ),
                    h16,
                    Text(
                      appLocalizations.company_info_widget_pincode,
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    CustomTextField(
                      hint: appLocalizations.company_info_widget_enter_pincode,
                      hintTextStyle: context.textStyle.s12.silverGray.w300,
                      controller: pincodeController,
                      backgroundColor: ColorResources.lightGray,
                      autovalidateMode: provider.companyinfoAutovalidateMode,
                      failure: provider.pincode.getFailure,
                      onChange: provider.updatePincode,
                      inputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                    ),
                    h16,
                    // Country & State side-by-side
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdown(
                            label: appLocalizations.company_info_widget_country,
                            hintText: appLocalizations
                                .company_info_widget_enter_country,
                            items: items,
                            value: selectedValue,

                            onChanged: (value) {
                              if (value != null) {
                                final selected = countries.firstWhere(
                                  (element) =>
                                      element.countryName.trim() ==
                                      value.trim(),
                                );
                                provider.selectCountry(context, selected);
                                provider.updateCountry(value);
                              }
                            },
                            autovalidateMode:
                                provider.companyinfoAutovalidateMode,
                            failure: provider.country.getFailure,
                          ),
                        ),
                        w12,
                        Expanded(
                          child: CustomDropdown(
                            autovalidateMode:
                                provider.companyinfoAutovalidateMode,
                            failure: provider.countryState.getFailure,
                            label: appLocalizations.company_info_widget_state,
                            hintText: appLocalizations
                                .company_info_widget_enter_address,
                            items: stateItems,
                            value: selectedStateValue,

                            onChanged: (value) {
                              if (value != null) {
                                final selectedState = provider.statelists
                                    .firstWhere(
                                      (e) => e.stateName.trim() == value.trim(),
                                    );
                                provider.selectState(selectedState);
                                provider.updateCountryState(value);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    h16,

                    Text(
                      appLocalizations.company_info_widget_registration_type,
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    h4,
                    CustomTextField(
                      hint: appLocalizations
                          .company_info_widget_enter_registration_type,
                      hintTextStyle: context.textStyle.s12.silverGray.w300,
                      backgroundColor: ColorResources.lightGray,
                      onChange: provider.updateRegType,
                      inputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                      autovalidateMode: provider.companyinfoAutovalidateMode,
                      failure: provider.registrationType.getFailure,
                      controller: regTypeController,
                    ),
                    h40,
                    CustomButton(
                      buttonText: appLocalizations.company_info_widget_next,
                      isborderEnable: false,
                      onTap: () async {
                        provider.companyinfo(
                          onSuccess: widget.onTap,
                          context,
                          params: CompanyInfoParams(
                            id: 0,
                            companyCode: "1",
                            companyName: compnyNameController.text,
                            displayName: displayNameController.text,
                            address1: address1Controller.text,
                            address2: address2Controller.text,
                            address3: address3Controller.text,
                            pincode: pincodeController.text,
                            countryId:
                                provider.selectedCountry?.id.toString() ?? '',
                            stateId:
                                provider.selectedState?.id.toString() ?? "",
                            regType: regTypeController.text,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

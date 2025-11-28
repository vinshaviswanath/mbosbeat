import 'package:flutter/services.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/data/country_list_data.dart';
import 'package:mpos_beat/data/models/data/registration_type_data.dart';
import 'package:mpos_beat/data/models/data/state_list_data.dart';
import 'package:mpos_beat/domain/request/company_creation_params.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class CompanyInfoWidget extends StatefulWidget {
  final Company? companyData;
  const CompanyInfoWidget({super.key, this.onTap, this.companyData});
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
       final provider = context.read<CompanyCreationProvider>();
       //to keep all controller values when back from vouchertab
  compnyNameController = TextEditingController(
    text: widget.companyData?.companyName ??"",
  );

  displayNameController = TextEditingController(
    text: widget.companyData?.mailingName ??  "",
  );

  address1Controller = TextEditingController(
    text: widget.companyData?.address1 ??  "",
  );

  address2Controller = TextEditingController(
    text: widget.companyData?.address2 ??"",
  );

  address3Controller = TextEditingController(
    text: widget.companyData?.address3 ?? "",
  );

  pincodeController = TextEditingController(
    text: widget.companyData?.pinCode ??  "",
  );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
   if (widget.companyData == null) {
        provider.clearSelections();
      }

      await provider.fectchCountryList(context);
    
      fillfeilds();
      print(" company data in compnay info ${widget.companyData?.id}");
    });
  }

  void fillfeilds() async {
    if (widget.companyData == null) return;

    final provider = context.read<CompanyCreationProvider>();

    compnyNameController.text = widget.companyData!.companyName ?? "";
    displayNameController.text = widget.companyData!.mailingName ?? "";
    address1Controller.text = widget.companyData!.address1 ?? "";
    address2Controller.text = widget.companyData!.address2 ?? "";
    address3Controller.text = widget.companyData!.address3 ?? "";
    pincodeController.text = widget.companyData!.pinCode ?? "";

    debugPrint(
      " fillFields(): Starting for company ID: ${widget.companyData!.id}",
    );
    debugPrint(
      "   → country: ${widget.companyData!.country}, state: ${widget.companyData!.state}, regType: ${widget.companyData!.regType}",
    );

    if (provider.countries.isEmpty) {
      debugPrint(" No countries loaded yet");
      return;
    }

    // Select Country

    final selectedCountry = provider.countries.firstWhere(
      (c) => c.id.toString() == widget.companyData!.country.toString(),
      orElse: () => CountryListData(
        id: 0,
        countryName: "Unknown",
        stateTitle: "",
        pinTitle: "",
        currency: "",
        altCurrency: null,
        currencyNod: 0,
        currencySymbol: null,
        taxApplicable: null,
        taxType: null,
        taxRegNoTitle: "",
        cessApplicable: null,
        exciseApplicable: null,
      ),
    );

    if (selectedCountry.id == 0) {
      debugPrint(" Country not found for ID: ${widget.companyData!.country}");
      return;
    }

    debugPrint("Country found: ${selectedCountry.countryName}");
    provider.selectCountry(context, selectedCountry);

    //Fetch and Select State

    await provider.fetchStateList(context, selectedCountry.id);
    await Future.delayed(const Duration(milliseconds: 200));

    final selectedState = provider.statelists.firstWhere(
      (s) => s.id.toString() == widget.companyData!.state.toString(),
      orElse: () => StateListData(id: 0, stateName: 'Unknown', countryId: 0),
    );

    if (selectedState.id != 0) {
      provider.selectState(selectedState);
      debugPrint(" State found: ${selectedState.stateName}");
    } else {
      debugPrint(" No state found for ID: ${widget.companyData!.state}");
    }

    //  Fetch and Select RegType
    await provider.getRegistrationType(context, selectedCountry.id);
    await Future.delayed(const Duration(milliseconds: 200));

    final selectedRegType = provider.registrationlists.firstWhere(
      (r) => r.id.toString() == widget.companyData!.regType.toString(),
      orElse: () =>
          RegistrationTypeData(id: 0, countryId: 0, registrationType: ''),
    );

    if (selectedRegType.id != 0) {
      provider.selectRegistrationType(selectedRegType);
      debugPrint(
        " Registration type found: ${selectedRegType.registrationType}",
      );
    } else {
      debugPrint(
        " No registration type found for ID: ${widget.companyData!.regType}",
      );
    }

    debugPrint("🎯 Field filling completed.");

    provider.updateCompanyName(compnyNameController.text);
    provider.updateDisplayName(displayNameController.text);
    provider.updateAddress1(address1Controller.text);
    provider.updatePincode(pincodeController.text);
    provider.updateCountry(provider.selectedCountry?.countryName ?? "");
    provider.updateCountryState(provider.selectedState?.stateName ?? "");
    provider.updateRegType(
      provider.selectedregistrationtype?.registrationType ?? "",
    );

    setState(() {}); // refresh UI with selected dropdown values
  }

  @override
  Widget build(BuildContext context) {
    //String? selectedReportingTo;
    final appLocalizations = context.l10n;
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        final countries = provider.countries;
        final regtypelist = provider.registrationlists;
        final selectedCountry = provider.selectedCountry;

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

        final regItems = regtypelist
            .map((e) => e.registrationType.trim())
            .where((regType) => regType.isNotEmpty)
            .toSet()
            .toList();

        final selectRegType =
            regItems.contains(
              provider.selectedregistrationtype?.registrationType,
            )
            ? provider.selectedregistrationtype?.registrationType
            : null;

        final pinTitle = (selectedCountry?.pinTitle.isNotEmpty ?? false)
            ? selectedCountry!.pinTitle
            : "Pincode";

        final stateTitle = (selectedCountry?.stateTitle.isNotEmpty ?? false)
            ? selectedCountry!.stateTitle
            : "State";

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
                      pinTitle,
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
                      inputType: TextInputType.phone,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                      maxLength: 6,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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

                                provider.updateCountryState("");
                                provider.updateRegType("");
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
                            label: stateTitle,
                            hintText:
                                appLocalizations.company_info_widget_state,
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

                    CustomDropdown(
                      label: appLocalizations
                          .company_info_widget_registration_type,
                      hintText: appLocalizations
                          .company_info_widget_enter_registration_type,
                      items: regItems,
                      value: selectRegType,

                      onChanged: (value) {
                        if (value != null) {
                          final selected = regtypelist.firstWhere(
                            (element) =>
                                element.registrationType.trim() == value.trim(),
                          );
                          provider.selectRegistrationType(selected);
                          provider.updateRegType(value);
                        }
                      },
                      autovalidateMode: provider.companyinfoAutovalidateMode,
                      failure: provider.registrationType.getFailure,
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
                            id: widget.companyData?.id ?? 0,
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
                            regType:
                                provider.selectedregistrationtype?.id
                                    .toString() ??
                                "",
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

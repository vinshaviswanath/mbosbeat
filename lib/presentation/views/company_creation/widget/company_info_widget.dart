import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class CompanyInfoWidget extends StatelessWidget {
  const CompanyInfoWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String? selectedReportingTo;
    final appLocalizations = context.l10n;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appLocalizations.sign_up_company_name,
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: appLocalizations.sign_up_enter_company_name,
                  hintTextStyle: context.textStyle.s12.silverGray.w300,
                  // controller: compnyController,
                  backgroundColor: ColorResources.lightGray,
                  // autovalidateMode: provider.registerAutovalidateMode,
                  // failure: provider.companyName.getFailure,
                  // inputFormatters: [noEmojiFormatter],
                  // onChange: provider.updateCompanyName,
                  inputType: TextInputType.emailAddress,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: ColorResources.transparent,
                ),
                h16,
                Text(
                  appLocalizations.company_info_widget_display_name,
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: appLocalizations.company_info_widget_enter_display_name,
                  hintTextStyle: context.textStyle.s12.silverGray.w300,
                  // controller: compnyController,
                  backgroundColor: ColorResources.lightGray,
                  // autovalidateMode: provider.registerAutovalidateMode,
                  // failure: provider.companyName.getFailure,
                  // inputFormatters: [noEmojiFormatter],
                  // onChange: provider.updateCompanyName,
                  inputType: TextInputType.emailAddress,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: ColorResources.transparent,
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
                  // controller: compnyController,
                  backgroundColor: ColorResources.lightGray,
                  // autovalidateMode: provider.registerAutovalidateMode,
                  // failure: provider.companyName.getFailure,
                  // inputFormatters: [noEmojiFormatter],
                  // onChange: provider.updateCompanyName,
                  inputType: TextInputType.emailAddress,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: ColorResources.transparent,
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
                  // controller: compnyController,
                  backgroundColor: ColorResources.lightGray,
                  // autovalidateMode: provider.registerAutovalidateMode,
                  // failure: provider.companyName.getFailure,
                  // inputFormatters: [noEmojiFormatter],
                  // onChange: provider.updateCompanyName,
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
                  // controller: compnyController,
                  backgroundColor: ColorResources.lightGray,
                  // autovalidateMode: provider.registerAutovalidateMode,
                  // failure: provider.companyName.getFailure,
                  // inputFormatters: [noEmojiFormatter],
                  // onChange: provider.updateCompanyName,
                  inputType: TextInputType.emailAddress,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: ColorResources.transparent,
                ),
                h16,

                CustomDropdown(
                  label: appLocalizations.company_info_widget_pincode,
                  hintText: appLocalizations.company_info_widget_enter_pincode,
                  items: const [
                    // "Manager",
                    // "Lead",
                    // "Developer",
                    // "Designer",
                    // "Tester",
                    // "HR",
                  ],
                  value: selectedReportingTo,
                  // autovalidateMode: provider.userCreateAutovalidateMode,
                  // failure: provider.reportingTo.getFailure,
                  onChanged: (value) {
                    // setState(() => selectedReportingTo = value);
                    // provider.updateReportingTo(value ?? '');
                  },
                ),
                h16,
                // Country & State side-by-side
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdown(
                        label: appLocalizations.company_info_widget_country,
                        hintText:
                            appLocalizations.company_info_widget_enter_country,
                        items: const [],
                        value: selectedReportingTo,
                        // autovalidateMode: provider.userCreateAutovalidateMode,
                        // failure: provider.reportingTo.getFailure,
                        onChanged: (value) {
                          // setState(() => selectedReportingTo = value);
                          // provider.updateReportingTo(value ?? '');
                        },
                      ),
                    ),
                    w12,
                    Expanded(
                      child: CustomDropdown(
                        label: appLocalizations.company_info_widget_state,
                        hintText:
                            appLocalizations.company_info_widget_enter_address,
                        items: const [],
                        value: selectedReportingTo,
                        // autovalidateMode: provider.userCreateAutovalidateMode,
                        // failure: provider.reportingTo.getFailure,
                        onChanged: (value) {
                          // setState(() => selectedReportingTo = value);
                          // provider.updateReportingTo(value ?? '');
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
                  // controller: compnyController,
                  backgroundColor: ColorResources.lightGray,
                  // autovalidateMode: provider.registerAutovalidateMode,
                  // failure: provider.companyName.getFailure,
                  // inputFormatters: [noEmojiFormatter],
                  // onChange: provider.updateCompanyName,
                  inputType: TextInputType.emailAddress,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: ColorResources.transparent,
                ),
                h40,
                CustomButton(
                  buttonText: appLocalizations.company_info_widget_next,
                  isborderEnable: false,
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

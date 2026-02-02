import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/domain/request/update_registraion_params.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class RegistrationDetailsForm extends StatefulWidget {
  final CompanyViewList? company;
  const RegistrationDetailsForm({super.key, required this.company});

  @override
  State<RegistrationDetailsForm> createState() =>
      _RegistrationDetailsFormState();
}

class _RegistrationDetailsFormState extends State<RegistrationDetailsForm> {
  late TextEditingController applicationFromController;
  late TextEditingController gstnController;
  late TextEditingController fssaiController;

  @override
  void initState() {
    super.initState();

    applicationFromController = TextEditingController(
      text: widget.company?.applicableFrom ?? "",
    );
    gstnController = TextEditingController(
      text: widget.company?.registrationNo ?? "",
    );
    fssaiController = TextEditingController(
      text: widget.company?.fssaiNo ?? "",
    );
    final provider = context.read<CompanyCreationProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await provider.getAllCompanies(context);
    });
  }
  @override
  void dispose() {
    applicationFromController.dispose();
    gstnController.dispose();
    fssaiController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      applicationFromController.text = DateFormat(
        'yyyy-MM-dd',
      ).format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyCreationProvider>();
    final regtypelist = provider.registrationlists;
    final regItems = regtypelist
        .map((e) => e.registrationType.trim())
        .where((regType) => regType.isNotEmpty)
        .toSet()
        .toList();

    final selectregType =
        regItems.contains(provider.selectedregistrationtype?.registrationType)
        ? provider.selectedregistrationtype?.registrationType
        : null;
    if (provider.updateRegistartion != null) {
      final updated = provider.updateRegistartion!;
      applicationFromController.text = updated.date;
      fssaiController.text = updated.fssaiNo;
      gstnController.text = updated.taxNumber;
    }
    return Container(
      margin: const EdgeInsets.only(top: 4, left: 16, right: 16),
      padding: const EdgeInsets.only(left: 9, right: 9, top: 12, bottom: 20),
      decoration: BoxDecoration(
        color: ColorResources.lavenderblueMist,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Applicable From
            Text(
              "Applicable From",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter From Date",
              controller: applicationFromController,
              backgroundColor: ColorResources.white,
              onTap: _pickDate,
              readOnly: true,
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
              suffixIcon: Icon(
                Icons.calendar_month,
                color: ColorResources.indigoBlue,
              ),
            ),
            h20,

            /// Registration Type
            Text(
              "Registration Type",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: ColorResources.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: ColorResources.bluishGray),
              ),
              child: CustomDropdown(
                hintText: "Select Type",
                items: regItems,
                value: selectregType,
                backgroundColor: ColorResources.white,
                onChanged: (value) {
                  if (value != null) {
                    final selected = regtypelist.firstWhere(
                      (element) =>
                          element.registrationType.trim() == value.trim(),
                    );
                    provider.selectRegistrationType(selected);

                  }
                },

                autovalidateMode: provider.effectiveMode,
                failure: provider.registrationType.getFailure,
              ),
            ),
            h20,

            /// GSTN Number
            Text(
              "GSTN Number",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter GSTN Number",
              controller: gstnController,
              backgroundColor: ColorResources.white,
              onChange: (_) {},
              inputType: TextInputType.phone,
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,

            /// FSSAI Number
            Text(
              "FSSAI Number",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter FSSAI Number",
              controller: fssaiController,
              backgroundColor: ColorResources.white,
              onChange: (_) {},
              inputType: TextInputType.emailAddress,
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,

            /// Save Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {
                    final provider = context.read<CompanyCreationProvider>();
                    final company = widget.company;
                    provider.UpdateRegistrationDetail(
                      context: context,
                      params: UpdateRegistrationParams(
                        companyId: company?.id,
                        date: applicationFromController.text,
                        registrationType: provider.selectedregistrationtype?.id,
                        taxNumber: gstnController.text,
                        fssaiNo: fssaiController.text,
                      ),
                    );
                  },
                  width: context.getSize.width * 1 / 2.2,
                  buttonText: "Save",
                  isborderEnable: false,
                  borderRadius: BorderRadius.circular(20),
                  textStyle: context.textStyle.s12.w500.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

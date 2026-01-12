import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

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

  String? selectedRegistrationType;

  final List<String> registrationTypes = [
    'Proprietorship',
    'Partnership',
    'Private Limited',
    'Public Limited',
  ];

  @override
  void initState() {
    applicationFromController = TextEditingController();
    gstnController = TextEditingController();
    fssaiController = TextEditingController();
    super.initState();
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
        'dd-MM-yyyy',
      ).format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, left: 16, right: 16),
      padding: const EdgeInsets.only(left: 9, right: 9, top: 12, bottom: 20),
      decoration: BoxDecoration(
        color: ColorResources.lavenderblue,
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
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedRegistrationType,
                  hint: Text(
                    "Select Type",
                    style: context.textStyle.s12.silverGray,
                  ),
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorResources.indigoBlue,
                  ),
                  items: registrationTypes
                      .map(
                        (type) => DropdownMenuItem<String>(
                          value: type,
                          child: Text(
                            type,
                            style: context.textStyle.s12.bluishGray,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRegistrationType = value;
                    });
                  },
                ),
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

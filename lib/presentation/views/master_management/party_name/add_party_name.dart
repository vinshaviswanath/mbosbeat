import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class AddPartyName extends StatefulWidget {
  // final int index;
  const AddPartyName({
    super.key,
    // required this.index
  });

  @override
  State<AddPartyName> createState() => _AddPartyNameState();
}

class _AddPartyNameState extends State<AddPartyName> {
  final ledgerController = TextEditingController();
  final addressController = TextEditingController();
  final address2Controller = TextEditingController();
  final address3Controller = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final gstrnController = TextEditingController();
  final priceListController = TextEditingController();
  final openingBalanceController = TextEditingController();

  String? selectedMobileNumber;
  bool _submitted = false;
  String? ledgerError;
  String? addressError;
  String? phoneNumberError;
  String? emailError;
  String? gstrnError;
  String? priceListError;
  String? openingBalanceError;
  String? mobileNumberError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.cloudGray,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
          ),
        ),
        title: Text(
          "Add Party Name",
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
                h16,
                Text(
                  "Ledger Name",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Ledger Name",
                  controller: ledgerController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && ledgerError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && ledgerError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        ledgerError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Address",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Address",
                  controller: addressController,
                  backgroundColor: ColorResources.lightGray,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && addressError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && addressError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        addressError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],

                h16,
                Text(
                  "Address 2",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Address 2",
                  controller: address2Controller,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: ColorResources.transparent,
                ),
                h16,
                Text(
                  "Address 3",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Address 3",
                  controller: address3Controller,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: ColorResources.transparent,
                ),
                h16,
                Text(
                  "Mobile No.",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorResources.lightGray,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    hint: Text(
                      "Enter Mobile No.",
                      style: context.textStyle.s14.silverGray,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color:
                            // _submitted && mobileNumberError != null
                            //     ? ColorResources.roseRed
                            //     :
                            Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
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
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorResources.indigoBlue,
                  ),

                  hint: Text(
                    "Enter Mobile No.",
                    style: context.textStyle.s14.silverGray,
                  ),
                  items: [],

                  onChanged: (value) {},
                ),
                // if (_submitted &&
                //     mobileNumberError != null) ...[
                //   const SizedBox(height: 4),
                //   Row(
                //     children: [
                //       SvgPicture.asset(AppAssets.alertError, height: 16),
                //       const SizedBox(width: 2),
                //       Text(
                //         "Please select Mobile Number",
                //         style: context.textStyle.s10.w300.roseRed.raleway,
                //       ),
                //     ],
                //   ),
                // ],
                h16,
                Text(
                  "Phone No.",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Phone No.",
                  controller: phoneNumberController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && phoneNumberError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && phoneNumberError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        phoneNumberError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Email",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Email",
                  controller: emailController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && emailError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && emailError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        emailError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Country",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                DropdownButtonFormField(
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
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
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
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorResources.indigoBlue,
                  ),
                  hint: Text(
                    "Select Country",
                    style: context.textStyle.s14.silverGray,
                  ),
                  items: [],

                  onChanged: (value) {},
                ),
                h16,

                Text(
                  "State",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                DropdownButtonFormField(
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
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
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
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorResources.indigoBlue,
                  ),

                  hint: Text(
                    "Select State",
                    style: context.textStyle.s14.silverGray,
                  ),
                  items: [],

                  onChanged: (value) {},
                ),
                h16,
                Text(
                  "Company Type",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                DropdownButtonFormField(
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
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
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
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorResources.indigoBlue,
                  ),

                  hint: Text(
                    "Select type",
                    style: context.textStyle.s14.silverGray,
                  ),
                  items: [],

                  onChanged: (value) {},
                ),
                h16,
                Text(
                  "GSTRN",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter GSTRN",
                  controller: gstrnController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && gstrnError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && gstrnError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        gstrnError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Price List",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Price List",
                  controller: priceListController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && priceListError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && priceListError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        priceListError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Route",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                DropdownButtonFormField(
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
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
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
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorResources.indigoBlue,
                  ),

                  hint: Text(
                    "Select Route",
                    style: context.textStyle.s14.silverGray,
                  ),
                  items: [],

                  onChanged: (value) {},
                ),
                h16,
                Text(
                  "Customer Sorting",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                DropdownButtonFormField(
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
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
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
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorResources.indigoBlue,
                  ),
                  hint: Text("Select", style: context.textStyle.s14.silverGray),
                  items: [],
                  onChanged: (value) {},
                ),
                h16,
                Text(
                  "Opening Balance (Bill-Wise)",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Opening balance",
                  controller: openingBalanceController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && openingBalanceError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && openingBalanceError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        openingBalanceError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h60,
              ]),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.getSize.width / 3,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                    onTap: () {},
                    imagePath: AppAssets.locationPin,
                    color: ColorResources.rosePink,
                    borderRadius: BorderRadius.circular(16),
                    textStyle: context.textStyle.s12.w500.white.roboto,
                    buttonText: "Location",
                    isborderEnable: false,
                  ),
                  h28,
                  CustomButton(
                    onTap: () {
                      setState(() {
                        _submitted = true;
                        ledgerError = null;
                        addressError = null;
                        phoneNumberError = null;
                        emailError = null;
                        gstrnError = null;
                        priceListError = null;
                        openingBalanceError = null;

                        if (ledgerController.text.isEmpty) {
                          ledgerError = "Please enter ledger name";
                        }
                        if (addressController.text.isEmpty) {
                          addressError = "Please enter Address";
                        }
                        if (phoneNumberController.text.isEmpty) {
                          phoneNumberError = "Please enter Phone number";
                        }
                        if (gstrnController.text.isEmpty) {
                          gstrnError = "Please enter GSTRN";
                        }
                        if (priceListController.text.isEmpty) {
                          priceListError = "Please enter Price List";
                        }
                        if (openingBalanceController.text.isEmpty) {
                          openingBalanceError = "Please enter Opening Balance";
                        }
                        if (ledgerError == null &&
                            addressError == null &&
                            phoneNumberError == null &&
                            emailError == null &&
                            gstrnError == null &&
                            priceListError == null &&
                            openingBalanceError == null) {
                          ledgerController.clear();
                          addressController.clear();
                          phoneNumberController.clear();
                          gstrnController.clear();
                          priceListController.clear();
                          openingBalanceController.clear();
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            context.pop();
                          });
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(16),
                    textStyle: context.textStyle.s12.w500.white.roboto,
                    buttonText: "Save",
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
  }
}

import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class AddItemName extends StatefulWidget {
  // final int index;
  const AddItemName({
    super.key,
    // required this.index
  });

  @override
  State<AddItemName> createState() => _AddItemNameState();
}

class _AddItemNameState extends State<AddItemName> {
  final nameController = TextEditingController();
  final localLanguageController = TextEditingController();
  final partNumberController = TextEditingController();
  final aliasController = TextEditingController();
  final unitController = TextEditingController();
  final alternativeUnitController = TextEditingController();
  final taxController = TextEditingController();
  final hsnCodeController = TextEditingController();
  final salesLedgerController = TextEditingController();
  final mrpController = TextEditingController();
  final godownAllocationController = TextEditingController();
  final quantityController = TextEditingController();
  final rateController = TextEditingController();
  final amountController = TextEditingController();

  String? selectedMobileNumber;
  bool _submitted = false;
  String? nameError;
  String? localLanguageError;
  String? partNumberError;
  String? aliasError;
  String? unitError;
  String? alternativeUnitError;
  String? taxError;
  String? hsnCodeError;
  String? salesLedgerError;
  String? mrpError;
  String? godownAllocationError;
  String? quantityError;
  String? rateError;
  String? amountError;

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
          "Add Item Name",
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
                  "Name",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Item Name",
                  controller: nameController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && nameError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && nameError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        nameError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Local Language",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Select Language",
                  controller: localLanguageController,
                  backgroundColor: ColorResources.lightGray,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && localLanguageError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && localLanguageError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        localLanguageError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],

                h16,
                Text(
                  "Part Number",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Part Number",
                  controller: partNumberController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && partNumberError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && partNumberError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        partNumberError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Alias",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Alias",
                  controller: aliasController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && aliasError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && aliasError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        aliasError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Parent Group",
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
                    "Select Parent Group",
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
                  "Category",
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
                    "Select category",
                    style: context.textStyle.s14.silverGray,
                  ),
                  items: [],

                  onChanged: (value) {},
                ),
                h16,
                Text(
                  "Unit",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Unit",
                  controller: unitController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && unitError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && unitError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        unitError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Alternative Unit",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Alternative Unit",
                  controller: alternativeUnitController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && alternativeUnitError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && alternativeUnitError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        alternativeUnitError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Tax %",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Tax Percentage",
                  controller: taxController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && taxError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && taxError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        taxError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "HSN/SAC Code",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Code",
                  controller: hsnCodeController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && hsnCodeError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && hsnCodeError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        hsnCodeError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Sales Ledger",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Code",
                  controller: salesLedgerController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && salesLedgerError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && salesLedgerError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        salesLedgerError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "MRP",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter MRP",
                  controller: mrpController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && mrpError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && mrpError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        mrpError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h24,
                Text(
                  "Opening Quantity",
                  style: context.textStyle.s12.bold.bluishGray.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: ColorResources.bluishGray,
                  ),
                ),
                h16,
                Text(
                  "Godown Allocation",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Select Godown",
                  controller: godownAllocationController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && godownAllocationError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && godownAllocationError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        godownAllocationError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Quantity",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Ente Quantity",
                  controller: quantityController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && quantityError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && quantityError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        quantityError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Rate",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Ente Rate",
                  controller: rateController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && rateError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && rateError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        rateError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Amount",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Ente Amount",
                  controller: amountController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && amountError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && amountError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        amountError!,
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
                    onTap: () {
                      setState(() {
                        _submitted = true;
                        nameError = null;
                        localLanguageError = null;
                        partNumberError = null;
                        aliasError = null;
                        unitError = null;
                        alternativeUnitError = null;
                        taxError = null;
                        hsnCodeError = null;
                        salesLedgerError = null;
                        mrpError = null;
                        godownAllocationError = null;
                        quantityError = null;
                        rateError = null;
                        amountError = null;

                        if (nameController.text.isEmpty) {
                          nameError = "Please enter name";
                        }
                        if (localLanguageController.text.isEmpty) {
                          localLanguageError = "Please enter local language";
                        }
                        if (partNumberController.text.isEmpty) {
                          partNumberError = "Please enter part number";
                        }
                        if (aliasController.text.isEmpty) {
                          aliasError = "Please enter alias";
                        }
                        if (unitController.text.isEmpty) {
                          unitError = "Please enter unit";
                        }
                        if (alternativeUnitController.text.isEmpty) {
                          alternativeUnitError =
                              "Please enter alternative unit";
                        }
                        if (taxController.text.isEmpty) {
                          taxError = "Please enter tax";
                        }
                        if (hsnCodeController.text.isEmpty) {
                          hsnCodeError = "Please enter HSN code";
                        }
                        if (salesLedgerController.text.isEmpty) {
                          salesLedgerError = "Please enter sales ledger";
                        }
                        if (mrpController.text.isEmpty) {
                          mrpError = "Please enter MRP";
                        }
                        if (godownAllocationController.text.isEmpty) {
                          godownAllocationError =
                              "Please enter godown allocation";
                        }
                        if (quantityController.text.isEmpty) {
                          quantityError = "Please enter quantity";
                        }
                        if (rateController.text.isEmpty) {
                          rateError = "Please enter rate";
                        }
                        if (amountController.text.isEmpty) {
                          amountError = "Please enter amount";
                        }

                        if (nameError == null &&
                            localLanguageError == null &&
                            partNumberError == null &&
                            aliasError == null &&
                            unitError == null &&
                            alternativeUnitError == null &&
                            taxError == null &&
                            hsnCodeError == null &&
                            salesLedgerError == null &&
                            mrpError == null &&
                            godownAllocationError == null &&
                            quantityError == null &&
                            rateError == null &&
                            amountError == null) {
                          nameController.clear();
                          localLanguageController.clear();
                          partNumberController.clear();
                          aliasController.clear();
                          unitController.clear();
                          alternativeUnitController.clear();
                          taxController.clear();
                          hsnCodeController.clear();
                          salesLedgerController.clear();
                          mrpController.clear();
                          godownAllocationController.clear();
                          quantityController.clear();
                          rateController.clear();
                          amountController.clear();
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

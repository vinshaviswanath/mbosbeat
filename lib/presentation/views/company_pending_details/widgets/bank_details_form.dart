import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/domain/request/bank_details_params.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_switch.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class BankDetailsForm extends StatefulWidget {
  final CompanyViewList? company;
  final VoidCallBack onUpdate;
  const BankDetailsForm({
    super.key,
    required this.company,
    required this.onUpdate,
  });

  @override
  State<BankDetailsForm> createState() => _BankDetailsFormState();
}

class _BankDetailsFormState extends State<BankDetailsForm> {
  late TextEditingController bankNameController;
  late TextEditingController branchNameController;
  late TextEditingController accNoController;
  late TextEditingController ifscController;
  late TextEditingController upiPaymentAddressController;
  late TextEditingController paymentNameController;
  late TextEditingController currencyController;

  bool isUpiEnabled = false;

  @override
  void initState() {
    bankNameController = TextEditingController(
      text: widget.company?.bankName ?? "",
    );
    branchNameController = TextEditingController(
      text: widget.company?.bankBranch ?? "",
    );
    accNoController = TextEditingController(text: widget.company?.accNo ?? "");
    ifscController = TextEditingController(
      text: widget.company?.ifscCode ?? "",
    );
    upiPaymentAddressController = TextEditingController(
      text: widget.company?.upiAddress ?? "",
    );
    paymentNameController = TextEditingController(
      text: widget.company?.payeeName ?? "",
    );
    currencyController = TextEditingController(
      text: widget.company?.currency ?? "",
    );

    super.initState();
  }

  @override
  void dispose() {
    bankNameController.dispose();
    branchNameController.dispose();
    accNoController.dispose();
    ifscController.dispose();
    upiPaymentAddressController.dispose();
    paymentNameController.dispose();
    currencyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyCreationProvider>();
    if (provider.updatedBankDetails != null) {
      final updated = provider.updatedBankDetails!;
      bankNameController.text = updated.bankName??"";
      branchNameController.text = updated.branch??"";
      accNoController.text = updated.accountNumber??"";
      ifscController.text = updated.ifscCode??"";
      upiPaymentAddressController.text = updated.upiAddress??"";
      paymentNameController.text = updated.upiName??"";
      currencyController.text = updated.currency??"";
    }
    return Container(
      margin: EdgeInsets.only(top: 4, left: 16, right: 16),
      padding: EdgeInsets.only(left: 9, right: 9, top: 12, bottom: 20),
      decoration: BoxDecoration(
        color: ColorResources.lavenderblueMist,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Bank Name",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter Bank Name",
              controller: bankNameController,
              // focusNode: compnyFocusNode,
              // onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(phoneFocusNode);
              // },
              backgroundColor: ColorResources.white,
              // inputFormatters: [noEmojiFormatter],
              onChange: (_) {},
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,
            Text("Branch", style: context.textStyle.s12.bluishGray.w400.roboto),
            h4,
            CustomTextField(
              hint: "Enter Branch Name",
              controller: branchNameController,
              // focusNode: compnyFocusNode,
              // onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(phoneFocusNode);
              // },
              backgroundColor: ColorResources.white,
              // inputFormatters: [noEmojiFormatter],
              onChange: (_) {},
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,
            Text(
              "Account Number",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter Account Number",
              controller: accNoController,
              // focusNode: compnyFocusNode,
              // onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(phoneFocusNode);
              // },
              backgroundColor: ColorResources.white,
              // inputFormatters: [noEmojiFormatter],
              maxLength: 16,
              onChange: (_) {},
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,
            Text(
              "IFSC Code",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter IFSC",
              controller: ifscController,
              // focusNode: compnyFocusNode,
              // onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(phoneFocusNode);
              // },
              backgroundColor: ColorResources.white,
              // inputFormatters: [noEmojiFormatter],
              onChange: (_) {},
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "Enable UPI",
                  style: context.textStyle.s12.w400.bluishGray,
                ),
                CustomSwitch(
                  value: isUpiEnabled,
                  thumbColor: !isUpiEnabled
                      ? ColorResources.bluishGray
                      : ColorResources.white,
                  borderColor: !isUpiEnabled
                      ? ColorResources.neutralmidgray
                      : ColorResources.transparent,
                  onChanged: (val) {
                    setState(() {
                      isUpiEnabled = val;
                      Logger.logInfo("UPI Enable :: $isUpiEnabled");
                    });
                  },
                ),
              ],
            ),
            h20,
            if (isUpiEnabled) ...[
              Text(
                "UPI Payment Address",
                style: context.textStyle.s12.bluishGray.w400.roboto,
              ),
              h4,
              CustomTextField(
                hint: "Enter UPI Address",
                controller: upiPaymentAddressController,
                // focusNode: compnyFocusNode,
                // onFieldSubmitted: (_) {
                //   FocusScope.of(context).requestFocus(phoneFocusNode);
                // },
                backgroundColor: ColorResources.white,
                // inputFormatters: [noEmojiFormatter],
                onChange: (_) {},
                borderRadius: 15,
                hintColor: ColorResources.silverGray,
                borderColor: ColorResources.bluishGray,
              ),
              h20,
              Text(
                "Payment Name",
                style: context.textStyle.s12.bluishGray.w400.roboto,
              ),
              h4,
              CustomTextField(
                hint: "Enter Payment Name",
                controller: paymentNameController,
                // focusNode: compnyFocusNode,
                // onFieldSubmitted: (_) {
                //   FocusScope.of(context).requestFocus(phoneFocusNode);
                // },
                backgroundColor: ColorResources.white,
                // inputFormatters: [noEmojiFormatter],
                onChange: (_) {},
                borderRadius: 15,
                hintColor: ColorResources.silverGray,
                borderColor: ColorResources.bluishGray,
              ),
              h20,
              Text(
                "Currency",
                style: context.textStyle.s12.bluishGray.w400.roboto,
              ),
              h4,
              CustomTextField(
                hint: "Enter Currency",
                controller: currencyController,
                // focusNode: compnyFocusNode,
                // onFieldSubmitted: (_) {
                //   FocusScope.of(context).requestFocus(phoneFocusNode);
                // },
                backgroundColor: ColorResources.white,
                // inputFormatters: [noEmojiFormatter],
                onChange: (_) {},
                borderRadius: 15,
                hintColor: ColorResources.silverGray,
                borderColor: ColorResources.bluishGray,
              ),
            ],
            h20,
            Row(
              mainAxisAlignment: .center,
              children: [
                CustomButton(
                  onTap: () {
                    final provider = context.read<CompanyCreationProvider>();
                    final company = widget.company;
                    provider
                        .updateBankDetails(
                          context: context,
                          params: BankDetailsParams(
                            companyId: company?.id,
                            bankName: bankNameController.text,
                            branch: branchNameController.text,
                            accountNumber: accNoController.text,
                            ifscCode: ifscController.text,
                            hasUpi: isUpiEnabled,
                            upiAddress: upiPaymentAddressController.text,
                     upiName: paymentNameController.text,
                           currency: currencyController.text,
                          ),
                        )
                        .then((value) {
                          widget.onUpdate.call();
                        });
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

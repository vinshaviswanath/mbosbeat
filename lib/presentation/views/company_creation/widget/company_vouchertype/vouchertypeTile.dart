import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/data/company_voucher_data.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/checkBox_dialogBox.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/voucherDialogBox.dart';

class VoucherTypeTile extends StatefulWidget {
  final CompanyVoucherTypesListData voucher;
  final int isCheckOnInt;
  final int isToggleOnInt;
  final VoidCallback onEdit;
  final ValueChanged<int> onChanged;

  const VoucherTypeTile({
    super.key,
    required this.voucher,
    required this.isCheckOnInt,
    required this.isToggleOnInt,
    required this.onEdit,
    required this.onChanged,
  });

  @override
  State<VoucherTypeTile> createState() => _VoucherTypeTileState();
}

class _VoucherTypeTileState extends State<VoucherTypeTile> {
  Map<int, int> toggleStates = {};
  Map<int, int> checkStates = {};
  @override
  Widget build(BuildContext context) {
    final voucher = widget.voucher;
    final isCheckOnInt = widget.isCheckOnInt;
    final isToggleOnInt = widget.isToggleOnInt;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Text(
                voucher.voucherMenuName,
                style: context.textStyle.s12.w400.bluishGray.roboto,
              ),
              Spacer(),

              //CheckBox.....
              Checkbox(
                side: BorderSide(color: ColorResources.bluishGray, width: 1),
                checkColor: ColorResources.white,
                activeColor: ColorResources.indigoBlue,

                value: isCheckOnInt == 1,
                onChanged: (value) async {
                  // Check if any of the prefixes or suffixes are non-empty
                  final hasAnyValue =
                      voucher.b2BPrefix.isNotEmpty ||
                      voucher.b2BSuffix.isNotEmpty ||
                      voucher.b2CPrefix.isNotEmpty ||
                      voucher.b2CSuffix.isNotEmpty;
                  if (value == false && hasAnyValue) {
                    // Show the dialog box if any prefix or suffix has a value
                    final result = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CheckBoxDialogBox(
                          companyId: 1302,
                          isCheckOn: isCheckOnInt,
                          id: voucher.id,
                        );
                      },
                    );
                    if (result == true) {
                      widget.onChanged(0); // Uncheck the checkbox
                    } else {
                      widget.onChanged(1); // Keep the checkbox checked
                    }
                  } else {
                    widget.onChanged(value == true ? 1 : 0);
                  }
                },
              ),
            ],
          ),
        ),
        //default voucher number....
        if (isCheckOnInt == 1 &&
            ((voucher.b2BPrefix.isEmpty &&
                    voucher.b2BSuffix.isEmpty &&
                    voucher.b2CPrefix.isEmpty &&
                    voucher.b2CSuffix.isEmpty) ||
                voucher.hasB2B == 0))
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Prefix: ",
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    Text(
                      voucher.b2BPrefix,
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Suffix: ",
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    Text(
                      voucher.b2BSuffix,
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Width: ",
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    Text(
                      voucher.b2BWidth.toString(),
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                  ],
                ),

                //default voucher number add and edit icon
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return VoucherDialogbox(
                            id: voucher.id,
                            companydata: voucher,
                            isCheckOn: isCheckOnInt,
                            isToggleOn: isToggleOnInt,
                            regtype: "",
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF98A6BE).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      height: MediaQuery.of(context).size.height * 0.025,
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: Icon(
                        Icons.drive_file_rename_outline_sharp,
                        size: 15,
                        color: const Color(0xFF36489B),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        //b2b heading
        if (isCheckOnInt == 1 &&
            (voucher.b2BPrefix.isNotEmpty || voucher.b2BSuffix.isNotEmpty) &&
            voucher.hasB2B == 1)
          Align(
            // alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Text(
                    "B2B",
                    style: context.textStyle.s12.w400.dustyBlue.roboto,
                  ),
                  Spacer(),

                  //b2b voucher number add and edit icon....
                  if (isCheckOnInt == 1 && (voucher.b2CPrefix.isEmpty))
                    Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return VoucherDialogbox(
                                id: voucher.id,
                                companydata: voucher,
                                isCheckOn: isCheckOnInt,
                                isToggleOn: isToggleOnInt,
                                regtype: "",
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: MediaQuery.of(context).size.height * 0.03,
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Icon(
                            Icons.drive_file_rename_outline_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.006),

        //b2b voucher number
        if (isCheckOnInt == 1 &&
            (voucher.b2BPrefix.isNotEmpty || voucher.b2BSuffix.isNotEmpty) &&
            voucher.hasB2B == 1)
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Prefix: ",
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    Text(
                      voucher.b2BPrefix,
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Suffix: ",
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    Text(
                      voucher.b2BSuffix,
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Width: ",
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    Text(
                      voucher.b2BWidth.toString(),
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                  ],
                ),
                SizedBox(),
              ],
            ),
          ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.006),

        //b2c heading
        if (isCheckOnInt == 1 &&
            (voucher.b2CPrefix.isNotEmpty || voucher.b2CSuffix.isNotEmpty))
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Text(
                    "B2C",
                    style: context.textStyle.s12.w400.dustyBlue.roboto,
                  ),
                  Spacer(),

                  //b2c voucher number add and edit icon....
                  Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return VoucherDialogbox(
                              id: voucher.id,
                              companydata: voucher,
                              isCheckOn: isCheckOnInt,
                              isToggleOn: isToggleOnInt,
                              regtype: "",
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 0.06,
                        child: Icon(
                          Icons.drive_file_rename_outline_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.006),

        //b2c voucher number......
        if (isCheckOnInt == 1 &&
            (voucher.b2CPrefix.isNotEmpty || voucher.b2CSuffix.isNotEmpty))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      "Prefix: ",
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    Text(
                      voucher.b2CPrefix,
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Suffix: ",
                    style: context.textStyle.s12.w400.dustyBlue.roboto,
                  ),
                  Text(
                    voucher.b2CSuffix,
                    style: context.textStyle.s12.w400.dustyBlue.roboto,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Width: ",
                    style: context.textStyle.s12.w400.dustyBlue.roboto,
                  ),
                  Text(
                    voucher.b2CWidth.toString(),
                    style: context.textStyle.s12.w400.dustyBlue.roboto,
                  ),
                ],
              ),
              SizedBox(),
            ],
          ),

        //Divider(color: Color(0xFFCFCFCF), height: 1, thickness: 1.5),
        Divider(color: Color(0xFFCFCFCF), height: 3, thickness: 1.5),
      ],
    );
  }
}

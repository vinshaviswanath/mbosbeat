import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/data/models/data/company_voucher_data.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/checkBox_dialogBox.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/voucherDialogBox.dart';

class VoucherTypeTile extends StatefulWidget {
  final CompanyVoucherTypesListData voucher;
  final int isCheckOnInt;
  final int isToggleOnInt;
  final VoidCallback onEdit;
  final ValueChanged<int> onChanged;
  final int companyId;

  const VoucherTypeTile({
    super.key,
    required this.voucher,
    required this.isCheckOnInt,
    required this.isToggleOnInt,
    required this.onEdit,
    required this.onChanged,
    required this.companyId,
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
                  final provider = context.read<CompanyCreationProvider>();

                  if (value == false) {
                    final hasAnyValue =
                        voucher.b2BPrefix.isNotEmpty ||
                        voucher.b2BSuffix.isNotEmpty ||
                        voucher.b2CPrefix.isNotEmpty ||
                        voucher.b2CSuffix.isNotEmpty;

                    if (hasAnyValue) {
                      final result = await showDialog(
                        context: context,
                        builder: (context) {
                          return CheckBoxDialogBox(
                            companyId: widget.companyId,
                            isCheckOn: isCheckOnInt,
                            id: voucher.id,
                          );
                        },
                      );

                      if (result != true) {
                        widget.onChanged(1);
                        return;
                      }
                    }
                  }

                  int isEnabled = value == true ? 1 : 0;

                  CreateCompanyvochertypeDtos? response = await provider
                      .createCompanyVoucherTypes(
                        context,
                        request: CreateCompanyVocherParams(
                          id: voucher.id,
                          companyid: widget.companyId,
                          hasB2B: 0,
                          b2Bprefix: "",
                          b2Bsuffix: "",
                          b2Bwidth: 0,
                          b2Bdeclaration: "",
                          b2Cprefix: "",
                          b2Csuffix: "",
                          b2Cwidth: 0,
                          b2Cdeclaration: "",
                          isenabled: isEnabled,
                        ),
                      );

                  if (response != null && response.status == 1) {
                    widget.onChanged(isEnabled);
                    provider.fetchVoucherTypes(context, widget.companyId);
                  }
                },
              ),
            ],
          ),
        ),
        //default voucheno
        if (isCheckOnInt == 1 &&
            (voucher.b2BPrefix.isEmpty || voucher.b2BSuffix.isEmpty) &&
            (widget.isToggleOnInt == 0))
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Text(
                    "B2B",
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
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF98A6BE).withValues(alpha: 0.3),
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
          ),
        if (isCheckOnInt == 1 &&
            (voucher.b2BPrefix.isEmpty || voucher.b2BSuffix.isEmpty) &&
            (widget.isToggleOnInt == 0))
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
              ],
            ),
          ),

        //B2B voucher number....
        if (isCheckOnInt == 1 &&
            (voucher.b2BPrefix.isNotEmpty || voucher.b2BSuffix.isNotEmpty))
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Text(
                    "B2B",
                    style: context.textStyle.s12.w400.dustyBlue.roboto,
                  ),
                  Spacer(),

                  //b2c voucher number add and edit icon....
                  if ((voucher.b2BPrefix.isNotEmpty ||
                      voucher.b2BSuffix.isNotEmpty))
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
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF98A6BE,
                            ).withValues(alpha: 0.3),
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
          ),
        if (isCheckOnInt == 1 &&
            (voucher.b2BPrefix.isNotEmpty || voucher.b2BSuffix.isNotEmpty))
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
              ],
            ),
          ),

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
                  if (isCheckOnInt == 1 &&
                      (voucher.b2CPrefix.isNotEmpty ||
                          voucher.b2CSuffix.isNotEmpty) &&
                      (voucher.b2BPrefix.isEmpty || voucher.b2BSuffix.isEmpty))
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
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF98A6BE,
                            ).withValues(alpha: 0.3),
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

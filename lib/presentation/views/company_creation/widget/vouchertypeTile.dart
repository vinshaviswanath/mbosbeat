import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/voucherDialogBox.dart';

class VoucherTypeTile extends StatefulWidget {
  final bool value;
  final VoidCallback? onEdit;
  final ValueChanged<bool?>? onChanged;
  final dynamic voucher;
  final int isCheckOnInt;
  final int isToggleOnInt;

  const VoucherTypeTile({
    super.key,
    required this.value,
    this.onChanged,
    this.onEdit,
    required this.voucher,
    required this.isCheckOnInt,
    required this.isToggleOnInt,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              voucher.voucherMenuName,
              style: context.textStyle.s12.w400.bluishGray.roboto,
            ),
            Checkbox(value: widget.value, onChanged: widget.onChanged),
          ],
        ),

        if (isCheckOnInt == 1 &&
            ((voucher.b2BPrefix.isEmpty &&
                    voucher.b2BSuffix.isEmpty &&
                    voucher.b2CPrefix.isEmpty &&
                    voucher.b2CSuffix.isEmpty) ||
                voucher.hasB2B == 0))
          Row(
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
              GestureDetector(
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
            ],
          ),
        Divider(thickness: 1),
      ],
    );
  }
}

import 'package:mpos_beat/core/utils/imports.dart'; // your shared context extensions, colors, etc.

class VoucherTypeTile extends StatelessWidget {
  final String title;
  final bool value;
  final VoidCallback? onEdit;
  final ValueChanged<bool?>? onChanged;

  const VoucherTypeTile({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: context.textStyle.s12.w400.bluishGray.roboto),
              Checkbox(
                value: value,
                onChanged: onChanged,
                side: const BorderSide(
                  color: ColorResources.bluishGray,
                  width: 2,
                ),
              ),
            ],
          ),
        ),
        if (value) ...[
          h6,
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      appLocalization.voucher_type_tile_prefix,
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    Text(
                      "xxxxx",
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      appLocalization.voucher_type_tile_sufix,
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    Text(
                      "xxxxx",
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      appLocalization.voucher_type_tile_width,
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    Text(
                      "xxxxx",
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    w8,
                    GestureDetector(
                      onTap: onEdit,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorResources.dustyBlue,
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 10,
                          color: ColorResources.indigoBlue,
                        ),
                      ),
                    ),
                    w16,
                  ],
                ),
              ],
            ),
          ),
        ],
        const Divider(color: ColorResources.offWhite),
      ],
    );
  }
}

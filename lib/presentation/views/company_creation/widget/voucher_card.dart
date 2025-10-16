import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class VoucherCard extends StatefulWidget {
  final String title;
  final String description;
  final String logoUrl;

  const VoucherCard({
    super.key,
    required this.title,
    required this.description,
    required this.logoUrl,
  });

  @override
  State<VoucherCard> createState() => _VoucherCardState();
}

class _VoucherCardState extends State<VoucherCard> {
  String? selected;
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    final provider = Provider.of<CompanyCreationProvider>(context);
    final isActive = provider.isPlanActive(widget.title);
    final status = isActive
        ? appLocalization.voucher_card_activated
        : appLocalization.voucher_card_activat;
    final options = [
      appLocalization.voucher_card_yes,
      appLocalization.voucher_card_no,
    ];

    return Stack(
      children: [
        Container(
          // margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: ColorResources.dustyBlue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.getSize.height * 0.145),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          status,
                          style: context.textStyle.s12.w400.white.roboto,
                        ),
                        if (isActive) ...[
                          w4,
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: ColorResources.tealGreen,
                            child: Icon(
                              Icons.check,
                              size: 10,
                              color: ColorResources.white,
                            ),
                          ),
                        ],
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() => isExpand = !isExpand);
                      },
                      child: Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                        child: Icon(
                          isExpand ? Icons.close : Icons.add,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                if (isExpand) ...[
                  h14,
                  Text(
                    appLocalization.voucher_card_tally_serial_no,
                    style: context.textStyle.s12.white.w400.roboto,
                  ),
                  h4,
                  CustomTextField(
                    hint: appLocalization.voucher_card_tally_enter_serial_no,
                    hintTextStyle: context.textStyle.w500.dustyBlue.roboto,
                    maxLength: 10,
                    backgroundColor: ColorResources.lightGray.withValues(
                      alpha: 0.35,
                    ),
                    inputType: TextInputType.phone,
                    borderRadius: 12,
                    hintColor: ColorResources.dustyBlue,
                    borderColor: ColorResources.transparent,
                  ),
                  h13,
                  Text(
                    appLocalization.voucher_card_tally_maintain_stocks,
                    style: context.textStyle.s12.white.w400.roboto,
                  ),
                  h6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: options.map((option) {
                          final isSelected = selected == option;

                          return GestureDetector(
                            onTap: () {
                              setState(() => selected = option);

                              if (option == 'Yes') {
                                provider.activatePlan(widget.title);
                              } else {
                                if (provider.activePlan == widget.title) {
                                  provider.deactivatePlan();
                                }
                              }
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: context.getSize.width * 0.045,
                                  height: context.getSize.height * 0.022,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorResources.white,
                                    border: Border.all(
                                      color: isSelected
                                          ? ColorResources.amber
                                          : ColorResources.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: context.getSize.width * 0.0225,
                                      height: context.getSize.height * 0.01,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected
                                            ? ColorResources.amber
                                            : ColorResources.bluishGray,
                                      ),
                                    ),
                                  ),
                                ),
                                w10,
                                Text(
                                  option,
                                  style:
                                      context.textStyle.s12.w300.white.roboto,
                                ),
                                w16,
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          appLocalization.voucher_card_tally_help,
                          style: context.textStyle.s12.white.bold.roboto
                              .copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 16,
            left: 12,
            right: 15,
            bottom: 13,
          ),
          decoration: BoxDecoration(
            color: ColorResources.cloudWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: context.textStyle.s16.indigoBlue.bold.roboto,
                  ),
                  widget.logoUrl.isNotEmpty
                      ? Image.network(
                          widget.logoUrl,
                          height: 24,
                          fit: BoxFit.contain,
                        )
                      : Text(
                          appLocalization.voucher_card_logo_here,
                          style: context.textStyle.s12.rosePink.bold.roboto,
                        ),
                ],
              ),
              h16,
              Text(
                widget.description,
                style: context.textStyle.s12.bluishGray.w400.roboto,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

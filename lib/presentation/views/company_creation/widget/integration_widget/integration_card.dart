import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class VoucherCard extends StatefulWidget {
  final String title;
  final String description;
  final String logoUrl;
  final CompanyViewList? companyData;

  const VoucherCard({
    super.key,
    required this.title,
    required this.description,
    required this.logoUrl,
    required this.companyData,
  });

  @override
  State<VoucherCard> createState() => _VoucherCardState();
}

class _VoucherCardState extends State<VoucherCard> {
  int lastResetKey = 0;
  late TextEditingController integrationSerialNoController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = Provider.of<CompanyCreationProvider>(context);
    if (lastResetKey != provider.integrationResetKey) {
      _resetCardState();
      lastResetKey = provider.integrationResetKey;
    }
  }

  void _resetCardState() {
    setState(() {
      integrationSerialNoController.clear();
      selected = null;
      isExpand = false;
      isActivated = false;
    });
  }

  String? selected;
  bool isExpand = false;
  bool isActivated = false;
  bool isTextFilled = false;

  @override
  void initState() {
    super.initState();
    integrationSerialNoController = TextEditingController();
    integrationSerialNoController.addListener(() {
      setState(() {
        isTextFilled = integrationSerialNoController.text.trim().isNotEmpty;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      fillFields();

      final provider = context.read<CompanyCreationProvider>();
      if (widget.companyData != null &&
          widget.companyData!.integrationType == widget.title) {
        provider.setIntegrationType(widget.title);
        provider.setIntegrationSerialNo(widget.companyData!.serialNumber ?? "");
        provider.updateIntegrationSerialNo(
          widget.companyData!.serialNumber ?? "",
        );
        provider.setStockInCloud(
          widget.companyData!.stockInCloud == 'Yes' ||
              widget.companyData!.stockInCloud == true,
        );
      }
    });
  }

  void fillFields() {
    if (widget.companyData != null &&
        widget.companyData!.integrationType == widget.title) {
      integrationSerialNoController.text =
          widget.companyData!.serialNumber ?? "";
      selected = widget.companyData!.stockInCloud ?? "";
      isActivated = true;
      isExpand = true;
    } else {
      integrationSerialNoController.clear();
      selected = null;
      isActivated = false;
      isExpand = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    final provider = Provider.of<CompanyCreationProvider>(context);
    final status = isActivated
        ? appLocalization.voucher_card_activated
        : appLocalization.voucher_card_activat;
    final options = [
      appLocalization.voucher_card_yes,
      appLocalization.voucher_card_no,
    ];

    final isStandAlone = widget.title == 'Stand Alone';
    return Stack(
      children: [
        Container(
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
                        if (isActivated) ...[
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
                    Spacer(),
                    if (isExpand &&
                        !isStandAlone &&
                        !isActivated &&
                        isTextFilled) ...[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isActivated = true;
                            isExpand = false;
                          });
                        },
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: ColorResources.tealGreen,
                          child: Icon(
                            Icons.check,
                            size: 10,
                            color: ColorResources.white,
                          ),
                        ),
                      ),
                    ],
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async {
                        final provider = context
                            .read<CompanyCreationProvider>();

                        final activeIntegration =
                            widget.companyData?.integrationType;

                        final selectIntegration = widget.title;

                        final currentIntegration =
                            provider.selectedIntegrationType ??
                            widget.companyData?.integrationType;

                        final isSwitchingIntegration =
                            currentIntegration != null &&
                            currentIntegration != widget.title;

                        if (isStandAlone && !isSwitchingIntegration) {
                          setState(() {
                            isActivated = true;
                            isExpand = false;
                          });
                        }

                        // If tapping the same card → just toggle expand/collapse
                        if (provider.selectedIntegrationType == widget.title) {
                          setState(() => isExpand = !isExpand);
                          return;
                        }

                        print(
                          "currentIntegration${provider.selectedIntegrationType} ${widget.companyData?.integrationType}  ",
                        );
                        print("isSwitchingIntegration$isSwitchingIntegration");

                        //  If tapping a different card but an integration already exists → show dialog
                        if (isSwitchingIntegration) {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: ColorResources.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                title: const Center(
                                  child: Text(
                                    'Alert!',
                                    style: TextStyle(
                                      color: ColorResources.indigoBlue,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      'You are currently activated $activeIntegration integration in settings. Are you sure to want to change $activeIntegration integration into $selectIntegration Retail?',
                                      style: TextStyle(
                                        color: ColorResources.bluishGray,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },

                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(
                                                MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.0155,
                                                MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.056,
                                              ),
                                              backgroundColor:
                                                  ColorResources.indigoBlue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            child: const Text(
                                              'Change',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () => Navigator.of(
                                              context,
                                            ).pop(false),
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(
                                                MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.0155,
                                                MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.056,
                                              ),
                                              backgroundColor: ColorResources
                                                  .indigoBlue
                                                  .withOpacity(0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );

                          // User confirmed “Change”
                          if (confirm == true) {
                            provider.resetIntegration();
                            provider
                                .triggerFullReset(); // tell all cards to reset themselves

                            // Now expand THIS selected card after reset
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                isExpand = true;
                                isActivated = false;
                                integrationSerialNoController.clear();
                                selected = null;
                                provider.setIntegrationType(widget.title);

                                // Clear old integration data from companyData
                                if (widget.companyData != null) {
                                  widget.companyData!.integrationType =
                                      widget.title;
                                  widget.companyData!.serialNumber = null;
                                }

                                // If switching TO Stand Alone → instantly activate
                                if (isStandAlone) {
                                  isActivated = true;
                                  isExpand = false;
                                } else {
                                  // For other integrations → expand form as usual
                                  isExpand = true;
                                  isActivated = false;
                                }
                              });
                            });
                          }
                        } else {
                          // No existing integration → just expand/collapse current card
                          setState(() {
                            isExpand = !isExpand;
                            provider.setIntegrationType(widget.title);
                          });
                        }
                      },
                      child: isStandAlone
                          ? Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            )
                          : Container(
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
                if (isExpand && !isStandAlone) ...[
                  h14,
                  Text(
                    appLocalization.voucher_card_tally_serial_no,
                    style: context.textStyle.s12.white.w400.roboto,
                  ),
                  h4,
                  Consumer<CompanyCreationProvider>(
                    builder: (context, provider, _) {
                      return CustomTextField(
                        controller: integrationSerialNoController,
                        hint:
                            appLocalization.voucher_card_tally_enter_serial_no,
                        hintTextStyle: context.textStyle.w500.dustyBlue.roboto,
                        maxLength: 10,
                        backgroundColor: ColorResources.lightGray.withValues(
                          alpha: 0.35,
                        ),
                        inputType: TextInputType.phone,
                        borderRadius: 12,
                        hintColor: ColorResources.dustyBlue,
                        borderColor: ColorResources.transparent,
                        onChange: (value) {
                          provider.setIntegrationSerialNo(value);
                          provider.updateIntegrationSerialNo(value);
                          if (value.isNotEmpty) {
                            provider.setIntegrationType(widget.title);
                          }
                        },

                        autovalidateMode:
                            provider.integrationSerialNoAutovalidateMode,
                        failure: provider.integrationSerialNo.getFailure,
                      );
                    },
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
                              provider.setStockInCloud(
                                option == appLocalization.voucher_card_yes,
                              );
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

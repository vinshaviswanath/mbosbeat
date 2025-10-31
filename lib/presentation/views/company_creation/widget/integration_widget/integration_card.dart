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

  late TextEditingController integrationSerialNoController;

  String? selected;
  bool isExpand = false;
  bool isActivated = false;

  @override
  void initState() {
    super.initState();
    integrationSerialNoController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fillFields();

      final provider = context.read<CompanyCreationProvider>();
      if (widget.companyData != null &&
          widget.companyData!.integrationType == widget.title) {
        provider.setIntegrationType(widget.title);
        provider.setIntegrationSerialNo(widget.companyData!.serialNumber ?? "");
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
                    GestureDetector(
                      onTap: () async {
                        final provider = context
                            .read<CompanyCreationProvider>();

                        final hasExistingIntegration =
                            widget.companyData?.hasIntegrationSettings !=
                                null &&
                            widget.companyData!.integrationType != null;

                        // If tapping the same card → just toggle expand/collapse
                        if (provider.selectedIntegrationType == widget.title) {
                          setState(() => isExpand = !isExpand);
                          return;
                        }

                        //  If tapping a different card but an integration already exists → show dialog
                        if (hasExistingIntegration &&
                            widget.companyData!.integrationType !=
                                widget.title) {
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
                                    const Text(
                                      textAlign: TextAlign.center,
                                      'You are currently activated Tally integration in settings. Are you sure to want to change Tally integration into MPOS Retail?',
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
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
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

                            setState(() {
                              // Clear UI-level fields
                              ///integrationSerialNoController.clear();
                              ///selected = null;
                              //isExpand = true;

                              // 🧹 Clear old integration data from widget.companyData
                              if (widget.companyData != null) {
                                widget.companyData!.integrationType = null;
                                widget.companyData!.serialNumber = null;
                              }
                            });

                            provider.setIntegrationType(widget.title);
                          }
                        } else {
                          // No existing integration → just expand/collapse current card
                          setState(() {
                            isExpand = !isExpand;
                            provider.setIntegrationType(widget.title);
                          });
                        }
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

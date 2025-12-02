import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/voucher_numbering_response.dart';
import 'package:mpos_beat/domain/request/create_voucher_numbering_params.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class B2bAndB2cPrefixSuffix extends StatefulWidget {
  final VoucherNumberingModel data;
  const B2bAndB2cPrefixSuffix({super.key, required this.data});

  @override
  State<B2bAndB2cPrefixSuffix> createState() => _B2bAndB2cPrefixSuffixState();
}

class _B2bAndB2cPrefixSuffixState extends State<B2bAndB2cPrefixSuffix> {
  DateTime? selectedDate;
  String? selectedType;
  late TextEditingController prefixController;
  late TextEditingController suffixController;
  late TextEditingController widthController;
  late TextEditingController startFromController;
  late TextEditingController b2cPrefixController;
  late TextEditingController b2cSuffixController;
  late TextEditingController b2cWidthController;
  late TextEditingController b2cstartFromController;

  final _formKey = GlobalKey<FormState>();

  bool prefixError = false;
  bool suffixError = false;
  bool widthError = false;
  bool startFromError = false;
  bool b2cPrefixError = false;
  bool b2cSuffixError = false;
  bool b2cWidthError = false;
  bool b2cStartFromError = false;

  @override
  void initState() {
    super.initState();
    prefixController = TextEditingController(text: widget.data.b2BPrefix);
    suffixController = TextEditingController(text: widget.data.b2BSuffix);
    widthController = TextEditingController(
      text: widget.data.b2BWidth.toString(),
    );
    startFromController = TextEditingController(
      text: widget.data.b2BStartFrom.toString(),
    );

    b2cPrefixController = TextEditingController(text: widget.data.b2CPrefix);
    b2cSuffixController = TextEditingController(text: widget.data.b2CSuffix);
    b2cWidthController = TextEditingController(
      text: widget.data.b2CWidth.toString(),
    );
    b2cstartFromController = TextEditingController(
      text: widget.data.b2CStartFrom.toString(),
    );

    if (widget.data.hasB2B == 1) {
      selectedType = "B2B";
    }
    selectedDate = widget.data.applicableFrom;

    final provider = context.read<CompanyCreationProvider>();
    provider.isGodown
        ? provider.getVoucherNumberingGodown(
            context: context,
            companyId: provider.selectedCompany?.id.toString() ?? '',
            voucherModeId: provider.selectedVehicle?.id ?? 0,
          )
        : provider.getVoucherNumberingRoute(
            context: context,
            companyId: provider.selectedCompany?.id.toString() ?? '',
            voucherModeId: provider.selectedRoute?.id ?? 0,
          );
  }

  @override
  void dispose() {
    prefixController.dispose();
    suffixController.dispose();
    widthController.dispose();
    startFromController.dispose();
    b2cPrefixController.dispose();
    b2cSuffixController.dispose();
    b2cWidthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyCreationProvider>();
    final VoucherNumber fallback = VoucherNumber(
      voucherTypeId: widget.data.voucherTypeId,
      applicableFrom: widget.data.applicableFrom,
      hasB2B: widget.data.hasB2B,
      b2BPrefix: widget.data.b2BPrefix,
      b2BSuffix: widget.data.b2BSuffix,
      b2BWidth: widget.data.b2BWidth,
      b2BStartFrom: widget.data.b2BStartFrom,
      b2CPrefix: widget.data.b2CPrefix,
      b2CSuffix: widget.data.b2CSuffix,
      b2CWidth: widget.data.b2CWidth,
      b2CStartFrom: widget.data.b2CStartFrom,
      b2BDeclaration: widget.data.b2BDeclaration,
      b2CDeclaration: widget.data.b2CDeclaration,
    );
    final list = provider.voucherNumberList ?? <VoucherNumber>[];
    final VoucherNumber currentVoucher = list.firstWhere(
      (v) => v.voucherTypeId == widget.data.voucherTypeId,
      orElse: () => fallback,
    );
    final appLocalizations = context.l10n;
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "B2B",
                  style: context.textStyle.s10.w400.indigoBlue.roboto,
                ),
                GestureDetector(
                  onTap: () {
                    CustomDialog.showBottomCustomDialog(
                      child: StatefulBuilder(
                        builder: (context, setDialogState) {
                          return Container(
                            constraints: const BoxConstraints(maxWidth: 400),
                            child: CustomScrollView(
                              shrinkWrap: true,
                              slivers: [
                                SliverToBoxAdapter(
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child:  CircleAvatar(
                                                                                        backgroundColor: ColorResources.bluishGray.withValues(
                                                                                          alpha: 0.15,
                                                                                        ),
                                                                                        radius: 12,
                                                                                        child: const Icon(
                                                                                          Icons.close,
                                                                                          size: 12,
                                                                                          color: ColorResources.bluishGray,
                                                                                        ),
                                                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              appLocalizations
                                                  .godown_route_voucher_serires,
                                              style: context
                                                  .textStyle
                                                  .s14
                                                  .w500
                                                  .dustyBlue
                                                  .roboto,
                                            ),
                                          ],
                                        ),
                                        h12,

                                        Text(
                                          "Sales Order B2B:",
                                          style: context
                                              .textStyle
                                              .s12
                                              .w400
                                              .bluishGray
                                              .roboto,
                                        ),
                                        h12,

                                        Text(
                                          "Applicable From",
                                          style: context
                                              .textStyle
                                              .s09
                                              .w300
                                              .bluishGray
                                              .roboto,
                                        ),
                                        h4,
                                        // Date Picker
                                        InkWell(
                                          onTap: () async {
                                            final picked = await showDatePicker(
                                              context: context,
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2100),
                                              initialDate: DateTime.now(),
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(context).copyWith(
                                                    colorScheme: const ColorScheme.light(
                                                      surface: ColorResources
                                                          .indigoBlue, // Calendar background
                                                      primary: ColorResources
                                                          .indigoBlue, // Header & selected date
                                                      onPrimary: ColorResources
                                                          .indigoBlue, // Header text color
                                                      onSurface: ColorResources
                                                          .indigoBlue, // Default text color
                                                    ),
                                                    // ignore: deprecated_member_use
                                                    dialogBackgroundColor: Colors
                                                        .white, // whole dialog background
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            );
                                            if (picked != null) {
                                              Logger.logInfo(
                                                "Selected date: $picked",
                                              );
                                              if (!mounted) return;
                                              setDialogState(
                                                () => selectedDate = picked,
                                              );
                                            }
                                          },

                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12,
                                              horizontal: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                255,
                                                244,
                                                247,
                                                244,
                                              ).withValues(alpha: 0.65),

                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  selectedDate == null
                                                      ? "Select Date"
                                                      : "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}",
                                                  style: context
                                                      .textStyle
                                                      .s11
                                                      .w400
                                                      .bluishGray
                                                      .roboto,
                                                ),
                                                const Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 18,
                                                  color:
                                                      ColorResources.bluishGray,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        h12,

                                        Text(
                                          "Voucher Type",
                                          style: context
                                              .textStyle
                                              .s12
                                              .w400
                                              .bluishGray
                                              .roboto,
                                        ),
                                        h4,

                                        // Dropdown
                                        Container(
                                          decoration: BoxDecoration(
                                            color: ColorResources.lightGray
                                                .withValues(alpha: 0.65),

                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: selectedType,
                                              hint: Text(
                                                "Voucher Type",
                                                style: context
                                                    .textStyle
                                                    .s11
                                                    .w400
                                                    .bluishGray
                                                    .roboto,
                                              ),
                                              isExpanded: true,
                                              icon: const Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                              ),
                                              items: [
                                                DropdownMenuItem(
                                                  value: "B2B",
                                                  child: Text(
                                                    "B2B",
                                                    style: context
                                                        .textStyle
                                                        .s11
                                                        .w400
                                                        .bluishGray
                                                        .roboto,
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: "B2C",
                                                  child: Text(
                                                    "B2C",
                                                    style: context
                                                        .textStyle
                                                        .s11
                                                        .w400
                                                        .bluishGray
                                                        .roboto,
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                setDialogState(
                                                  () => selectedType = value,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        h12,

                                        Text(
                                          "Prefix",
                                          style: context
                                              .textStyle
                                              .s12
                                              .w400
                                              .bluishGray
                                              .roboto,
                                        ),
                                        h4,
                                        TextFormField(
                                          style: context
                                              .textStyle
                                              .s11
                                              .w400
                                              .bluishGray
                                              .roboto,
                                          controller: selectedType == "B2B"
                                              ? prefixController
                                              : b2cPrefixController,
                                          validator: (val) =>
                                              (val == null || val.isEmpty)
                                              ? "Prefix is required"
                                              : null,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: ColorResources.lightGray
                                                .withValues(alpha: 0.65),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                  vertical: 12,
                                                  horizontal: 12,
                                                ),
                                            border: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 1.5,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                    color: Colors.red,
                                                    width: 1.5,
                                                  ),
                                                ),
                                          ),
                                        ),
                                        h12,

                                        Text(
                                          "Suffix",
                                          style: context
                                              .textStyle
                                              .s12
                                              .w400
                                              .bluishGray
                                              .roboto,
                                        ),
                                        h4,
                                        TextFormField(
                                          style: context
                                              .textStyle
                                              .s11
                                              .w400
                                              .bluishGray
                                              .roboto,
                                          controller: selectedType == "B2B"
                                              ? suffixController
                                              : b2cSuffixController,
                                          validator: (val) =>
                                              (val == null || val.isEmpty)
                                              ? "Suffix is required"
                                              : null,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: ColorResources.lightGray
                                                .withValues(alpha: 0.65),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                  vertical: 12,
                                                  horizontal: 12,
                                                ),
                                            border: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 1.5,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                    color: Colors.red,
                                                    width: 1.5,
                                                  ),
                                                ),
                                          ),
                                        ),
                                        h12,

                                        Text(
                                          "Width",
                                          style: context
                                              .textStyle
                                              .s12
                                              .w400
                                              .bluishGray
                                              .roboto,
                                        ),
                                        h4,
                                        TextFormField(
                                          style: context
                                              .textStyle
                                              .s11
                                              .w400
                                              .bluishGray
                                              .roboto,
                                          controller: selectedType == "B2B"
                                              ? widthController
                                              : b2cWidthController,
                                          keyboardType: TextInputType.number,
                                          validator: (val) =>
                                              (val == null || val.isEmpty)
                                              ? "Width is required"
                                              : null,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: ColorResources.lightGray
                                                .withValues(alpha: 0.65),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                  vertical: 12,
                                                  horizontal: 12,
                                                ),
                                            border: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 1.5,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                    color: Colors.red,
                                                    width: 1.5,
                                                  ),
                                                ),
                                          ),
                                        ),
                                        h12,

                                        Text(
                                          "Starts From",
                                          style: context
                                              .textStyle
                                              .s12
                                              .w400
                                              .bluishGray
                                              .roboto,
                                        ),
                                        h4,
                                        TextFormField(
                                          style: context
                                              .textStyle
                                              .s11
                                              .w400
                                              .bluishGray
                                              .roboto,
                                          controller: selectedType == "B2B"
                                              ? startFromController
                                              : b2cstartFromController,
                                          keyboardType: TextInputType.number,
                                          validator: (val) =>
                                              (val == null || val.isEmpty)
                                              ? "Start From is required"
                                              : null,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: ColorResources.lightGray
                                                .withValues(alpha: 0.65),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                  vertical: 12,
                                                  horizontal: 12,
                                                ),
                                            border: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 1.5,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                    color: Colors.red,
                                                    width: 1.5,
                                                  ),
                                                ),
                                          ),
                                        ),
                                        h24,

                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  context.getSize.width / 3.5,
                                            ),
                                            child: CustomButton(
                                              buttonText: "Save",
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              textStyle: context
                                                  .textStyle
                                                  .s12
                                                  .w500
                                                  .white,
                                              isborderEnable: false,
                                              onTap: () {
                                                final provider = context
                                                    .read<
                                                      CompanyCreationProvider
                                                    >();
                                                if (_formKey.currentState
                                                        ?.validate() ??
                                                    false) {
                                                  final updatedVoucher =
                                                      VoucherNumber(
                                                        voucherTypeId: widget
                                                            .data
                                                            .voucherTypeId,
                                                        applicableFrom:
                                                            selectedDate ??
                                                            widget
                                                                .data
                                                                .applicableFrom,
                                                        hasB2B:
                                                            widget.data.hasB2B,
                                                        b2BPrefix:
                                                            prefixController
                                                                .text,
                                                        b2BSuffix:
                                                            suffixController
                                                                .text,
                                                        b2BWidth:
                                                            int.tryParse(
                                                              widthController
                                                                  .text,
                                                            ) ??
                                                            widget
                                                                .data
                                                                .b2BWidth,
                                                        b2BStartFrom:
                                                            int.tryParse(
                                                              startFromController
                                                                  .text,
                                                            ) ??
                                                            widget
                                                                .data
                                                                .b2BStartFrom,
                                                        b2CPrefix:
                                                            b2cPrefixController
                                                                .text,
                                                        b2CSuffix:
                                                            b2cSuffixController
                                                                .text,
                                                        b2CWidth:
                                                            int.tryParse(
                                                              b2cWidthController
                                                                  .text,
                                                            ) ??
                                                            widget
                                                                .data
                                                                .b2CWidth,
                                                        b2CStartFrom:
                                                            int.tryParse(
                                                              b2cstartFromController
                                                                  .text,
                                                            ) ??
                                                            widget
                                                                .data
                                                                .b2CStartFrom,
                                                        b2BDeclaration: widget
                                                            .data
                                                            .b2BDeclaration,
                                                        b2CDeclaration: widget
                                                            .data
                                                            .b2CDeclaration,
                                                      );
                                                  Logger.logSuccess(
                                                    "Voucher Mode ::: ${provider.isGodown}",
                                                  );

                                                  provider
                                                      .addOrUpdateVoucherNumber(
                                                        updatedVoucher,
                                                      );
                                                  if (!mounted) return;
                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        h12,
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorResources.bluishGray.withValues(alpha: 0.3),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.editIcon,
                      colorFilter: const ColorFilter.mode(
                        ColorResources.indigoBlue,
                        BlendMode.srcIn,
                      ),
                      height: 12,
                    ),

                    // const Icon(
                    //   Icons.search,
                    //   size: 10,
                    //   color: ColorResources.indigoBlue,
                    // ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Prefix: ",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                      Text(
                        "${widget.data.b2BPrefix}",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Suffix: ",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                      Text(
                        "${widget.data.b2BSuffix}",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Width: ",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                      Text(
                        "${widget.data.b2BWidth}",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            h12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "B2C",
                  style: context.textStyle.s10.w400.indigoBlue.roboto,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Prefix: ",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                      Text(
                        "${widget.data.b2CPrefix}",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Suffix: ",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                      Text(
                        "${widget.data.b2CSuffix}",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Width: ",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                      Text(
                        "${widget.data.b2CWidth}",
                        style: context.textStyle.s12.w400.bluishGray.roboto,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

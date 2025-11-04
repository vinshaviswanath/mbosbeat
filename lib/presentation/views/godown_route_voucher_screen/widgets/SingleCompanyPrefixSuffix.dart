import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/voucher_numbering_response.dart';
import 'package:mpos_beat/domain/request/create_voucher_numbering_params.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class SingleCompanyPrefixSuffix extends StatefulWidget {
  final VoucherNumberingModel data;
  const SingleCompanyPrefixSuffix({super.key, required this.data});

  @override
  State<SingleCompanyPrefixSuffix> createState() =>
      _SingleCompanyPrefixSuffixState();
}

class _SingleCompanyPrefixSuffixState extends State<SingleCompanyPrefixSuffix> {
  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  String? selectedType;
  late TextEditingController prefixController;
  late TextEditingController suffixController;
  late TextEditingController widthController;
  late TextEditingController startFromController;

  late TextEditingController b2cPrefixController;
  late TextEditingController b2cSuffixController;
  late TextEditingController b2cWidthController;
  late TextEditingController b2cStartFromController;

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

    b2cPrefixController = TextEditingController();
    b2cSuffixController = TextEditingController();
    b2cWidthController = TextEditingController();
    b2cStartFromController = TextEditingController();

    selectedType = "B2B";
    selectedDate = widget.data.applicableFrom;
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
    b2cStartFromController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    final data = widget.data;

    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        final fallback = VoucherNumber(
          voucherTypeId: data.voucherTypeId,
          applicableFrom: data.applicableFrom,
          hasB2B: data.hasB2B,
          b2BPrefix: data.b2BPrefix,
          b2BSuffix: data.b2BSuffix,
          b2BWidth: data.b2BWidth,
          b2BStartFrom: data.b2BStartFrom,
          b2CPrefix: null,
          b2CSuffix: null,
          b2CWidth: null,
          b2CStartFrom: null,
          b2BDeclaration: data.b2BDeclaration,
          b2CDeclaration: null,
        );

        // final currentVoucher =
        //     provider.voucherNumberList?.firstWhere(
        //       (v) => v.voucherTypeId == data.voucherTypeId,
        //       orElse: () => fallback,
        //     ) ??
        //     fallback;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Prefix: ",
                      style: context.textStyle.s12.w400.bluishGray.roboto,
                    ),
                    Text(
                      "${data.b2BPrefix}",
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
                      "${data.b2BSuffix}",
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
                      "${data.b2BWidth}",
                      style: context.textStyle.s12.w400.bluishGray.roboto,
                    ),
                    w16,
                    GestureDetector(
                      onTap: () {
                        prefixController = TextEditingController(
                          text: data.b2BPrefix,
                        );
                        suffixController = TextEditingController(
                          text: data.b2BSuffix,
                        );
                        widthController = TextEditingController(
                          text: data.b2BWidth.toString(),
                        );
                        startFromController = TextEditingController(
                          text: data.b2BStartFrom.toString(),
                        );
                        CustomDialog.showBottomCustomDialog(
                          chid: StatefulBuilder(
                            builder: (context, setDialogState) {
                              return Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 400,
                                ),
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
                                            onTap: () => Navigator.pop(context),
                                            child: const CircleAvatar(
                                              radius: 12,
                                              child: Icon(
                                                Icons.close,
                                                color:
                                                    ColorResources.bluishGray,
                                                size: 16,
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
                                        "Applicable From",
                                        style: context
                                            .textStyle
                                            .s09
                                            .w300
                                            .bluishGray
                                            .roboto,
                                      ),
                                      h4,
                                      InkWell(
                                        onTap: () async {
                                          final picked = await showDatePicker(
                                            context: context,
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                            initialDate:
                                                selectedDate ?? DateTime.now(),
                                          );
                                          if (picked != null) {
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
                                            color: ColorResources.lightGray
                                                .withValues(alpha: 0.65),
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                selectedDate == null
                                                    ? "Select Date"
                                                    : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
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
                                      const SizedBox(height: 4),

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
                                              Icons.keyboard_arrow_down_rounded,
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
                                            ],

                                            onChanged: (value) {
                                              setState(
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
                                        controller: prefixController,
                                        validator: (val) =>
                                            val == null || val.isEmpty
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
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
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
                                        controller: suffixController,
                                        validator: (val) =>
                                            val == null || val.isEmpty
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
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
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
                                        controller: widthController,
                                        keyboardType: TextInputType.number,
                                        validator: (val) =>
                                            val == null || val.isEmpty
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
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
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
                                        controller: startFromController,
                                        keyboardType: TextInputType.number,
                                        validator: (val) =>
                                            val == null || val.isEmpty
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
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
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
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                            textStyle: context
                                                .textStyle
                                                .s12
                                                .w500
                                                .white,
                                            isborderEnable: false,
                                            onTap: () {
                                              if (_formKey.currentState
                                                      ?.validate() ??
                                                  false) {
                                                final updatedVoucher =
                                                    VoucherNumber(
                                                      voucherTypeId:
                                                          data.voucherTypeId,
                                                      applicableFrom:
                                                          selectedDate ??
                                                          data.applicableFrom,
                                                      hasB2B: data.hasB2B,
                                                      b2BPrefix:
                                                          prefixController.text,
                                                      b2BSuffix:
                                                          suffixController.text,
                                                      b2BWidth:
                                                          int.tryParse(
                                                            widthController
                                                                .text,
                                                          ) ??
                                                          data.b2BWidth,
                                                      b2BStartFrom:
                                                          int.tryParse(
                                                            startFromController
                                                                .text,
                                                          ) ??
                                                          data.b2BStartFrom,
                                                      b2CPrefix: "",
                                                      b2CSuffix: "",
                                                      b2CWidth: 0,
                                                      b2CStartFrom: 0,
                                                      b2BDeclaration:
                                                          data.b2BDeclaration,
                                                      b2CDeclaration: "",
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
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorResources.bluishGray.withValues(
                            alpha: 0.3,
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 10,
                          color: ColorResources.indigoBlue,
                        ),
                      ),
                    ),
                    w8,
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class B2bAndB2cPrefixSuffix extends StatefulWidget {
  const B2bAndB2cPrefixSuffix({super.key});

  @override
  State<B2bAndB2cPrefixSuffix> createState() => _B2bAndB2cPrefixSuffixState();
}

String? selecteRoute;
final TextEditingController prefixController = TextEditingController();
final TextEditingController suffixController = TextEditingController();
final TextEditingController widthController = TextEditingController();
final TextEditingController startController = TextEditingController();

DateTime? selectedDate;
String? selectedType;

class _B2bAndB2cPrefixSuffixState extends State<B2bAndB2cPrefixSuffix> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("B2B", style: context.textStyle.s10.w400.indigoBlue.roboto),
            GestureDetector(
              onTap: () {
                CustomDialog.showBottomCustomDialog(
                  chid: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const CircleAvatar(
                                      radius: 12,
                                      child: Icon(
                                        Icons.close,
                                        color: ColorResources.bluishGray,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  );
                                  if (picked != null) {
                                    setState(() => selectedDate = picked);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorResources.lightGray.withValues(
                                      alpha: 0.65,
                                    ),

                                    borderRadius: BorderRadius.circular(15),
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
                                        color: ColorResources.bluishGray,
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
                                  color: ColorResources.lightGray.withValues(
                                    alpha: 0.65,
                                  ),

                                  borderRadius: BorderRadius.circular(12),
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
                                    items: const [
                                      // DropdownMenuItem(
                                      //   value: "Type A",
                                      //   child: Text("Type A"),
                                      // ),
                                      // DropdownMenuItem(
                                      //   value: "Type B",
                                      //   child: Text("Type B"),
                                      // ),
                                    ],
                                    onChanged: (value) {
                                      setState(() => selectedType = value);
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
                              TextField(
                                controller: prefixController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorResources.lightGray
                                      .withValues(alpha: 0.65),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
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
                              TextField(
                                controller: suffixController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorResources.lightGray
                                      .withValues(alpha: 0.65),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
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
                              TextField(
                                controller: widthController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorResources.lightGray
                                      .withValues(alpha: 0.65),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
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
                              TextField(
                                controller: startController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorResources.lightGray
                                      .withValues(alpha: 0.65),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              h24,

                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.getSize.width / 3.5,
                                  ),
                                  child: CustomButton(
                                    buttonText: "Save",
                                    borderRadius: BorderRadius.circular(16),
                                    textStyle: context.textStyle.s12.w500.white,
                                    isborderEnable: false,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                              h12,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorResources.bluishGray.withValues(alpha: 0.3),
                ),
                child: const Icon(
                  Icons.edit,
                  size: 10,
                  color: ColorResources.indigoBlue,
                ),
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
                    "xxxxx",
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
                    "xxxxx",
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
                    "xxxxx",
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
            Text("B2C", style: context.textStyle.s10.w400.indigoBlue.roboto),
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
                    "xxxxx",
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
                    "xxxxx",
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
                    "xxxxx",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

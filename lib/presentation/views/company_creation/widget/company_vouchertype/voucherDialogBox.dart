import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/data/company_voucher_data.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
 import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/toggleDialogbox.dart';

class VoucherDialogbox extends StatefulWidget {
  final int id;
  final int isCheckOn;
  final int isToggleOn;
  final CompanyVoucherTypesListData? companydata;

  const VoucherDialogbox({
    super.key,
    required this.id,
    required this.companydata,
    required this.isCheckOn,
    required this.isToggleOn,
  });

  @override
  State<VoucherDialogbox> createState() => _VoucherDialogboxState();
}

class _VoucherDialogboxState extends State<VoucherDialogbox> {
  late bool isToggleOn;
  late PageController pageController;
  late Map<int, int> pageIndices = {};

  /// -------- B2B controllers ----------
  final b2bPrefixController = TextEditingController();
  final b2bWidthController = TextEditingController();
  final b2bSuffixController = TextEditingController();
  final b2bDeclarationController = TextEditingController();

  /// -------- B2C controllers ----------
  final b2cPrefixController = TextEditingController();
  final b2cWidthController = TextEditingController();
  final b2cSuffixController = TextEditingController();
  final b2cDeclarationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    isToggleOn = widget.isToggleOn == 1;
    pageIndices = {widget.id: 0};

    /// Fill B2B
    b2bPrefixController.text = widget.companydata!.b2BPrefix;
    b2bWidthController.text = widget.companydata!.b2BWidth.toString();
    b2bSuffixController.text = widget.companydata!.b2BSuffix;
    b2bDeclarationController.text = widget.companydata!.b2BDeclaration;

    /// Fill B2C
    b2cPrefixController.text = widget.companydata!.b2CPrefix;
    b2cWidthController.text = widget.companydata!.b2CWidth.toString();
    b2cSuffixController.text = widget.companydata!.b2CSuffix;
    b2cDeclarationController.text = widget.companydata!.b2CDeclaration;
    super.initState();
  }

  String _b2berrorText = "";
  String _b2cerrorText = "";
  bool _hasAnyB2BInput() {
    return b2bPrefixController.text.trim().isNotEmpty ||
        b2bSuffixController.text.trim().isNotEmpty ||
        b2bWidthController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CompanyCreationProvider>(
      context,
      listen: false,
    );

    bool _isB2BFilled() {
      return b2bPrefixController.text.trim().isNotEmpty &&
          b2bWidthController.text.trim().isNotEmpty;
    }

    bool _isvalidwidth() {
      final width = int.tryParse(b2bWidthController.text.trim());
      return width != null && width > 0;
    }

    return AlertDialog(
      backgroundColor: Color(0xFFF1F3F7),
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.companydata!.voucherMenuName,
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                color: Color(0xFF36489B),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: CircleAvatar(
                              backgroundColor: ColorResources.bluishGray
                                  .withValues(alpha: 0.15),
                              radius: 12,
                              child: const Icon(
                                Icons.close,
                                size: 12,
                                color: ColorResources.bluishGray,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //user b2b or b2c
                if (widget.companydata!.hasB2BB2C == "Yes" &&
                    provider.selectedregistrationtype?.registrationType ==
                        "Registered") ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Use B2B / B2C',
                          style: context.textStyle.s12.w400.dustyBlue.roboto,
                        ),
                      ),
                      //toggle button
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          inactiveThumbColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          activeThumbColor: Theme.of(
                            context,
                          ).colorScheme.onPrimary,
                          inactiveTrackColor: Theme.of(
                            context,
                          ).colorScheme.onPrimary,
                          activeTrackColor: Color(0xFF36489B),
                          value: isToggleOn,
                          onChanged: (value) async {
                            if (!value) {
                              final result = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ToggleDialogBox(
                                    companyId: widget.companydata!.companyId,
                                    isCheckOn: widget.isCheckOn,
                                    isToggleOn: widget.isToggleOn,
                                    id: widget.companydata!.id,
                                  );
                                },
                              );

                              if (result == true) {
                                // User clicked "Yes" in the dialog
                                setState(() {
                                  isToggleOn = false;
                                  widget.companydata!.hasB2B = 0;

                                  // Correctly update the toggle state
                                });
                              }
                            } else {
                              // If the toggle is being switched on, update the state directly
                              setState(() {
                                isToggleOn =
                                    true; // Correctly update the toggle state
                                widget.companydata!.hasB2B = 1;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],

                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF98A6BE),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //tab selection B2B
                          TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndices[widget.id] = 0;
                              });
                              pageController.jumpToPage(0);
                            },
                            child: Text(
                              'B2B',

                              style: Theme.of(context).textTheme.displaySmall!
                                  .copyWith(
                                    color: pageIndices[widget.id] == 0
                                        ? Color(0xFF36489B)
                                        : Color(0xffFFFFFF),
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                          if (isToggleOn) ...[
                            Transform.rotate(
                              angle: 1.6,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.003,
                                width:
                                    MediaQuery.of(context).size.width * 0.099,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimary.withValues(alpha: 0.2),
                              ),
                            ),

                            //tab selection B2C
                            TextButton(
                              onPressed: () {
                                if (!_isB2BFilled()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Please fill all B2B fields before switching to B2C.',
                                      ),
                                    ),
                                  );
                                  return; // Prevent switching to B2C if B2B fields are not filled
                                }
                                if (!_isvalidwidth()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Please provide valid width',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                setState(() {
                                  pageIndices[widget.id] = 1;
                                });
                                pageController.jumpToPage(1);
                              },
                              child: Text(
                                "B2C",
                                style: Theme.of(context).textTheme.displaySmall!
                                    .copyWith(
                                      color: pageIndices[widget.id] == 1
                                          ? Color(0xFF36489B)
                                          : Color(0xffFFFFFF),
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.340,
                        width: MediaQuery.of(context).size.height * 0.380,
                        decoration: BoxDecoration(
                          //color: Theme.of(context).colorScheme.onPrimary,
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primaryFixed,
                          ),
                        ),
                        child: PageView(
                          controller: pageController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.zero,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.015,
                                      ),

                                      Text(
                                        "Voucher No.",
                                        style: context
                                            .textStyle
                                            .s12
                                            .w400
                                            .dustyBlue
                                            .roboto,
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.02,
                                      ),

                                      Form(
                                        key: _formKey,
                                        child: Row(
                                          children: [
                                            /// -------- PREFIX --------
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Prefix",
                                                  style: context
                                                      .textStyle
                                                      .s12
                                                      .w400
                                                      .dustyBlue
                                                      .roboto,
                                                ),
                                                SizedBox(
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.23,
                                                  height:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.height *
                                                      0.041,
                                                  child: TextFormField(
                                                    controller:
                                                        b2bPrefixController,
                                                    textAlignVertical:
                                                        const TextAlignVertical(
                                                          y: -1,
                                                        ),
                                                    cursorHeight: 15,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 8,
                                                          ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              18,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.015,
                                            ),

                                            /// -------- WIDTH --------
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Width",
                                                  style: context
                                                      .textStyle
                                                      .s12
                                                      .w400
                                                      .dustyBlue
                                                      .roboto,
                                                ),
                                                SizedBox(
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.23,
                                                  height:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.height *
                                                      0.041,
                                                  child: TextFormField(
                                                    controller:
                                                        b2bWidthController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    textAlignVertical:
                                                        const TextAlignVertical(
                                                          y: -1,
                                                        ),
                                                    cursorHeight: 15,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 8,
                                                          ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              18,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.015,
                                            ),

                                            /// -------- SUFFIX --------
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Suffix",
                                                  style: context
                                                      .textStyle
                                                      .s12
                                                      .w400
                                                      .dustyBlue
                                                      .roboto,
                                                ),
                                                SizedBox(
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.23,
                                                  height:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.height *
                                                      0.041,
                                                  child: TextFormField(
                                                    controller:
                                                        b2bSuffixController,
                                                    textAlignVertical:
                                                        const TextAlignVertical(
                                                          y: -1,
                                                        ),
                                                    cursorHeight: 15,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 8,
                                                          ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              18,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (_b2berrorText.isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                            top: 4,
                                          ),
                                          child: Text(
                                            _b2berrorText,
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.01,
                                      ),

                                      Text(
                                        "Declaration",
                                        style: context
                                            .textStyle
                                            .s12
                                            .w400
                                            .dustyBlue
                                            .roboto,
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.004,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.77,
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.10,
                                          child: TextFormField(
                                            controller:
                                                b2bDeclarationController,
                                            maxLines: 2,
                                            cursorHeight: 20,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.015,
                                      ),

                                      Text(
                                        "Voucher No.",
                                        style: context
                                            .textStyle
                                            .s12
                                            .w400
                                            .dustyBlue
                                            .roboto,
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.02,
                                      ),

                                      Row(
                                        children: [
                                          /// -------- PREFIX --------
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Prefix",
                                                style: context
                                                    .textStyle
                                                    .s12
                                                    .w400
                                                    .dustyBlue
                                                    .roboto,
                                              ),
                                              SizedBox(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.23,
                                                height:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.041,
                                                child: TextFormField(
                                                  controller:
                                                      b2cPrefixController,
                                                  textAlignVertical:
                                                      const TextAlignVertical(
                                                        y: -1,
                                                      ),
                                                  cursorHeight: 15,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 8,
                                                        ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            18,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(
                                            width:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width *
                                                0.015,
                                          ),

                                          /// -------- WIDTH --------
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Width",
                                                style: context
                                                    .textStyle
                                                    .s12
                                                    .w400
                                                    .dustyBlue
                                                    .roboto,
                                              ),
                                              SizedBox(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.23,
                                                height:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.041,
                                                child: TextFormField(
                                                  controller:
                                                      b2cWidthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textAlignVertical:
                                                      const TextAlignVertical(
                                                        y: -1,
                                                      ),
                                                  cursorHeight: 15,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 8,
                                                        ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            18,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(
                                            width:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width *
                                                0.015,
                                          ),

                                          /// -------- SUFFIX --------
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Suffix",
                                                style: context
                                                    .textStyle
                                                    .s12
                                                    .w400
                                                    .dustyBlue
                                                    .roboto,
                                              ),
                                              SizedBox(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.23,
                                                height:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.041,
                                                child: TextFormField(
                                                  controller:
                                                      b2cSuffixController,
                                                  textAlignVertical:
                                                      const TextAlignVertical(
                                                        y: -1,
                                                      ),
                                                  cursorHeight: 15,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 8,
                                                        ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            18,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      if (_b2cerrorText.isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                            top: 4,
                                          ),
                                          child: Text(
                                            _b2cerrorText,
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.01,
                                      ),

                                      Text(
                                        "Declaration",
                                        style: context
                                            .textStyle
                                            .s12
                                            .w400
                                            .dustyBlue
                                            .roboto,
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.004,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.77,
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.10,
                                          child: TextFormField(
                                            controller:
                                                b2cDeclarationController,
                                            maxLines: 2,
                                            cursorHeight: 20,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),

                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorResources.indigoBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.40,
                              MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                          onPressed: () async {
                            if (_hasAnyB2BInput()) {
                              final b2bprefix = b2bPrefixController.text.trim();
                              final b2bsuffix = b2bSuffixController.text.trim();
                              final b2bwidthText = b2bWidthController.text
                                  .trim();

                              final b2bwidth = int.tryParse(b2bwidthText) ?? 0;
                              final b2btotalLength =
                                  b2bprefix.length +
                                  b2bwidth +
                                  b2bsuffix.length;

                              if (b2btotalLength > 16) {
                                setState(() {
                                  _b2berrorText =
                                      "Only 16 digits allowed for Voucher Number!";
                                });

                                return; // stop saving
                              }
                            }

                            final b2cprefix = b2cPrefixController.text.trim();
                            final b2csuffix = b2cSuffixController.text.trim();
                            final b2cwidthText = b2cWidthController.text.trim();

                            if (b2cprefix.isNotEmpty ||
                                b2csuffix.isNotEmpty ||
                                b2cwidthText.isNotEmpty) {
                              final b2cwidth = int.tryParse(b2cwidthText) ?? 0;
                              final b2ctotalLength =
                                  b2cprefix.length +
                                  b2cwidth +
                                  b2csuffix.length;

                              if (b2ctotalLength > 16) {
                                setState(() {
                                  _b2cerrorText =
                                      "Only 16 digits allowed for Voucher Number!";
                                });

                                return;
                              }
                            }

                            final provider =
                                Provider.of<CompanyCreationProvider>(
                                  context,
                                  listen: false,
                                );

                            await provider.createCompanyVoucherTypes(
                              context,
                              request: CreateCompanyVocherParams(
                                id: widget.companydata!.id,
                                companyid: widget.companydata!.companyId,
                                hasB2B: isToggleOn ? 1 : 0,
                                b2Bprefix: b2bPrefixController.text,
                                b2Bwidth:
                                    int.tryParse(b2bWidthController.text) ?? 0,
                                b2Bsuffix: b2bSuffixController.text,
                                b2Bdeclaration: b2bDeclarationController.text,
                                b2Cprefix: b2cPrefixController.text,
                                b2Cwidth:
                                    int.tryParse(b2cWidthController.text) ?? 0,
                                b2Csuffix: b2cSuffixController.text,
                                b2Cdeclaration: b2cDeclarationController.text,

                                isenabled: widget.isCheckOn == 1 ? 1 : 0,
                              ),
                            );

                            await provider.fetchVoucherTypes(
                              context,
                              widget.companydata!.companyId,
                            );

                            context.pop();
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

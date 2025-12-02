import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/data/company_voucher_data.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/common_snackbar.dart';

class B2bContainer extends StatefulWidget {
  final int companyId;
  final int isCheckOn;
  final int isToggleOn;
  final CompanyVoucherTypesListData? companydata;
  final void Function()? onTap;
  const B2bContainer({
    super.key,
    required this.companyId,
    required this.isCheckOn,
    required this.isToggleOn,
    required this.companydata,
    this.onTap,
  });
  @override
  State<B2bContainer> createState() => _B2bContainerState();
}

class _B2bContainerState extends State<B2bContainer> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController b2bprefixcontroller = TextEditingController();
  TextEditingController b2bwidthcontroller = TextEditingController();
  TextEditingController b2bsuffixcontroller = TextEditingController();
  TextEditingController b2bdeclarationcontroller = TextEditingController();
  bool _isInputValid = true;
  bool _isPrefixValid = true;
  bool _isSuffixValid = true;
  String _errorText = "";
  // String _errorText2 = "";

  @override
  void initState() {
    print("companyid in b2bContainer ....${widget.companyId}");
    print("hasb2b toggle in  b2bContainer ....${widget.isToggleOn}");
    print("checkbox  in  b2bContainer ....${widget.isCheckOn}");
    print("companydata  in  b2bContainer ....${widget.companydata}");

    fillFields();
    super.initState();
  }

  void _validateInput() {
    final prefixLength = b2bprefixcontroller.text.length;
    final suffixLength = b2bsuffixcontroller.text.length;

    // Check if prefix is empty
    if (b2bprefixcontroller.text.isEmpty) {
      setState(() {
        _isPrefixValid = false;
        _errorText = "Prefix cannot be empty!";
      });

      // Hide the error message after 2 seconds
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isPrefixValid = true;
          _errorText = ""; // Clear the error message
        });
      });

      return;
    }

    // Check if suffix is empty
    // if (b2bsuffixcontroller.text.isEmpty) {
    //   setState(() {
    //     _isSuffixValid = false;
    //     _errorText = "Suffix cannot be empty!";
    //   });

    //   Future.delayed(const Duration(seconds: 2), () {
    //     setState(() {
    //       _isSuffixValid = true;
    //       _errorText = "";
    //     });
    //   });
    //   return;
    // }
    setState(() {
      _isPrefixValid = true;
      _isSuffixValid = true;
      _errorText = "";
    });

    // Get the width value
    String widthValue = b2bwidthcontroller.text;

    // Dynamically pad the width value based on the input number
    String paddedWidth = widthValue.padLeft(int.parse(widthValue), '0');
    int widthLength = paddedWidth.length;

    // Debugging to check the padded width value
    print("Padded Width: $paddedWidth"); // Check if padding is correct

    // Debugging to check all lengths
    print(
      "Prefix Length: $prefixLength, Width Length: $widthLength, Suffix Length: $suffixLength",
    );

    // Check the total length of Prefix, Width, and Suffix
    final totalLength = prefixLength + widthLength + suffixLength;

    // Debugging to check total length
    print("Total Length: $totalLength");

    // Check if the total length exceeds 16
    if (totalLength > 16) {
      setState(() {
        _isInputValid = false;
        _errorText = "Only 16 digits allowed for Voucher Number!";
      });

      // Hide the error message after 2 seconds
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isInputValid = true;
          _errorText = ""; // Clear the error message
        });
      });
    } else {
      setState(() {
        _isInputValid = true;
        _errorText = "";
      });
    }
  }

  void fillFields() {
    if (widget.companydata != null) {
      b2bprefixcontroller.text = widget.companydata!.b2BPrefix;
      b2bwidthcontroller.text = widget.companydata!.b2BWidth.toString();
      b2bsuffixcontroller.text = widget.companydata!.b2BSuffix;
      b2bdeclarationcontroller.text = widget.companydata!.b2BDeclaration;
    }
  }

  void dataCollecting() {
    final b2bprefix = widget.companydata!.b2BPrefix = b2bprefixcontroller.text;

    final b2bwidth = widget.companydata!.b2BWidth =
        int.tryParse(b2bwidthcontroller.text) ?? 0;

    final b2bsuffix = widget.companydata!.b2BSuffix = b2bsuffixcontroller.text;

    final b2bDeclaration = widget.companydata!.b2BDeclaration =
        b2bdeclarationcontroller.text;

    print("B2B prefix....${b2bprefix}");
    print("B2B width....${b2bwidth}");
    print("B2B suffix....${b2bsuffix}");
    print("B2B declaration....${b2bDeclaration}");
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final provider = Provider.of<CompanyCreationProvider>(
      context,
      listen: false,
    );

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.0150),
            Text(
              "Voucher No.",
              style: context.textStyle.s12.w400.dustyBlue.roboto,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prefix",
                        style: context.textStyle.s12.w400.dustyBlue.roboto,
                      ),

                      //B2B prefix field
                      Container(
                        width: MediaQuery.of(context).size.width * 0.230,
                        height: MediaQuery.of(context).size.height * 0.041,
                        child: TextFormField(
                          controller: b2bprefixcontroller,
                          maxLines: 1,
                          textAlignVertical: TextAlignVertical(y: -1),
                          cursorHeight: 15,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _isPrefixValid && _isInputValid
                                    ? Theme.of(context).colorScheme.primaryFixed
                                    : Colors.red,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _isPrefixValid && _isInputValid
                                    ? Theme.of(context).colorScheme.primaryFixed
                                    : Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _isPrefixValid && _isInputValid
                                    ? Theme.of(context).colorScheme.primaryFixed
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Width",
                        style: context.textStyle.s12.w400.dustyBlue.roboto,
                      ),

                      //B2B width field
                      Container(
                        width: MediaQuery.of(context).size.width * 0.230,
                        height: MediaQuery.of(context).size.height * 0.041,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: b2bwidthcontroller,
                          textAlignVertical: TextAlignVertical(y: -1),
                          cursorHeight: 15,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _isInputValid
                                    ? Theme.of(context).colorScheme.primaryFixed
                                    : Colors.red,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _isInputValid
                                    ? Theme.of(context).colorScheme.primaryFixed
                                    : Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _isInputValid
                                    ? Theme.of(context).colorScheme.primaryFixed
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Suffix",
                        style: context.textStyle.s12.w400.dustyBlue.roboto,
                      ),

                      //B2B suffix field
                      Container(
                        width: MediaQuery.of(context).size.width * 0.230,
                        height: MediaQuery.of(context).size.height * 0.041,
                        child: TextFormField(
                          controller: b2bsuffixcontroller,
                          textAlignVertical: TextAlignVertical(y: -1),
                          cursorHeight: 15,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _isInputValid
                                    ? Theme.of(context).colorScheme.primaryFixed
                                    : Colors.red,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _isInputValid
                                    ? Theme.of(context).colorScheme.primaryFixed
                                    : Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _isInputValid
                                    ? Theme.of(context).colorScheme.primaryFixed
                                    : Colors.red,
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            !_isInputValid || !_isPrefixValid
                ? Center(
                    child: Text(
                      _errorText,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  )
                : SizedBox(),
            Text(
              "Declaration",
              style: context.textStyle.s12.w400.dustyBlue.roboto,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.004),

            //B2B declaration field
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.770,
                height: MediaQuery.of(context).size.height * 0.100,
                child: TextFormField(
                  controller: b2bdeclarationcontroller,
                  maxLines: 2,
                  cursorHeight: 20,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primaryFixed,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primaryFixed,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.006),

            //B2B elevated button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorResources.indigoBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.400,
                    MediaQuery.of(context).size.height * 0.060,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _validateInput();
                    if (_isInputValid && _isPrefixValid && _isSuffixValid) {
                      await provider.createCompanyVoucherTypes(
                        onSuccess: widget.onTap,
                        context,
                        request: CreateCompanyVocherParams(
                          id: widget.companydata!.id,
                          companyid: widget.companyId,
                          hasB2B: widget.isToggleOn,
                          b2Bprefix: b2bprefixcontroller.text,
                          b2Bsuffix: b2bsuffixcontroller.text,
                          b2Bwidth: int.tryParse(b2bwidthcontroller.text) ?? 0,
                          b2Bdeclaration: b2bdeclarationcontroller.text,
                          b2Cprefix: widget.companydata!.b2CPrefix,
                          b2Csuffix: widget.companydata!.b2CSuffix,
                          b2Cwidth: widget.companydata!.b2CWidth,
                          b2Cdeclaration: widget.companydata!.b2CDeclaration,
                          isenabled: widget.isCheckOn == 1 ? 1 : 0,
                        ),
                      );

                      await provider.fetchVoucherTypes(
                        context,
                        widget.companyId ?? 0,
                      );
                      context.pop();
                    }
                    dataCollecting();
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 14, color:ColorResources.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/data/company_voucher_data.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class B2cContainer extends StatefulWidget {
  final int companyId;
  final int isCheckOn;
  final int isToggleOn;
  final CompanyVoucherTypesListData? companydata;
  final void Function()? onTap;
  const B2cContainer({
    super.key,
    required this.companyId,
    required this.isCheckOn,
    required this.isToggleOn,
    required this.companydata,
    this.onTap,
  });

  @override
  State<B2cContainer> createState() => _B2cContainerState();
}

class _B2cContainerState extends State<B2cContainer> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController b2cprefixcontroller = TextEditingController();
  TextEditingController b2cwidthcontroller = TextEditingController();
  TextEditingController b2csuffixcontroller = TextEditingController();
  TextEditingController b2cdeclarationcontroller = TextEditingController();
  bool _isInputValid = true;
  bool _isPrefixValid = true;
  bool _isSuffixValid = true;
  String _errorText = "";
  // String _errorText2 = "";

  void _validateInput() {
    final prefixLength = b2cprefixcontroller.text.length;
    final suffixLength = b2csuffixcontroller.text.length;

    // Check if prefix is empty
    if (b2cprefixcontroller.text.isEmpty) {
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
    if (b2csuffixcontroller.text.isEmpty) {
      setState(() {
        _isSuffixValid = false;
        _errorText = "Suffix cannot be empty!";
      });

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isSuffixValid = true;
          _errorText = "";
        });
      });
      return;
    }
    setState(() {
      _isPrefixValid = true;
      _isSuffixValid = true;
      _errorText = "";
    });

    // Get the width value
    String widthValue = b2cwidthcontroller.text;

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

  @override
  void initState() {
    fillFields();
    super.initState();
  }

  void fillFields() {
    if (widget.companydata != null) {
      b2cprefixcontroller.text = widget.companydata!.b2CPrefix;
      b2cwidthcontroller.text = widget.companydata!.b2CWidth.toString();
      b2csuffixcontroller.text = widget.companydata!.b2CSuffix;
      b2cdeclarationcontroller.text = widget.companydata!.b2CDeclaration;
    }
  }

  void dataCollecting() {
    final b2cprefix = widget.companydata!.b2CPrefix = b2cprefixcontroller.text;

    final b2cwidth = widget.companydata!.b2CWidth =
        int.tryParse(b2cwidthcontroller.text) ?? 0;

    final b2csuffix = widget.companydata!.b2CSuffix = b2csuffixcontroller.text;

    final b2cDeclaration = widget.companydata!.b2CDeclaration =
        b2cdeclarationcontroller.text;

    print("B2C prefix....${b2cprefix}");
    print("B2C width....${b2cwidth}");
    print("B2C suffix....${b2csuffix}");
    print("B2C declaration....${b2cDeclaration}");
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

                      //B2C prefix field
                      Container(
                        width: MediaQuery.of(context).size.width * 0.230,
                        height: MediaQuery.of(context).size.height * 0.041,
                        child: TextFormField(
                          controller: b2cprefixcontroller,
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

                      //B2C width field
                      Container(
                        width: MediaQuery.of(context).size.width * 0.230,
                        height: MediaQuery.of(context).size.height * 0.041,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: b2cwidthcontroller,
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

                      //B2C suffix field
                      Container(
                        width: 90,
                        height: 35,
                        child: TextFormField(
                          controller: b2csuffixcontroller,
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

            //B2C declaration field
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.770,
                height: MediaQuery.of(context).size.height * 0.100,
                child: TextFormField(
                  controller: b2cdeclarationcontroller,
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

            //B2C elevated button
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
                      provider.createCompanyVoucherTypes(
                        onSuccess: widget.onTap,
                        context,
                        request: CreateCompanyVocherParams(
                          id: widget.companydata!.id,
                          companyid: 1302,
                          hasB2B: widget.isToggleOn,
                          b2Bprefix: b2cprefixcontroller.text,
                          b2Bsuffix: b2csuffixcontroller.text,
                          b2Bwidth: int.tryParse(b2cwidthcontroller.text) ?? 0,
                          b2Bdeclaration: b2cdeclarationcontroller.text,
                          b2Cprefix: widget.companydata!.b2CPrefix,
                          b2Csuffix: b2csuffixcontroller.text,
                          b2Cwidth: int.tryParse(b2cwidthcontroller.text) ?? 0,
                          b2Cdeclaration: b2cdeclarationcontroller.text,
                          isenabled: widget.isCheckOn == 1 ? 1 : 0,
                        ),
                      );
                      context.pop();
                    }
                    dataCollecting();
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

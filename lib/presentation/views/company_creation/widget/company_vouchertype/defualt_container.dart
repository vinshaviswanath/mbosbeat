import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/data/company_voucher_data.dart';
import 'package:mpos_beat/data/models/get_company_voucher_model.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/common_snackbar.dart';

class DefaultContainer extends StatefulWidget {
  final int companyId;
  final int isCheckOn;
  final int isToggleOn;
  final CompanyVoucherTypesListData? companydata;
  final void Function()? onTap;
  const DefaultContainer({
    super.key,
    required this.companyId,
    required this.isCheckOn,
    required this.isToggleOn,
    required this.companydata,
    this.onTap,
  });

  @override
  State<DefaultContainer> createState() => _DefaultContainerState();
}

class _DefaultContainerState extends State<DefaultContainer> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController defaultprefixcontroller = TextEditingController();
  TextEditingController defaultwidthcontroller = TextEditingController();
  TextEditingController defaultsuffixcontroller = TextEditingController();
  TextEditingController defaultdeclarationController = TextEditingController();
  bool _isInputValid = true;
  bool _isPrefixValid = true;
  bool _isSuffixValid = true;
  String _errorText = "";
  //String _errorText2 = "";

  @override
  void initState() {
    fillFields();
    super.initState();
  }

  void _validateInput() {
    final prefixLength = defaultprefixcontroller.text.length;
    final suffixLength = defaultsuffixcontroller.text.length;

    // Check if prefix is empty
    if (defaultprefixcontroller.text.isEmpty) {
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
    // if (defaultsuffixcontroller.text.isEmpty) {
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
    String widthValue = defaultwidthcontroller.text;

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
      defaultprefixcontroller.text = widget.companydata!.b2BPrefix;
      defaultwidthcontroller.text = widget.companydata!.b2BWidth.toString();
      defaultsuffixcontroller.text = widget.companydata!.b2BSuffix;
      defaultdeclarationController.text = widget.companydata!.b2BDeclaration;
    }
  }

  void dataCollecting() {
    final defaultPrefix = widget.companydata!.b2BPrefix =
        defaultprefixcontroller.text;

    int defaultWidth = widget.companydata!.b2BWidth =
        int.tryParse(defaultwidthcontroller.text) ?? 0;

    final defaultsuffix = widget.companydata!.b2BSuffix =
        defaultsuffixcontroller.text;

    final defaultDeclaration = widget.companydata!.b2BDeclaration =
        defaultdeclarationController.text;

    print("default prefix....${defaultPrefix}");
    print("default width....${defaultWidth}");
    print("default suffix....${defaultsuffix}");
    print("default declaration....${defaultDeclaration}");
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final provider = Provider.of<CompanyCreationProvider>(
      context,
      listen: false,
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onTertiaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.340,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).colorScheme.primaryFixed,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0150,
                    ),
                    Text(
                      'Voucher No.',
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
                                'Prefix',
                                style:
                                    context.textStyle.s12.w400.dustyBlue.roboto,
                              ),

                              //default prefix field
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.230,
                                height:
                                    MediaQuery.of(context).size.height * 0.041,
                                child: TextFormField(
                                  controller: defaultprefixcontroller,
                                  textAlignVertical: TextAlignVertical.center,
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
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryFixed
                                            : Colors.red,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide(
                                        color: _isPrefixValid && _isInputValid
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryFixed
                                            : Colors.red,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide(
                                        color: _isPrefixValid && _isInputValid
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryFixed
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Width',
                                style:
                                    context.textStyle.s12.w400.dustyBlue.roboto,
                              ),

                              //default width field
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.230,
                                height:
                                    MediaQuery.of(context).size.height * 0.041,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: defaultwidthcontroller,
                                  textAlignVertical: TextAlignVertical.center,
                                  cursorHeight: 15,
                                  maxLines: 1,
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
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryFixed
                                            : Colors.red,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide(
                                        color: _isInputValid
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryFixed
                                            : Colors.red,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide(
                                        color: _isInputValid
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryFixed
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Suffix',
                                style:
                                    context.textStyle.s12.w400.dustyBlue.roboto,
                              ),

                              //default suffix field
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.230,
                                height:
                                    MediaQuery.of(context).size.height * 0.041,
                                child: TextFormField(
                                  controller: defaultsuffixcontroller,
                                  textAlignVertical: TextAlignVertical(y: -1),
                                  cursorHeight: 15,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 15),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 8,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide(
                                        color: _isInputValid && _isSuffixValid
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryFixed
                                            : Colors.red,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide(
                                        color: _isInputValid && _isSuffixValid
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryFixed
                                            : Colors.red,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide(
                                        color: _isInputValid && _isSuffixValid
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryFixed
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

                    !_isInputValid || !_isPrefixValid || !_isSuffixValid
                        // !_isInputValid
                        ? Center(
                            child: Text(
                              _errorText,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          )
                        : SizedBox(),
                    Text(
                      'Declaration',
                      style: context.textStyle.s12.w400.dustyBlue.roboto,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.004,
                    ),

                    //default declaration field
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.770,
                        height: MediaQuery.of(context).size.height * 0.100,
                        child: TextFormField(
                          controller: defaultdeclarationController,
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
                                color: Theme.of(
                                  context,
                                ).colorScheme.primaryFixed,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primaryFixed,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                    //default elevated button
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
                            if (_isInputValid &&
                                _isPrefixValid &&
                                _isSuffixValid) {
                              await provider.createCompanyVoucherTypes(
                                onSuccess: widget.onTap,
                                context,
                                request: CreateCompanyVocherParams(
                                  id: widget.companydata!.id,
                                  companyid: widget.companyId,
                                  hasB2B: widget.isToggleOn,
                                  b2Bprefix: defaultprefixcontroller.text,
                                  b2Bsuffix: defaultsuffixcontroller.text,
                                  b2Bwidth:
                                      int.tryParse(
                                        defaultwidthcontroller.text,
                                      ) ??
                                      0,
                                  b2Bdeclaration:
                                      defaultdeclarationController.text,
                                  //
                                  b2Cprefix: "",
                                  b2Csuffix: "",
                                  b2Cwidth:
                                      // int.tryParse(
                                      //   defaultwidthcontroller.text,
                                      // ) ??
                                      0,
                                  b2Cdeclaration: "",
                                  isenabled: widget.isCheckOn,
                                ),
                              );

                              await provider.fetchVoucherTypes(
                                context,
                                widget.companyId,
                                // companyId ?? 0
                              );

                              context.pop();

                              //   provider.fetchVoucherTypes(context, 1302);
                            }
                          }
                          dataCollecting();
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorResources.white,
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
    );
  }
}

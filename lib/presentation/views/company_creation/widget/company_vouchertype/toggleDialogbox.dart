import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class ToggleDialogBox extends StatefulWidget {
  final int companyId;
  final int isCheckOn;
  final int isToggleOn;
  final void Function()? onTap;
  final int id;
  const ToggleDialogBox({super.key, 
    required this.companyId,
    required this.isCheckOn,
    required this.isToggleOn,
    required this.id,
    this.onTap,
  });

  @override
  State<ToggleDialogBox> createState() => _ToggleDialogBoxState();
}

class _ToggleDialogBoxState extends State<ToggleDialogBox> {
  @override
  void initState() {
    print("company companyId togglebox....${widget.companyId}");
    print("company checkOn togglebox....${widget.isCheckOn}");
    print("company toggleOn togglebox....${widget.isToggleOn}");
    print("company id togglebox....${widget.id}");
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   fetchCompanyVoucherList();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CompanyCreationProvider>(
      context,
      listen: false,
    );

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width * 0.70,
        child: Column(
          children: [
            Text(
              "Confirmation",
              style: context.textStyle.s14.roboto.bold.indigoBlue,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.010),
            Text(
              "Are you sure you want to close this toggle?",
              style: context.textStyle.s12.roboto.dustyBlue,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.030),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    provider.clearB2C();
                    
                    context.pop(true);
                    
                    CreateCompanyvochertypeDtos? response = await provider
                        .createCompanyVoucherTypes(
                          onSuccess: widget.onTap,
                          context,
                          request: CreateCompanyVocherParams(
                            id: widget.id,
                            companyid: widget.companyId,
                            hasB2B: 0,
                            b2Bprefix: provider.b2bPrefix.text,
                            b2Bsuffix: provider.b2bSuffix.text,
                            b2Bwidth: int.tryParse(provider.b2bWidth.text) ?? 0,
                            b2Bdeclaration: provider.b2bDeclaration.text,
                            b2Cprefix: "",
                            b2Csuffix: "",
                            b2Cwidth: 0,
                            b2Cdeclaration: "",
                            isenabled: 1,
                          ),
                        );
                    if (response != null && response.status == 1) {
                      provider.fetchVoucherTypes(context, widget.companyId);
                    }
                  },
                  child: Text(
                    "Yes",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorResources.indigoBlue,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.30,
                      MediaQuery.of(context).size.height * 0.060,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    context.pop(false);
                  },
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorResources.indigoBlue,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.30,
                      MediaQuery.of(context).size.height * 0.060,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
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

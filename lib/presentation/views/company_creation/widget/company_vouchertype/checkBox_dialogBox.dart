import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';


class CheckBoxDialogBox extends StatefulWidget {
  final int? companyId;
  final int isCheckOn;
  final int id;
  final void Function()? onTap;
  const CheckBoxDialogBox({super.key, 
     this.companyId,
    required this.isCheckOn,

    required this.id,
    this.onTap,
  });

  @override
  State<CheckBoxDialogBox> createState() => _CheckBoxDialogBoxState();
}

class _CheckBoxDialogBoxState extends State<CheckBoxDialogBox> {
  late int isCheckOn;
  late int isToggleOn;

  @override
  void initState() {
    print("company companyId untickbox....${widget.companyId}");
    print("company checkOn untickbox....${widget.isCheckOn}");
    // print("company toggleOn untickbox....${widget.isToggleOn}");
    print("id untickbox....${widget.id}");
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   fetchCompanyVoucherList();
    // });
    super.initState();
  }

  void fetchCompanyVoucherList() {
    final provider = context.read<CompanyCreationProvider>();
    provider.fetchVoucherTypes(
      context,
      widget.companyId ?? 0
    );
  }

  @override
  Widget build(BuildContext context) {
    // final local = AppLocalizations.of(context);
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
              "Are you sure you want to untick this checkbox?",
              style: context.textStyle.s11.roboto.dustyBlue,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.030),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    CreateCompanyvochertypeDtos? response = await provider
                        .createCompanyVoucherTypes(
                          onSuccess: widget.onTap,
                          context,
                          request: CreateCompanyVocherParams(
                            id: widget.id,
                            companyid: widget.companyId,
                            hasB2B: 0,
                            b2Bprefix: "",
                            b2Bsuffix: "",
                            b2Bwidth: 0,
                            b2Bdeclaration: "",
                            b2Cprefix: "",
                            b2Csuffix: "",
                            b2Cwidth: 0,
                            b2Cdeclaration: "",
                            isenabled: 0,
                          ),
                        );
                    if (response != null && response.status == 1) {
               
                     provider.fetchVoucherTypes(context,widget.companyId ?? 0);
                      
                     context.pop(true);
                    }
                  },
                  child: Text(
                    "Yes",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color:ColorResources.white,
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
                    "Cancel",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color:ColorResources.white,
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

import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/common_snackbar.dart';

class ToggleDialogBox extends StatefulWidget {
  final int companyId;
  final int isCheckOn;
  final int isToggleOn;

  final int id;
  ToggleDialogBox({
    required this.companyId,
    required this.isCheckOn,
    required this.isToggleOn,
    required this.id,
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchCompanyVoucherList();
    });
    super.initState();
  }

  void fetchCompanyVoucherList() {
    final provider = context.read<CompanyCreationProvider>();
    provider.fetchVoucherTypes(context, 1302);
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width * 0.70,
        child: Column(
          children: [
            Text(
              "Confirmation",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Color(0xFF36489B),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.010),
            Text(
              "Are you sure you want to close this toggle?",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Color(0xff7787AD),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.030),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    context.pop(true);
                    // final createcompanyvoucherProvider =
                    //     Provider.of<CreateCompanyProvider>(context,
                    //         listen: false);

                    // CreateCompanyvochertypeDtos? response =
                    //     await createcompanyvoucherProvider.createcompanyvoucher(
                    //         CreateCompanyVocherRequest(
                    //             companyid: widget.companyId,
                    //             hasB2B: 0,
                    //             id: widget.id,
                    //             B2Bprefix: "",
                    //             B2Bsuffix: "",
                    //             B2Bwidth: 0,
                    //             B2Bdeclaration: "",
                    //             B2Cprefix: "",
                    //             B2Csuffix: "",
                    //             B2Cwidth: 0,
                    //             B2Cdeclaration: "",
                    //             isenabled: 0));

                    // if (response != null && response.status == 1) {
                    //   CommonSnackBar.show(context,
                    //       message:
                    //           createcompanyvoucherProvider.serverMessage ?? "");
                    //   fetchCompanyVoucherList();
                    // } else {
                    //   CommonSnackBar.show(context,
                    //       message:
                    //           createcompanyvoucherProvider.serverMessage ?? "");
                    // }
                  },
                  child: Text(
                    "Yes",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
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
                    backgroundColor: Theme.of(context).colorScheme.secondary,
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

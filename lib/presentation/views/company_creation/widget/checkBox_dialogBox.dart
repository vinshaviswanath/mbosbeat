
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class CheckBoxDialogBox extends StatefulWidget {
  final int companyId;
  final int isCheckOn;
  // final int isToggleOn;
  final int id;
  CheckBoxDialogBox(
      {required this.companyId,
      required this.isCheckOn,
      // required this.isToggleOn,
      required this.id});

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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.010),
            Text(
              "Are you sure you want to untick this checkbox?",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.030),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    
                  },
                  child: Text(
                    "Yes",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.black,
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
                "hello",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.black,
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

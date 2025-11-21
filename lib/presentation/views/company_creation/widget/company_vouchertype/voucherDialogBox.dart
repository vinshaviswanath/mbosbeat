import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/data/company_voucher_data.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/b2b_container.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/b2c_container.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/defualt_container.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/toggleDialogbox.dart';

class VoucherDialogbox extends StatefulWidget {
  final int id;
  final int isCheckOn;
  final int isToggleOn;
  final String regtype;
  final CompanyVoucherTypesListData? companydata;

  const VoucherDialogbox({
    super.key,
    required this.id,
    required this.companydata,
    required this.isCheckOn,
    required this.isToggleOn,
    required this.regtype,
  });

  @override
  State<VoucherDialogbox> createState() => _VoucherDialogboxState();
}

class _VoucherDialogboxState extends State<VoucherDialogbox> {
  late bool isToggleOn;
  late PageController pageController;
  late Map<int, int> pageIndices = {};

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    isToggleOn = widget.isToggleOn == 1;
    pageIndices = {widget.id: 0};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
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
                              backgroundColor: Color.fromARGB(
                                255,
                                202,
                                211,
                                224,
                              ),
                              radius: 10,
                              child: Icon(
                                Icons.close,
                                color: Color.fromARGB(255, 100, 114, 145),
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //user b2b or b2c
                // if (widget.companydata!.hasB2BB2C == "Yes" &&
                //         widget.regtype == "Regular" ||
                //     widget.regtype == "Registered")
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
                        activeColor: Theme.of(context).colorScheme.onPrimary,
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

                //default voucher fields container
                if (!isToggleOn)
                  Padding(
                    padding: EdgeInsets.zero, // No padding
                    child: DefaultContainer(
                      companyId: widget.companydata!.companyId,
                      isCheckOn: widget.isCheckOn,
                      isToggleOn: isToggleOn ? 1 : 0,
                      companydata: widget.companydata,
                    ),
                  ),

                if (isToggleOn)
                  //The below portion is b2b2c container that shows only when checkbox is on and hasb2bb2c toggle is on only
                  //it shows instead of sales container
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff98A6BE),
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
                                  //     _selectedPageIndex = 0;
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
                            Transform.rotate(
                              angle: 1.6,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.003,
                                width:
                                    MediaQuery.of(context).size.width * 0.099,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimary  .withValues(alpha: 0.2),
                              ),
                            ),

                            //tab selection B2C
                            TextButton(
                              onPressed: () {
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
                                padding: EdgeInsets.zero, // No padding
                                child: B2bContainer(
                                  companyId: widget.companydata!.companyId,
                                  isCheckOn: widget.isCheckOn,
                                  isToggleOn: isToggleOn ? 1 : 0,
                                  companydata: widget.companydata,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.zero, // No padding,
                                child: B2cContainer(
                                  companyId: widget.companydata!.companyId,
                                  isCheckOn: widget.isCheckOn,
                                  isToggleOn: isToggleOn ? 1 : 0,
                                  companydata: widget.companydata,
                                ),
                              ),
                            ],
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

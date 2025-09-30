import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_textField.dart';

class StockJournalScreen extends StatefulWidget {
  const StockJournalScreen({super.key});

  @override
  State<StockJournalScreen> createState() => _StockJournalScreenState();
}

class _StockJournalScreenState extends State<StockJournalScreen> {
  int? selectUnits;
  int? selectQuantitys;
  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final heading = (args?["heading"] ?? "").replaceAll("\n", " ");
    final color = Theme.of(context).colorScheme;
    final local = AppLocalizations.of(context);
    final texttheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorResources.dustyBlue,
            size: 15,
          ),
        ),
        backgroundColor: ColorResources.cloudGray,

        title: Text(
          heading.replaceAll("\n", " "),
          style: context.textStyle.s22.dustyBlue.bold.roboto,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Row(
                children: [
                  Text(
                    "# : M1ST-002/22/23",
                    style: context.textStyle.s14.roboto.bold.indigoBlue,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 23, right: 10),
              child: Row(
                children: [
                  Text(
                    "TO GODOWN / VAN",
                    style: context.textStyle.s12.roboto.dustyBlue,
                  ),
                  Spacer(),

                  Column(
                    children: [
                      Text(
                        "01-08-2024",
                        style: context.textStyle.s09.roboto.dustyBlue,
                      ),
                      SizedBox(height: 3),
                      if (heading == "Stock Unload")
                        Container(
                          decoration: BoxDecoration(
                            color: ColorResources.rosePink,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 25,
                          width: width * 0.220,
                          child: Center(
                            child: Text(
                              "+ Unload All",
                              style: context.textStyle.roboto.white.s11,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Ensures vertical alignment
                children: [
                  Expanded(
                    // Takes available space
                    child: CustomTextField(hint: "Enter"),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed("additem");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorResources.rosePink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 25,
                      width: width * 0.220,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Text(
                          local!.other_transactions_stockTransfer_additem,
                          style: context.textStyle.roboto.white.s11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Divider(
              color: ColorResources.cloudGray,
              height: 3,
              thickness: 1.4,
              indent: 20,
              endIndent: 18,
            ),
            SizedBox(height: height * 0.0150),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 72),
              child: Row(
                children: [
                  Text(
                    local.other_transactions_stockTransfer_productname,
                    style: context.textStyle.s12.dustyBlue.roboto,
                  ),
                  Spacer(),
                  Text(
                    local.other_transactions_stockTransfer_Quantity,
                    style: context.textStyle.s12.dustyBlue.roboto,
                  ),
                  SizedBox(width: width * 0.05),
                  Text(
                    local.other_transactions_stockTransfer_Unit,
                    style: context.textStyle.s12.dustyBlue.roboto,
                  ),
                ],
              ),
            ),
            Divider(
              color: ColorResources.cloudGray,
              height: 3,
              thickness: 1.4,
              indent: 20,
              endIndent: 18,
            ),
            Container(
              height: height * 0.550,
              width: width * 0.920,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorResources.lightGray,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Bisleri Mountan 1 ltr",
                                        style: context
                                            .textStyle
                                            .roboto
                                            .w600
                                            .dustyBlue
                                            .s14,
                                      ),
                                      Spacer(),

                                      //Quantity select
                                      Container(
                                        child: TextField(
                                          cursorHeight: 11,
                                          style: texttheme.labelSmall!.copyWith(
                                            fontSize: 15,
                                            color: color.onSecondary,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder
                                                .none, // Removes the underline
                                            contentPadding: EdgeInsets.all(10),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorResources.dustyBlue,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        height: height * 0.0250,
                                        width: width * 0.150,
                                      ),
                                      SizedBox(width: width * 0.0230),

                                      //Unit select button
                                      Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                              ),
                                            ),
                                            Spacer(),
                                            DropdownButton<int>(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              dropdownColor: color.onPrimary,
                                              value: selectUnits,
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                size: 20,
                                              ),
                                              items: List.generate(
                                                2,
                                                (index) => DropdownMenuItem(
                                                  value: index + 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          right: 5,
                                                        ),
                                                    child: Text(
                                                      (index + 1).toString(),
                                                      style: context
                                                          .textStyle
                                                          .shade100
                                                          .roboto
                                                          .dustyBlue,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectUnits = value;
                                                });
                                              },
                                              underline:
                                                  SizedBox(), // Removes the underline if needed
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorResources.dustyBlue,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        height: height * 0.0250,
                                        width: width * 0.150,
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Icon(
                                        Icons.delete,
                                        color: ColorResources.dustyBlue,
                                        size: 19,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: ColorResources.cloudGray,
                            height: 3,
                            thickness: 1.4,
                            indent: 20,
                            endIndent: 18,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              local.other_transactions_stockTransfer_ItemCount,
              style: context.textStyle.s12.roboto.dustyBlue,
            ),
            SizedBox(height: height * 0.01),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorResources.indigoBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(width * 0.5, height * 0.0500),
              ),
              onPressed: () {},
              child: Text(
                local.other_transactions_stockTransfer_saveButton,
                style: context.textStyle.s14.roboto.white.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

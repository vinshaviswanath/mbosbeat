import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class StockReceiveScreen extends StatefulWidget {
  const StockReceiveScreen({super.key});

  @override
  State<StockReceiveScreen> createState() => _StockReceiveScreenState();
}

class _StockReceiveScreenState extends State<StockReceiveScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final local = AppLocalizations.of(context);
    final texttheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorResources.dustyBlue,
            size: 15,
          ),
        ),
        backgroundColor: ColorResources.cloudGray,
        title: Text(
          "Stock Receive",
          style: context.textStyle.s20.dustyBlue.bold.roboto,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Text(
                  "Alackal Stores, Kuruppamthara",
                  style: context.textStyle.s12.roboto.bold.indigoBlue,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.rosePink,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 25,
                    width: width * 0.220,
                    child: Center(
                      child: Text(
                        local!.other_transactions_stockTransfer_additem,
                        style: texttheme.labelSmall!.copyWith(
                          color: color.onPrimary,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Row(
              children: [
                Text(
                  local.other_transactions_stockReceive_SlNo,
                  style: context.textStyle.s08.roboto.dustyBlue,
                ),
                const Spacer(),
                Text(
                  "29-07-2024",
                  style: context.textStyle.s08.roboto.dustyBlue,
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.002),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Row(
              children: [
                Text(
                  local.other_transactions_stockReceive_vocherNo,
                  style: context.textStyle.s08.roboto.dustyBlue,
                ),
                const Spacer(),
                Text(
                  local.other_transactions_stockReceive_Balance_text,
                  style: context.textStyle.s09.roboto.dustyBlue,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Row(
              children: [
                Text(
                  local.other_transactions_stockReceive_pricelist_text,
                  style: context.textStyle.s08.roboto.dustyBlue,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: const CustomTextField(
                    hint: "pricelist",
                    backgroundColor: ColorResources.lightGray,
                    borderRadius: 12,
                    borderColor: ColorResources.transparent,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "56,874.00 Cr",
                  style: context.textStyle.s12.roboto.bold.indigoBlue,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: ColorResources.cloudGray,
            height: 3,
            thickness: 1.4,
            indent: 20,
            endIndent: 18,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  local.other_transactions_stockReceive_SlNo,
                  style: context.textStyle.s10.roboto.dustyBlue,
                ),
                SizedBox(width: width * 0.0250),
                Text(
                  local.other_transactions_stockReceive_vocherNo,
                  style: context.textStyle.s09.roboto.dustyBlue,
                ),
                SizedBox(width: width * 0.110),
                Text(
                  local.other_transactions_stockReceive_date,
                  style: context.textStyle.s09.roboto.dustyBlue,
                ),
                SizedBox(width: width * 0.150),
                Text(
                  local.other_transactions_stockTransfer_ItemCount,
                  style: context.textStyle.s09.roboto.dustyBlue,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.550,
            width: width * 0.920,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "${index + 1}",
                                    style:
                                        context.textStyle.s10.roboto.dustyBlue,
                                  ),
                                  SizedBox(width: width * 0.0750),
                                  Text(
                                    "HJIL2468725924",
                                    style:
                                        context.textStyle.s10.roboto.dustyBlue,
                                  ),
                                  SizedBox(width: width * 0.0400),
                                  Text(
                                    "22-Mar-2024",
                                    style:
                                        context.textStyle.s10.roboto.dustyBlue,
                                  ),
                                  SizedBox(width: width * 0.0800),
                                  Text(
                                    "100",
                                    style:
                                        context.textStyle.s10.roboto.dustyBlue,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      showDialogBox();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: ColorResources.bluishGray,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      height: height * 0.0280,
                                      width: width * 0.120,
                                      child: Center(
                                        child: Text(
                                          local
                                              .other_transactions_stockReceive_view,
                                          style: context
                                              .textStyle
                                              .s09
                                              .roboto
                                              .white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: height * 0.0620,
                  width: width * 0.430,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorResources.indigoBlue,
                  ),
                  child: Center(
                    child: Text(
                      local.other_transactions_stockReceive_update_button,
                      style: context.textStyle.roboto.s10.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.06),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: height * 0.0620,
                  width: width * 0.430,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorResources.indigoBlue,
                  ),
                  child: Center(
                    child: Text(
                      local.other_transactions_stockReceive_reject_button,
                      style: context.textStyle.roboto.s10.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showDialogBox() {
    // final color = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          content: SizedBox(
            width: width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Sl No.",
                        style: context.textStyle.s12.roboto.dustyBlue,
                      ),
                      SizedBox(width: width * 0.060),
                      Text(
                        "Item Name",
                        style: context.textStyle.s12.roboto.dustyBlue,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          "Quantity",
                          style: context.textStyle.s12.roboto.dustyBlue,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: ColorResources.cloudGray,
                    height: 3,
                    thickness: 1.4,
                  ),
                  Container(
                    height: height * 0.400,
                    width: width * 0.920,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6),
                          child: GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            "${index + 1}",
                                            style: context
                                                .textStyle
                                                .s12
                                                .roboto
                                                .dustyBlue,
                                          ),
                                          SizedBox(width: width * 0.150),
                                          Text(
                                            "item name${index + 1}",
                                            style: context
                                                .textStyle
                                                .s12
                                                .roboto
                                                .dustyBlue,
                                          ),
                                          const Spacer(),
                                          Text(
                                            "10 Packet",
                                            style: context
                                                .textStyle
                                                .s12
                                                .roboto
                                                .dustyBlue,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: ColorResources.cloudGray,
                                  height: 3,
                                  thickness: 1.4,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorResources.indigoBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(width * 0.400, height * 0.055),
                ),
                child: Text("Close", style: context.textStyle.s12.roboto.white),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

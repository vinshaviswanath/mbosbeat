import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/diamentions.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class ExpenseEntryScreen extends StatefulWidget {
  const ExpenseEntryScreen({super.key});

  @override
  State<ExpenseEntryScreen> createState() => _ExpenseEntryScreenState();
}

class _ExpenseEntryScreenState extends State<ExpenseEntryScreen> {
  bool fuelexp = false;

  @override
  Widget build(BuildContext context) {
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
          local!.expense_title,
          style: context.textStyle.s22.dustyBlue.bold.roboto,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Text(
                    "Alackal Stores, Kuruppamthara",
                    style: context.textStyle.s14.roboto.bold.indigoBlue,
                  ),
                  Spacer(),
                  Text(
                    "29-07-2024",
                    style: context.textStyle.s09.roboto.dustyBlue,
                  ),
                ],
              ),
              SizedBox(height: height * 0.002),
              Row(
                children: [
                  Text(
                    "GST No. JDGSJ2468246572",
                    style: context.textStyle.s09.roboto.dustyBlue,
                  ),
                  Spacer(),
                  Text(
                    local.expense_oustanding,
                    style: context.textStyle.s09.roboto.dustyBlue,
                  ),
                ],
              ),
              SizedBox(height: height * 0.002),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "-8657.00",
                  style: context.textStyle.s14.roboto.bold.indigoBlue,
                ),
              ),
              Divider(
                color: ColorResources.cloudGray,
                height: 3,
                thickness: 1.4,
                indent: 20,
                endIndent: 18,
              ),
              SizedBox(height: height * 0.01),
              Text(
                "Expense Name :",
                style: context.textStyle.s14.roboto.dustyBlue,
              ),
              SizedBox(
                width: width * 0.98,
                child: CustomTextField(
                  hint: 'FOOD EXPENSES',
                  backgroundColor: ColorResources.lightGray,
                  borderRadius: 12,
                  borderColor: ColorResources.transparent,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Use For FUEL Expense",
                    style: context.textStyle.s14.roboto.dustyBlue,
                  ),
                  Spacer(),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: fuelexp,
                      onChanged: (value) {
                        setState(() => fuelexp = value);
                      },
                      activeColor: ColorResources.indigoBlue,
                      inactiveThumbColor: ColorResources.bluishGray,
                      inactiveTrackColor: Colors.white,
                      activeTrackColor: Colors.white,
                      trackOutlineColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                            if (states.contains(MaterialState.selected)) {
                              return ColorResources.indigoBlue;
                            }
                            return ColorResources.bluishGray;
                          }),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          local.expense_meter_reading,
                          style: context.textStyle.s14.bluishGray.roboto,
                        ),
                        CustomTextField(
                          hint: local.expense_meter_reading,
                          backgroundColor: ColorResources.lightGray,
                          borderRadius: 12,
                          borderColor: ColorResources.transparent,
                        ),
                      ],
                    ),
                  ),
                  w20,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          local.expense_fuel_quantity,
                          style: context.textStyle.s14.bluishGray.roboto,
                        ),
                        CustomTextField(
                          hint: local.expense_fuel_quantity,
                          backgroundColor: ColorResources.lightGray,
                          borderRadius: 12,
                          borderColor: ColorResources.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.010),
              Text(
                local.expense_place,
                style: context.textStyle.s14.bluishGray.roboto,
              ),
              CustomTextField(
                hint: local.expense_place,
                backgroundColor: ColorResources.lightGray,
                borderRadius: 12,
                borderColor: ColorResources.transparent,
              ),
              SizedBox(height: height * 0.010),
              Text(
                local.expense_amount,
                style: context.textStyle.s14.bluishGray.roboto,
              ),
              CustomTextField(
                hint: local.expense_amount,
                backgroundColor: ColorResources.lightGray,
                borderRadius: 12,
                borderColor: ColorResources.transparent,
              ),
              SizedBox(height: height * 0.1),
              Text(
                local.expense_remarks,
                style: context.textStyle.s14.bluishGray.roboto,
              ),
              Container(
                child: TextField(
                  cursorHeight: 13,
                  style: texttheme.labelSmall!.copyWith(
                    fontSize: 15,
                    color: color.onSecondary,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorResources.lightBorderGray),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: height * 0.060,
                width: width * 0.910,
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Center(
                        child: Text(
                          local.expense_saveButton,
                          style: context.textStyle.roboto.s12.white,
                        ),
                      ),
                      height: height * 0.0620,
                      width: width * 0.430,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorResources.indigoBlue,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.06),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Center(
                        child: Text(
                          local.expense_cancelButton,
                          style: context.textStyle.roboto.s12.white,
                        ),
                      ),
                      height: height * 0.0620,
                      width: width * 0.430,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorResources.indigoBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

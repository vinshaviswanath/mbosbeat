import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_switch.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/godown_route_voucher_screen/widgets/custom_dropdown_widget.dart';
import 'package:mpos_beat/presentation/views/route_wise_screen/widgets/add_route.dart';

class GodownRouteVoucherScreen extends StatefulWidget {
  const GodownRouteVoucherScreen({super.key});

  @override
  State<GodownRouteVoucherScreen> createState() =>
      _GodownRouteVoucherScreenState();
}

class _GodownRouteVoucherScreenState extends State<GodownRouteVoucherScreen> {
  bool isGodownWise = true;
  final TextEditingController routeController = TextEditingController();

  final TextEditingController prefixController = TextEditingController();
  final TextEditingController suffixController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController startController = TextEditingController();

  DateTime? selectedDate;
  String? selectedType;

  final List<String> voucherTitles = [
    'Sales Order B2B',
    'Sales Order B2C',
    'Sales B2B',
    'Sales B2C',
    'Sales Return',
    'Cash Receipt',
    'Bank Receipt',
    'Payment',
    'Expense Payment',
    'Stock Transfer',
    'Stock Request',
    'Stock Replacement',
    'Damage Transfer',
  ];

  bool isb2BandB2cActive = false;

  String? selecteRoute;

  int expandedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorResources.transparent,
            surfaceTintColor: ColorResources.transparent,
            title: Text(
              appLocalizations.company_creation,
              style: context.textStyle.s22.bold.indigoBlue.roboto,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h10,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: ColorResources.indigoBlue.withValues(
                            alpha: 0.05,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              appLocalizations.popover_body_godown_wise,
                              style:
                                  context.textStyle.s12.bold.indigoBlue.roboto,
                            ),
                            SelectionSwitch(
                              value: false,
                              onChanged: (value) {},
                            ),
                            Text(
                              appLocalizations.popover_body_route_wise,
                              style:
                                  context.textStyle.s12.bold.indigoBlue.roboto,
                            ),
                          ],
                        ),
                      ),
                      h20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appLocalizations.godown_route_voucher_route_name,
                            style: context.textStyle.s12.w400.bluishGray.roboto,
                          ),
                          GestureDetector(
                            onTap: () {
                              CustomDialog.showBottomCustomDialog(
                                chid: const AddRoute(isEdit: true),
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: ColorResources.indigoBlue
                                  .withValues(alpha: 0.2),
                              radius: 12,
                              child: SvgPicture.asset(
                                AppAssets.edit,
                                height: 8,
                                colorFilter: const ColorFilter.mode(
                                  ColorResources.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      h8,
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropdown(
                              hintText: appLocalizations
                                  .godown_route_voucher_enter_route_name,
                              items: provider.routes
                                  .map((e) => e.routeName)
                                  .toList(),
                              onChanged: (value) {},
                            ),
                          ),
                          w5,
                          GestureDetector(
                            onTap: () {
                              CustomDialog.showBottomCustomDialog(
                                chid: const AddRoute(),
                                // Container(
                                //   constraints: const BoxConstraints(maxWidth: 400),
                                //   child: CustomScrollView(
                                //     shrinkWrap: true,
                                //     slivers: [
                                //       SliverToBoxAdapter(
                                //         child: Column(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             // Title Row
                                //             Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.end,
                                //               children: [
                                //                 GestureDetector(
                                //                   onTap: () {
                                //                     Navigator.pop(context);
                                //                   },
                                //                   child: CircleAvatar(
                                //                     radius: 12,
                                //                     child: Icon(
                                //                       Icons.close,
                                //                       color:
                                //                           ColorResources.bluishGray,
                                //                       size: 16,
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //             Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.center,
                                //               children: [
                                //                 Text(
                                //                   appLocalizations
                                //                       .godown_route_voucher_serires,
                                //                   style: context
                                //                       .textStyle
                                //                       .s14
                                //                       .w500
                                //                       .dustyBlue
                                //                       .roboto,
                                //                 ),
                                //               ],
                                //             ),
                                //             const SizedBox(height: 12),

                                //             Text(
                                //               "Sales Order B2B:",
                                //               style: context
                                //                   .textStyle
                                //                   .s12
                                //                   .w400
                                //                   .bluishGray
                                //                   .roboto,
                                //             ),
                                //             const SizedBox(height: 12),

                                //             Text(
                                //               "Applicable From",
                                //               style: context
                                //                   .textStyle
                                //                   .s09
                                //                   .w300
                                //                   .bluishGray
                                //                   .roboto,
                                //             ),
                                //             const SizedBox(height: 4),

                                //             // Date Picker
                                //             InkWell(
                                //               onTap: () async {
                                //                 final picked = await showDatePicker(
                                //                   context: context,
                                //                   firstDate: DateTime(2000),
                                //                   lastDate: DateTime(2100),
                                //                   initialDate: DateTime.now(),
                                //                 );
                                //                 if (picked != null) {
                                //                   setState(
                                //                     () => selectedDate = picked,
                                //                   );
                                //                 }
                                //               },
                                //               child: Container(
                                //                 padding: const EdgeInsets.symmetric(
                                //                   vertical: 12,
                                //                   horizontal: 12,
                                //                 ),
                                //                 decoration: BoxDecoration(
                                //                   color: ColorResources.lightGray
                                //                       .withValues(alpha: 0.65),

                                //                   borderRadius:
                                //                       BorderRadius.circular(15),
                                //                 ),
                                //                 child: Row(
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment
                                //                           .spaceBetween,
                                //                   children: [
                                //                     Text(
                                //                       selectedDate == null
                                //                           ? "Select Date"
                                //                           : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                //                       style: context
                                //                           .textStyle
                                //                           .s11
                                //                           .w400
                                //                           .bluishGray
                                //                           .roboto,
                                //                     ),
                                //                     const Icon(
                                //                       Icons.calendar_today_outlined,
                                //                       size: 18,
                                //                       color:
                                //                           ColorResources.bluishGray,
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ),
                                //             const SizedBox(height: 12),

                                //             Text(
                                //               "Voucher Type",
                                //               style: context
                                //                   .textStyle
                                //                   .s12
                                //                   .w400
                                //                   .bluishGray
                                //                   .roboto,
                                //             ),
                                //             const SizedBox(height: 4),

                                //             // Dropdown
                                //             Container(
                                //               decoration: BoxDecoration(
                                //                 color: ColorResources.lightGray
                                //                     .withValues(alpha: 0.65),

                                //                 borderRadius: BorderRadius.circular(
                                //                   12,
                                //                 ),
                                //               ),
                                //               padding: const EdgeInsets.symmetric(
                                //                 horizontal: 12,
                                //               ),
                                //               child: DropdownButtonHideUnderline(
                                //                 child: DropdownButton<String>(
                                //                   value: selectedType,
                                //                   hint: Text(
                                //                     "Voucher Type",
                                //                     style: context
                                //                         .textStyle
                                //                         .s11
                                //                         .w400
                                //                         .bluishGray
                                //                         .roboto,
                                //                   ),
                                //                   isExpanded: true,
                                //                   icon: const Icon(
                                //                     Icons
                                //                         .keyboard_arrow_down_rounded,
                                //                   ),
                                //                   items: const [
                                //                     // DropdownMenuItem(
                                //                     //   value: "Type A",
                                //                     //   child: Text("Type A"),
                                //                     // ),
                                //                     // DropdownMenuItem(
                                //                     //   value: "Type B",
                                //                     //   child: Text("Type B"),
                                //                     // ),
                                //                   ],
                                //                   onChanged: (value) {
                                //                     setState(
                                //                       () => selectedType = value,
                                //                     );
                                //                   },
                                //                 ),
                                //               ),
                                //             ),
                                //             const SizedBox(height: 12),

                                //             Text(
                                //               "Prefix",
                                //               style: context
                                //                   .textStyle
                                //                   .s12
                                //                   .w400
                                //                   .bluishGray
                                //                   .roboto,
                                //             ),
                                //             const SizedBox(height: 4),
                                //             TextField(
                                //               controller: prefixController,
                                //               decoration: InputDecoration(
                                //                 filled: true,
                                //                 fillColor: ColorResources.lightGray
                                //                     .withValues(alpha: 0.65),
                                //                 contentPadding:
                                //                     const EdgeInsets.symmetric(
                                //                       vertical: 12,
                                //                       horizontal: 12,
                                //                     ),
                                //                 border: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //                 enabledBorder: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //                 focusedBorder: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //               ),
                                //             ),
                                //             const SizedBox(height: 12),

                                //             Text(
                                //               "Suffix",
                                //               style: context
                                //                   .textStyle
                                //                   .s12
                                //                   .w400
                                //                   .bluishGray
                                //                   .roboto,
                                //             ),
                                //             const SizedBox(height: 4),
                                //             TextField(
                                //               controller: suffixController,
                                //               decoration: InputDecoration(
                                //                 filled: true,
                                //                 fillColor: ColorResources.lightGray
                                //                     .withValues(alpha: 0.65),
                                //                 contentPadding:
                                //                     const EdgeInsets.symmetric(
                                //                       vertical: 12,
                                //                       horizontal: 12,
                                //                     ),
                                //                 border: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //                 enabledBorder: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //                 focusedBorder: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //               ),
                                //             ),
                                //             const SizedBox(height: 12),

                                //             Text(
                                //               "Width",
                                //               style: context
                                //                   .textStyle
                                //                   .s12
                                //                   .w400
                                //                   .bluishGray
                                //                   .roboto,
                                //             ),
                                //             const SizedBox(height: 4),
                                //             TextField(
                                //               controller: widthController,
                                //               keyboardType: TextInputType.number,
                                //               decoration: InputDecoration(
                                //                 filled: true,
                                //                 fillColor: ColorResources.lightGray
                                //                     .withValues(alpha: 0.65),
                                //                 contentPadding:
                                //                     const EdgeInsets.symmetric(
                                //                       vertical: 12,
                                //                       horizontal: 12,
                                //                     ),
                                //                 border: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //                 enabledBorder: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //                 focusedBorder: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //               ),
                                //             ),
                                //             const SizedBox(height: 12),

                                //             Text(
                                //               "Starts From",
                                //               style: context
                                //                   .textStyle
                                //                   .s12
                                //                   .w400
                                //                   .bluishGray
                                //                   .roboto,
                                //             ),
                                //             const SizedBox(height: 4),
                                //             TextField(
                                //               controller: startController,
                                //               keyboardType: TextInputType.number,
                                //               decoration: InputDecoration(
                                //                 filled: true,
                                //                 fillColor: ColorResources.lightGray
                                //                     .withValues(alpha: 0.65),
                                //                 contentPadding:
                                //                     const EdgeInsets.symmetric(
                                //                       vertical: 12,
                                //                       horizontal: 12,
                                //                     ),
                                //                 border: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //                 enabledBorder: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //                 focusedBorder: OutlineInputBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(12),
                                //                   borderSide: BorderSide.none,
                                //                 ),
                                //               ),
                                //             ),
                                //             const SizedBox(height: 24),

                                //             Center(
                                //               child: Padding(
                                //                 padding: EdgeInsets.symmetric(
                                //                   horizontal:
                                //                       context.getSize.width / 3.5,
                                //                 ),
                                //                 child: CustomButton(
                                //                   buttonText: "Save",
                                //                   borderRadius:
                                //                       BorderRadius.circular(16),
                                //                   textStyle: context
                                //                       .textStyle
                                //                       .s12
                                //                       .w500
                                //                       .white,
                                //                   isborderEnable: false,
                                //                   onTap: () {
                                //                     Navigator.pop(context);
                                //                   },
                                //                 ),
                                //               ),
                                //             ),
                                //             const SizedBox(height: 12),
                                //           ],
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: ColorResources.lightGray.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: ColorResources.indigoBlue,
                                radius: 12,
                                child: Icon(
                                  Icons.add,
                                  color: ColorResources.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      h12,
                      Text(
                        "Voucher Series Settings:",
                        style: context.textStyle.s14.w500.bluishGray.roboto
                            .copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  context.textStyle.dustyBlue.color,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final isExpanded = expandedIndex == index;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 2,
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomDropdownWidget(
                        isExpand: isExpanded,
                        title: GestureDetector(
                          onTap: () {
                            setState(() {
                              expandedIndex = isExpanded ? -1 : index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                voucherTitles[index],
                                style: context
                                    .textStyle
                                    .s12
                                    .w400
                                    .bluishGray
                                    .roboto,
                              ),
                              Icon(
                                isExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: ColorResources.indigoBlue,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            if (index != 1) ...[
                              h16,
                              const SingleCompanyPrefixSuffix(),
                            ],
                            if (isb2BandB2cActive = true && index == 1) ...[
                              h6,
                              const B2bAndB2cPrefixSuffix(),
                            ],
                            h16,
                            const CustomDivider(),
                          ],
                        ),
                      ),
                    ),
                  );
                }, childCount: voucherTitles.length),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CustomButton(
                        buttonText: "Save",
                        textStyle: context.textStyle.s16.bold.white.roboto,
                        isborderEnable: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class B2bAndB2cPrefixSuffix extends StatelessWidget {
  const B2bAndB2cPrefixSuffix({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("B2B", style: context.textStyle.s10.w400.indigoBlue.roboto),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorResources.bluishGray.withValues(alpha: 0.3),
                ),
                child: const Icon(
                  Icons.edit,
                  size: 10,
                  color: ColorResources.indigoBlue,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Prefix: ",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                  Text(
                    "xxxxx",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Suffix: ",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                  Text(
                    "xxxxx",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Width: ",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                  Text(
                    "xxxxx",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                ],
              ),
            ],
          ),
        ),
        h12,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("B2C", style: context.textStyle.s10.w400.indigoBlue.roboto),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Prefix: ",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                  Text(
                    "xxxxx",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Suffix: ",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                  Text(
                    "xxxxx",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Width: ",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                  Text(
                    "xxxxx",
                    style: context.textStyle.s12.w400.bluishGray.roboto,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SingleCompanyPrefixSuffix extends StatelessWidget {
  const SingleCompanyPrefixSuffix({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Prefix: ",
              style: context.textStyle.s12.w400.bluishGray.roboto,
            ),
            Text("xxxxx", style: context.textStyle.s12.w400.bluishGray.roboto),
          ],
        ),
        Row(
          children: [
            Text(
              "Suffix: ",
              style: context.textStyle.s12.w400.bluishGray.roboto,
            ),
            Text("xxxxx", style: context.textStyle.s12.w400.bluishGray.roboto),
          ],
        ),
        Row(
          children: [
            Text(
              "Width: ",
              style: context.textStyle.s12.w400.bluishGray.roboto,
            ),
            Text("xxxxx", style: context.textStyle.s12.w400.bluishGray.roboto),
            w16,
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorResources.bluishGray.withValues(alpha: 0.3),
                ),
                child: const Icon(
                  Icons.edit,
                  size: 10,
                  color: ColorResources.indigoBlue,
                ),
              ),
            ),
            w8,
          ],
        ),
      ],
    );
  }
}

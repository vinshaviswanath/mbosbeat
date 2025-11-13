import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/constants.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/company_card_widget.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/companydropdown.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/custom_drawer.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/option_item.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int? selectedIndex;
  int? optionIndex;
  List<CompanyViewList> companyList = [];
  CompanyViewList? selectedCompany;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<CompanyCreationProvider>(
        context,
        listen: false,
      ).getAllCompanies(context);

      final provider = Provider.of<CompanyCreationProvider>(
        context,
        listen: false,
      );

      companyList = provider.companiesList?.companyViewList ?? [];
      if (companyList.isNotEmpty) {
        selectedCompany = companyList.first;
        Logger.logSuccess(
          "Company Id in admin  :: ${selectedCompany?.id ?? 0}",
        );

        provider.setSelectedCompany(company: selectedCompany!);
        Logger.logSuccess(
          "Company Id in admin dashboard :: ${provider.selectedCompany?.id ?? 0}",
        );
      }
      // final prefs = sl<SharedPreferences>();
      // final companyId = prefs.getInt('selected_company_id');
      // if (companyList.isNotEmpty && companyId == null) {
      //   await prefs.setInt('selected_company_id', selectedCompany?.id ?? 0);
      // }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    //final pref = sl<SharedPreferences>();
    // final companyId = pref.getInt('selected_company_id');

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final shouldExit = await AuthDialogs.show(context);
        if (shouldExit) {
          AuthDialogs.exitApp();
        }
      },
      child: Consumer<CompanyCreationProvider>(
        builder: (context, provider, _) {
          return CustomDrawer(
            child: Stack(
              children: [
                Positioned(
                  bottom: -context.getSize.height * 0.13,
                  left: -context.getSize.width * 0.36,
                  child: Image.asset(AppAssets.bgVector, height: 300),
                ),
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorResources.indigoBlue,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 6),
                              blurRadius: 10,
                              color: ColorResources.black.withValues(
                                alpha: 0.05,
                              ),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: -context.getSize.height * 0.05,
                              right: -context.getSize.width * 0.23,
                              child: Image.asset(
                                AppAssets.bgVector,
                                height: 300,
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 16,
                                    left: 16,
                                    right: 16,
                                  ),
                                  child: Column(
                                    children: [
                                      AppBar(
                                        backgroundColor:
                                            ColorResources.transparent,
                                        surfaceTintColor:
                                            ColorResources.transparent,
                                        title: Text(
                                          appLocalization.admin_dashboard_home,
                                          style: context
                                              .textStyle
                                              .s20
                                              .bold
                                              .white
                                              .roboto,
                                        ),
                                        centerTitle: true,
                                        automaticallyImplyLeading: false,
                                      ),
                                      h6,

                                      // DropdownButtonHideUnderline(
                                      //   child: Container(
                                      //     width: double.infinity,
                                      //     padding: EdgeInsets.zero,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.circular(
                                      //         8,
                                      //       ),
                                      //       color: ColorResources.white
                                      //           .withValues(alpha: 0.1),
                                      //     ),
                                      //     child: DropdownButtonFormField<CompanyViewList>(
                                      //       decoration: const InputDecoration(
                                      //         border: OutlineInputBorder(
                                      //           borderSide: BorderSide.none,
                                      //         ),
                                      //       ),
                                      //       initialValue: selectedCompany,
                                      //       isExpanded: true,
                                      //       dropdownColor: Colors.white,
                                      //       style: context
                                      //           .textStyle
                                      //           .s14
                                      //           .w400
                                      //           .white
                                      //           .roboto,
                                      //       icon: const SizedBox.shrink(),
                                      //       selectedItemBuilder: (context) =>
                                      //           companyList.map((e) {
                                      //             return Row(
                                      //               mainAxisAlignment:
                                      //                   MainAxisAlignment
                                      //                       .center,
                                      //               children: [
                                      //                 Text(e.companyName ?? ''),
                                      //                 Spacer(),
                                      //                 const Icon(
                                      //                   Icons
                                      //                       .keyboard_arrow_down,
                                      //                   size: 20,
                                      //                   color: ColorResources
                                      //                       .white,
                                      //                 ),
                                      //               ],
                                      //             );
                                      //           }).toList(),

                                      //       items: companyList.map((e) {
                                      //         return DropdownMenuItem(
                                      //           value: e,
                                      //           alignment: Alignment.center,
                                      //           child: Text(
                                      //             e.companyName ?? '',
                                      //             style: context
                                      //                 .textStyle
                                      //                 .s14
                                      //                 .w400
                                      //                 .black
                                      //                 .roboto,
                                      //           ),
                                      //         );
                                      //       }).toList(),

                                      //       onChanged: (value) async {
                                      //         setState(
                                      //           () => selectedCompany = value,
                                      //         );
                                      //         provider.setSelectedCompany(
                                      //           company: value!,
                                      //         );

                                      //         Logger.logSuccess(
                                      //           "SELECTED COMPANY ID: ${selectedCompany!.id}",
                                      //         );
                                      //         Logger.logInfo(
                                      //           "Company Selected: ${selectedCompany?.companyName}",
                                      //         );
                                      //       },
                                      //     ),
                                      //   ),
                                      // ),
                                      DropdownButtonHideUnderline(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            color: ColorResources.white
                                                .withValues(alpha: 0.1),
                                          ),
                                          child: CompanyDropdown(
                                            companyList: companyList,
                                            selectedCompany: selectedCompany,
                                            onCompanySelected: (company) {
                                              setState(
                                                () => selectedCompany = company,
                                              );
                                              provider.setSelectedCompany(
                                                company: company,
                                              );

                                              Logger.logSuccess(
                                                "SELECTED COMPANY ID: ${company.id}",
                                              );
                                              Logger.logInfo(
                                                "Company Selected: ${company.companyName}",
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      h10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: context.getSize.width / 1.44,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  appLocalization
                                                      .admin_dashboard_address,
                                                  style: context
                                                      .textStyle
                                                      .s09
                                                      .w400
                                                      .white
                                                      .roboto,
                                                ),
                                                Text(
                                                  "${selectedCompany?.address1},${selectedCompany?.address2},${selectedCompany?.address3},${selectedCompany?.state},${selectedCompany?.country}",
                                                  style: context
                                                      .textStyle
                                                      .s10
                                                      .w400
                                                      .white
                                                      .roboto,
                                                ),
                                              ],
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      provider.isGodown
                                                          ? context.pushNamed(
                                                              AppRouterConst
                                                                  .godownWiseScreen,
                                                            )
                                                          : context.pushNamed(
                                                              AppRouterConst
                                                                  .routeWiseScreen,
                                                            );
                                                      // showPopover(
                                                      //   context: context,
                                                      //   bodyBuilder: (context) =>
                                                      //       const PopoverBody(),
                                                      //   direction:
                                                      //       PopoverDirection
                                                      //           .bottom,
                                                      //   arrowDyOffset: 10,
                                                      //   arrowDxOffset: -60,
                                                      //   radius: 16,
                                                      //   shadow: [
                                                      //     BoxShadow(
                                                      //       offset:
                                                      //           const Offset(
                                                      //             0,
                                                      //             3,
                                                      //           ),
                                                      //       blurRadius: 6,
                                                      //       color:
                                                      //           ColorResources
                                                      //               .black
                                                      //               .withValues(
                                                      //                 alpha:
                                                      //                     0.2,
                                                      //               ),
                                                      //     ),
                                                      //   ],
                                                      //   width:
                                                      //       context
                                                      //           .getSize
                                                      //           .width /
                                                      //       3.2,
                                                      //   // height: 120,
                                                      //   arrowHeight: 0,
                                                      //   arrowWidth: 30,
                                                      //   backgroundColor:
                                                      //       Colors.white,
                                                      //   barrierColor:
                                                      //       Colors.transparent,
                                                      // );
                                                    },
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          ColorResources
                                                              .rosePink,
                                                      radius: 15,
                                                      child: SvgPicture.asset(
                                                        AppAssets.locationPin,
                                                        height: 16,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              w8,
                                              GestureDetector(
                                                onTap: () {
                                                  CustomDialog.showBottomCustomDialog(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          vertical: 16,
                                                        ),
                                                    chid: StatefulBuilder(
                                                      builder: (context, setStateDialog) {
                                                        return Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  12,
                                                                ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          16,
                                                                    ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    w10,
                                                                    Column(
                                                                      children: [
                                                                        Text(
                                                                          "${selectedCompany?.companyName}",
                                                                          style: context
                                                                              .textStyle
                                                                              .s12
                                                                              .bold
                                                                              .indigoBlue
                                                                              .roboto,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap: () {
                                                                            Navigator.pop(
                                                                              context,
                                                                            );
                                                                          },
                                                                          child: CircleAvatar(
                                                                            backgroundColor: ColorResources.bluishGray.withValues(
                                                                              alpha: 0.15,
                                                                            ),
                                                                            radius:
                                                                                12,
                                                                            child: const Icon(
                                                                              Icons.close,
                                                                              size: 12,
                                                                              color: ColorResources.bluishGray,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              h4,
                                                              Text(
                                                                "${selectedCompany?.address1},${selectedCompany?.address2},${selectedCompany?.address3},${selectedCompany?.state},${selectedCompany?.country}",
                                                                style: context
                                                                    .textStyle
                                                                    .s10
                                                                    .w400
                                                                    .dustyBlue
                                                                    .roboto,
                                                              ),
                                                              h12,

                                                              //Edit Compny Info......
                                                              OptionItem(
                                                                index: 0,

                                                                selectedIndex:
                                                                    optionIndex,
                                                                title:
                                                                    "Edit Company",
                                                                icon: Icons
                                                                    .mode_edit,
                                                                onTap: (i) {
                                                                  Navigator.pop(
                                                                    context,
                                                                  );

                                                                  // Get the saved companyId
                                                                  // final pref =
                                                                  //     sl<
                                                                  //       SharedPreferences
                                                                  //     >();
                                                                  // final companyId =
                                                                  //     pref.getInt(
                                                                  //       'selected_company_id',
                                                                  //     );

                                                                  // // Find the company by ID
                                                                  // selectedCompany = companyList.firstWhere(
                                                                  //   (company) =>
                                                                  //       company
                                                                  //           .id ==
                                                                  //       companyId,
                                                                  //   orElse: () =>
                                                                  //       companyList
                                                                  //           .first,
                                                                  // );

                                                                  Logger.logSuccess(
                                                                    "SELECTED COMPANY ID: ${selectedCompany!.id}",
                                                                  );
                                                                  Logger.logInfo(
                                                                    "Company Selected: ${selectedCompany?.companyName}",
                                                                  );

                                                                  context.pushNamed(
                                                                    AppRouterConst
                                                                        .companyCreationScreen,
                                                                    extra: {
                                                                      'tabIndex':
                                                                          0,
                                                                      'companyData':
                                                                          selectedCompany,
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                              const CustomDivider(),

                                                              //Integration Settings...
                                                              OptionItem(
                                                                index: 1,
                                                                selectedIndex:
                                                                    optionIndex,
                                                                title:
                                                                    "Integration Settings",
                                                                icon: Icons
                                                                    .settings_suggest_outlined,
                                                                onTap: (i) {
                                                                  // final pref =
                                                                  //     sl<
                                                                  //       SharedPreferences
                                                                  //     >();
                                                                  // final companyId =
                                                                  //     pref.getInt(
                                                                  //       'selected_company_id',
                                                                  //     );

                                                                  // // Find the company by ID
                                                                  // selectedCompany = companyList.firstWhere(
                                                                  //   (company) =>
                                                                  //       company
                                                                  //           .id ==
                                                                  //       companyId,
                                                                  //   orElse: () =>
                                                                  //       companyList
                                                                  //           .first,
                                                                  // );

                                                                  Logger.logSuccess(
                                                                    "SELECTED COMPANY ID: ${selectedCompany!.id}",
                                                                  );
                                                                  Logger.logInfo(
                                                                    "Company Selected: ${selectedCompany?.companyName}",
                                                                  );

                                                                  Navigator.pop(
                                                                    context,
                                                                  );

                                                                  context.pushNamed(
                                                                    AppRouterConst
                                                                        .companyCreationScreen,
                                                                    extra: {
                                                                      'tabIndex':
                                                                          2,
                                                                      'companyData':
                                                                          selectedCompany,
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                              const CustomDivider(),

                                                              //Company Settings...
                                                              OptionItem(
                                                                index: 2,
                                                                selectedIndex:
                                                                    optionIndex,
                                                                title:
                                                                    "Company Settings",
                                                                icon: Icons
                                                                    .settings_outlined,
                                                                onTap: (i) {
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                  // // Find the company by ID
                                                                  // selectedCompany = companyList.firstWhere(
                                                                  //   (company) =>
                                                                  //       company
                                                                  //           .id ==
                                                                  //       companyId,
                                                                  //   orElse: () =>
                                                                  //       companyList
                                                                  //           .first,
                                                                  // );

                                                                  Logger.logSuccess(
                                                                    "SELECTED COMPANY ID: ${selectedCompany!.id}",
                                                                  );
                                                                  Logger.logInfo(
                                                                    "Company Selected: ${selectedCompany?.companyName}",
                                                                  );

                                                                  context.pushNamed(
                                                                    AppRouterConst
                                                                        .companySettingsScreen,
                                                                    extra: {
                                                                      "companyId":
                                                                          selectedCompany
                                                                              ?.id,
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                              const CustomDivider(),

                                                              //Voucher Type...
                                                              OptionItem(
                                                                index: 3,
                                                                selectedIndex:
                                                                    optionIndex,
                                                                title:
                                                                    "Voucher Type",
                                                                icon: Icons
                                                                    .description_outlined,
                                                                onTap: (i) {
                                                                  // Get the saved companyId
                                                                  // final pref =
                                                                  //     sl<
                                                                  //       SharedPreferences
                                                                  //     >();
                                                                  // final companyId =
                                                                  //     pref.getInt(
                                                                  //       'selected_company_id',
                                                                  //     );

                                                                  // // Find the company by ID
                                                                  // selectedCompany = companyList.firstWhere(
                                                                  //   (company) =>
                                                                  //       company
                                                                  //           .id ==
                                                                  //       companyId,
                                                                  //   orElse: () =>
                                                                  //       companyList
                                                                  //           .first,
                                                                  // );

                                                                  Logger.logSuccess(
                                                                    "SELECTED COMPANY ID: ${selectedCompany!.id}",
                                                                  );
                                                                  Logger.logInfo(
                                                                    "Company Selected: ${selectedCompany?.companyName}",
                                                                  );

                                                                  Navigator.pop(
                                                                    context,
                                                                  );

                                                                  context.pushNamed(
                                                                    AppRouterConst
                                                                        .companyCreationScreen,
                                                                    extra: {
                                                                      'tabIndex':
                                                                          1,
                                                                      'companyData':
                                                                          selectedCompany,
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                              const CustomDivider(),

                                                              //Godown/Route....
                                                              OptionItem(
                                                                index: 4,
                                                                selectedIndex:
                                                                    optionIndex,
                                                                title:
                                                                    "Godown / Route Wise Voucher",
                                                                icon: Icons
                                                                    .apartment,
                                                                onTap: (i) {
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                  context.pushNamed(
                                                                    AppRouterConst
                                                                        .godownRouteVoucherScreen,
                                                                  );
                                                                },
                                                              ),
                                                              const CustomDivider(),

                                                              //Add Users
                                                              OptionItem(
                                                                index: 5,
                                                                selectedIndex:
                                                                    optionIndex,
                                                                title:
                                                                    "Add Users",
                                                                icon: Icons
                                                                    .person_outline,
                                                                onTap: (i) {
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                  context.pushNamed(
                                                                    AppRouterConst
                                                                        .companyUserMappingScreen,
                                                                    extra: {
                                                                      "companyId":
                                                                          selectedCompany!
                                                                              .id,
                                                                      "name": selectedCompany
                                                                          ?.companyName,
                                                                      "companyName":
                                                                          "${selectedCompany?.state},${selectedCompany?.country}",
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      ColorResources.rosePink,
                                                  radius: 15,
                                                  child: SvgPicture.asset(
                                                    AppAssets.settings,
                                                    height: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorResources.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        appLocalization.admin_dashboard_summary,
                                        style: context
                                            .textStyle
                                            .s14
                                            .w500
                                            .royalBlue
                                            .roboto,
                                      ),
                                      h5,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          gradient: const LinearGradient(
                                            colors: [
                                              ColorResources.softViolet,
                                              ColorResources.deepViolet,
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            EndToEndTextWidget(
                                              text1: "Total Sales",
                                              textStyle1: context
                                                  .textStyle
                                                  .s16
                                                  .w400
                                                  .white
                                                  .roboto,
                                              text2: "September",
                                              textStyle2: context
                                                  .textStyle
                                                  .s10
                                                  .w400
                                                  .white
                                                  .roboto,
                                            ),
                                            h5,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "39,84,62,378.00",
                                                  style: context
                                                      .textStyle
                                                      .s22
                                                      .bold
                                                      .white
                                                      .roboto,
                                                ),
                                                CircleAvatar(
                                                  backgroundColor:
                                                      ColorResources.amber,
                                                  radius: 12,
                                                  child: SvgPicture.asset(
                                                    AppAssets.arrowToRight,
                                                    height: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              color: ColorResources.white,
                                            ),
                                            EndToEndTextWidget(
                                              text1: appLocalization
                                                  .admin_dashboard_cash_sales,
                                              textStyle1: context
                                                  .textStyle
                                                  .s10
                                                  .w400
                                                  .white
                                                  .roboto,
                                              text2: appLocalization
                                                  .admin_dashboard_credit_sales,
                                              textStyle2: context
                                                  .textStyle
                                                  .s10
                                                  .w400
                                                  .white
                                                  .roboto,
                                            ),
                                            EndToEndTextWidget(
                                              text1: "39,84,62,378.00",
                                              textStyle1: context
                                                  .textStyle
                                                  .s14
                                                  .bold
                                                  .white
                                                  .roboto,
                                              text2: "39,84,62,378.00",
                                              textStyle2: context
                                                  .textStyle
                                                  .s14
                                                  .bold
                                                  .white
                                                  .roboto,
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
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          h40,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorResources.black.withValues(
                                  alpha: 0.05,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    appLocalization
                                        .admin_dashboard_total_sites_visits,
                                    style: context
                                        .textStyle
                                        .s14
                                        .w500
                                        .dustyBlue
                                        .roboto,
                                  ),
                                  w12,
                                  Text(
                                    "135",
                                    style: context
                                        .textStyle
                                        .s14
                                        .w500
                                        .indigoBlue
                                        .roboto,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

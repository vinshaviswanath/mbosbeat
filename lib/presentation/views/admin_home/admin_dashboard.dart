import 'package:flutter/foundation.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/companydropdown_dialogBox.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/custom_drawer.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/option_item.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';

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

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
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

                                      Row(
                                        children: [
                                          Expanded(
                                            child: DropdownButtonHideUnderline(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: ColorResources.white
                                                      .withValues(alpha: 0.1),
                                                ),

 child: CompanyDropdown(
                                                  companyList: companyList,
                                                  selectedCompany:
                                                      selectedCompany,
                                                  onCompanySelected: (company) {
 child: DropdownButtonFormField<CompanyViewList>(
                                                  decoration:
                                                      const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                      ),
                                                  initialValue: selectedCompany,
                                                  isExpanded: true,
                                                  dropdownColor: Colors.white,
                                                  style: context
                                                      .textStyle
                                                      .s14
                                                      .w400
                                                      .white
                                                      .roboto,
                                                  icon: const SizedBox.shrink(),
                                                  selectedItemBuilder: (context) {
                                                    return companyList.map((e) {
                                                      return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            e.companyName ?? '',
                                                          ),
                                                          w12,
                                                          const Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            size: 20,
                                                            color:
                                                                ColorResources
                                                                    .white,
                                                          ),
                                                        ],
                                                      );
                                                    }).toList();
                                                  },
                                                  items: companyList.map((e) {
                                                    return DropdownMenuItem(
                                                      value: e,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        e.companyName ?? '',
                                                        style: context
                                                            .textStyle
                                                            .s14
                                                            .w400
                                                            .black
                                                            .roboto,
                                                      ),
                                                    );
                                                  }).toList(),

                                                  onChanged: (value) async {
                                                    provider.resetIntegration();
setState(
                                                      () => selectedCompany =
                                                          company,
                                                    );
                                                    provider.setSelectedCompany(
                                                      company: company,
                                                    );

                                                    Logger.logSuccess(
                                                      "SELECTED COMPANY ID: ${company.id} COMPANY NAME: ${company.companyName}  ",
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          w4,
                                          GestureDetector(
                                            onTap: () {
                                              context.pushNamed(
                                                AppRouterConst
                                                    .companyCreationScreen,
                                                extra: {
                                                  'tabIndex': 0,
'companyData': null,
                                                  'isPop': false,
   },
                                              );

                                              //
                                              provider.resetIntegration();
                                            },
                                            child: Container(
                                              height:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.045,

                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.1,
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorResources.blueAccent,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: ColorResources.white,
                                                  size:
                                                      context.getSize.height *
                                                      0.02,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                                                            color:
                                                                ColorResources
                                                                    .white,
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
                                                                icon: AppAssets
                                                                    .editIcon,
                                                                onTap: (i) {
                                                                  Navigator.pop(
                                                                    context,
                                                                  );

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
                                                                      'isPop':
                                                                          false,
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
                                                                icon: AppAssets
                                                                    .settings2,
                                                                onTap: (i) {
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
                                                                      'isPop':
                                                                          false,
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
                                                                icon: AppAssets
                                                                    .settingsIcon,
                                                                onTap: (i) {
                                                                  Navigator.pop(
                                                                    context,
                                                                  );

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
                                                                icon: AppAssets
                                                                    .voucherIcon,
                                                                onTap: (i) {
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
                                                                      'isPop':
                                                                          false,
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
                                                                icon: AppAssets
                                                                    .building,
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
                                                                icon: AppAssets
                                                                    .person2,
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
                                      if (selectedCompany?.integrationType ==
                                          'Stand Alone') ...[
                                        GestureDetector(
                                          onTap: () {
                                            context.pushNamed(
                                              AppRouterConst
                                                  .masterDetailsScreen,
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: ColorResources.paleYellow,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Master",
                                                      style: context
                                                          .textStyle
                                                          .s14
                                                          .w500
                                                          .royalBlue
                                                          .roboto,
                                                    ),
                                                    w4,
                                                    Text(
                                                      "${selectedCompany?.integrationType}",
                                                      style: context
                                                          .textStyle
                                                          .s10
                                                          .w400
                                                          .neutralGray
                                                          .roboto,
                                                    ),
                                                  ],
                                                ),

                                                NavButton(
                                                  color: ColorResources.amber,
                                                  onTap: () {},
                                                  svgArrowPath:
                                                      AppAssets.arrowToRight,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        h16,
                                      ],
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
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 6),
                                              color: ColorResources.black
                                                  .withValues(alpha: 0.25),
                                              blurRadius: 5,
                                            ),
                                          ],
                                          gradient: LinearGradient(
                                            colors: [
                                              ColorResources.deepIndigo
                                                  .withValues(alpha: 0.8),
                                              ColorResources.deepIndigo
                                                  .withValues(alpha: 0.9),
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
                                                NavButton(
                                                  color: ColorResources.amber,
                                                  onTap: () {},
                                                  svgArrowPath:
                                                      AppAssets.arrowToRight,
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: ColorResources.white
                                                  .withValues(alpha: 0.18),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      appLocalization
                                                          .admin_dashboard_cash_sales,
                                                      style: context
                                                          .textStyle
                                                          .s10
                                                          .w400
                                                          .white
                                                          .roboto,
                                                    ),
                                                    h5,
                                                    Text(
                                                      "39,84,62,378.00",
                                                      style: context
                                                          .textStyle
                                                          .s14
                                                          .bold
                                                          .white
                                                          .roboto,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                      40, // Adjust height as needed
                                                  child: VerticalDivider(
                                                    color: ColorResources.white
                                                        .withValues(
                                                          alpha: 0.18,
                                                        ),
                                                    thickness: 1,
                                                    width:
                                                        20, // Space around divider
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      appLocalization
                                                          .admin_dashboard_credit_sales,
                                                      style: context
                                                          .textStyle
                                                          .s10
                                                          .w400
                                                          .white
                                                          .roboto,
                                                    ),
                                                    h5,
                                                    Text(
                                                      "39,84,62,378.00",
                                                      style: context
                                                          .textStyle
                                                          .s14
                                                          .bold
                                                          .white
                                                          .roboto,
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                                color: ColorResources.indigoBlue.withValues(
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
                                  Row(
                                    children: [
                                      Text(
                                        "135",
                                        style: context
                                            .textStyle
                                            .s16
                                            .w500
                                            .indigoBlue
                                            .roboto,
                                      ),
                                      w14,
                                      NavButton(
                                        color: ColorResources.dustyBlue,
                                        onTap: () {},
                                        svgArrowPath: AppAssets.arrowToRight,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          h16,
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
                                color: ColorResources.peachPink.withValues(
                                  alpha: 0.15,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Expense Entry",
                                        style: context
                                            .textStyle
                                            .s14
                                            .w500
                                            .dustyBlue
                                            .roboto,
                                      ),
                                      h10,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8,
                                            ),
                                            child: SvgPicture.asset(
                                              AppAssets.rupee,
                                              height:
                                                  context.getSize.height *
                                                  0.018,
                                            ),
                                          ),
                                          Text(
                                            "17,78,54,731.00",
                                            style: context
                                                .textStyle
                                                .s22
                                                .bold
                                                .dustyBlue
                                                .roboto,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  w12,
                                  NavButton(
                                    color: ColorResources.peachPink,
                                    onTap: () {},
                                    svgArrowPath: AppAssets.arrowToRight,
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

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.color,
    required this.svgArrowPath,
    this.height,
    this.onTap,
  });

  final Color color;
  final String svgArrowPath;
  final void Function()? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 12,
        child: SvgPicture.asset(svgArrowPath, height: height ?? 10),
      ),
    );
  }
}

import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/data/country_list_data.dart';
import 'package:mpos_beat/data/models/data/registration_type_data.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/companydropdown_dialogBox.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/custom_drawer.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/shimmer/dropdown_shimmer.dart';
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

  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     final provider = Provider.of<CompanyCreationProvider>(
  //       context,
  //       listen: false,
  //     );

  //     // Load list
  //     await provider.getAllCompanies(context);
  //     // final db = sl<AppDb>();
  //     // final list = await db.companyDao.getAllCompanies();

  //     // Set selected company if not set
  //     if (list.isNotEmpty) {
  //       if (provider.selectedCompany == null) {
  //         provider.setSelectedCompany(company: list.first);
  //       } else {
  //         final matched = list.firstWhere(
  //           (c) => c.id == provider.selectedCompany!.id,
  //           orElse: () => list.first,
  //         );
  //         provider.setSelectedCompany(company: matched);
  //       }
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<CompanyCreationProvider>(
        context,
        listen: false,
      );
      // Load list
      await provider.getAllCompanies(context);

      final list = provider.companiesList?.companyViewList ?? [];

      // Set selected company if not set
      if (list.isNotEmpty) {
        if (provider.selectedCompany == null) {
          provider.setSelectedCompany(company: list.first);
        } else {
          final matched = list.firstWhere(
            (c) => c.id == provider.selectedCompany!.id,
            orElse: () => list.first,
          );
          provider.setSelectedCompany(company: matched);
        }
      }

      final company = provider.selectedCompany ?? list.first;

      await provider.fectchCountryList(context);

      if (provider.countries.isEmpty) {
        debugPrint("❌ No countries loaded");
        return;
      }

      //Select country
      final selectedCountry = provider.countries.firstWhere(
        (c) => c.id.toString() == company.country.toString(),
        orElse: () => CountryListData(
          id: 0,
          countryName: "Unknown",
          stateTitle: '',
          pinTitle: '',
          currency: '',
          altCurrency: 0,
          currencyNod: 0,
          currencySymbol: 0,
          taxApplicable: 0,
          taxType: 0,
          taxRegNoTitle: '',
          cessApplicable: 0,
          exciseApplicable: 0,
        ),
      );

      if (selectedCountry.id == 0) {
        debugPrint("❌ Country not found for ID: ${company.country}");
        return;
      }

      provider.selectCountry(context, selectedCountry);

      //get regtype
      await provider.getRegistrationType(context, selectedCountry.id);

      final selectedRegType = provider.registrationlists.firstWhere(
        (r) => r.id.toString() == company.regType.toString(),
        orElse: () =>
            RegistrationTypeData(id: 0, countryId: 0, registrationType: ''),
      );

      if (selectedRegType.id != 0) {
        provider.selectRegistrationType(selectedRegType);
        debugPrint("RegType found: ${selectedRegType.registrationType}");
      }

      Logger.logSuccess(
        "Initial RegType : ${provider.selectedregistrationtype?.registrationType}",
      );
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

                                        //<<<<<<<<<<<<<<<<<<<<<<<<<<< DO NOT CLEAR THIS >>>>>>>>>>>>>>>>>>>>>>>>>>
                                        // title: StreamBuilder(
                                        //   stream: appDb.userDao
                                        //       .watchLoggedInUser(),
                                        //   builder: (context, snapshot) {
                                        //     if (!snapshot.hasData) {
                                        //       return const Text("");
                                        //     }

                                        //     final user = snapshot.data;

                                        //     return Text(
                                        //       user?.companyName ?? "Company",
                                        //       style: context
                                        //           .textStyle
                                        //           .s20
                                        //           .bold
                                        //           .white
                                        //           .roboto,
                                        //     );
                                        //   },
                                        // ),
                                        //<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>
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
                                                child: Consumer<CompanyCreationProvider>(
                                                  builder: (context, provider, _) {
                                                    return StreamBuilder<
                                                      List<CompanyViewList>
                                                    >(
                                                      stream: provider
                                                          .companyStream,
                                                      builder: (context, snapshot) {
                                                        if (!snapshot.hasData) {
                                                          return ShimmerBox(
                                                            height:
                                                                MediaQuery.of(
                                                                  context,
                                                                ).size.height *
                                                                0.045,
                                                            width:
                                                                double.infinity,
                                                          );
                                                        }

                                                        final companyList =
                                                            snapshot.data!;
                                                        final selectedCompany =
                                                            provider
                                                                .selectedCompany;

                                                        return CompanyDropdown(
                                                          companyList:
                                                              companyList,
                                                          selectedCompany:
                                                              selectedCompany,
                                                          onCompanySelected: (company) async {
                                                            provider
                                                                .setSelectedCompany(
                                                                  company:
                                                                      company,
                                                                );

                                                            // Update country
                                                            final selectedCountry = provider.countries.firstWhere(
                                                              (c) =>
                                                                  c.id
                                                                      .toString() ==
                                                                  company
                                                                      .country
                                                                      .toString(),
                                                              orElse: () => CountryListData(
                                                                id: 0,
                                                                countryName:
                                                                    "Unknown",
                                                                stateTitle: '',
                                                                pinTitle: '',
                                                                currency: '',
                                                                altCurrency: 0,
                                                                currencyNod: 0,
                                                                currencySymbol:
                                                                    0,
                                                                taxApplicable:
                                                                    0,
                                                                taxType: 0,
                                                                taxRegNoTitle:
                                                                    '',
                                                                cessApplicable:
                                                                    0,
                                                                exciseApplicable:
                                                                    0,
                                                              ),
                                                            );
                                                            provider
                                                                .selectCountry(
                                                                  context,
                                                                  selectedCountry,
                                                                );

                                                            //  Update registration type
                                                            await provider
                                                                .getRegistrationType(
                                                                  context,
                                                                  selectedCountry
                                                                      .id,
                                                                );
                                                            final selectedRegType = provider
                                                                .registrationlists
                                                                .firstWhere(
                                                                  (r) =>
                                                                      r.id
                                                                          .toString() ==
                                                                      company
                                                                          .regType
                                                                          .toString(),
                                                                  orElse: () =>
                                                                      RegistrationTypeData(
                                                                        id: 0,
                                                                        countryId:
                                                                            0,
                                                                        registrationType:
                                                                            '',
                                                                      ),
                                                                );
                                                            if (selectedRegType
                                                                    .id !=
                                                                0) {
                                                              provider.selectRegistrationType(
                                                                selectedRegType,
                                                              );
                                                              debugPrint(
                                                                "RegType found: ${selectedRegType.registrationType}",
                                                              );
                                                            }
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),

                                          w4,
                                          GestureDetector(
                                            onTap: () {
                                              provider.resetCompanyInfo();
                                              context.pushNamed(
                                                AppRouterConst
                                                    .companyCreationScreen,
                                                extra: {
                                                  'tabIndex': 0,
                                                  'companyData': null,
                                                  'isPop': false,
                                                },
                                              );

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
                                      Consumer<CompanyCreationProvider>(
                                        builder: (context, provider, _) {
                                          final selectedCompany =
                                              provider.selectedCompany;

                                          final addressParts = [
                                            selectedCompany?.address1,
                                            selectedCompany?.address2,
                                            selectedCompany?.address3,
                                            // selectedCompany?.state,
                                            // selectedCompany?.country,
                                          ];

                                          // Remove null or empty values
                                          final filteredAddress = addressParts
                                              .where(
                                                (e) =>
                                                    e != null &&
                                                    e!.trim().isNotEmpty,
                                              )
                                              .toList();

                                          // Join with commas
                                          final addressText = filteredAddress
                                              .join(", ");
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width:
                                                    context.getSize.width /
                                                    1.44,
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
                                                    SizedBox(
                                                      width:
                                                          context
                                                              .getSize
                                                              .width /
                                                          1.4,
                                                      child: Text(
                                                        addressText,
                                                        style: context
                                                            .textStyle
                                                            .s10
                                                            .w400
                                                            .white
                                                            .roboto,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Row(
                                                children: [
                                                  // Consumer<
                                                  //   CompanyCreationProvider
                                                  // >(
                                                  //   builder: (context, provider, _) {
                                                  //     return Builder(
                                                  //       builder: (context) {
                                                  //         return GestureDetector(
                                                  //           onTap: () {
                                                  //             Navigator.push(
                                                  //               context,
                                                  //               MaterialPageRoute(
                                                  //                 builder:
                                                  //                     (
                                                  //                       context,
                                                  //                     ) =>
                                                  //                         CompanyListScreen(),
                                                  //               ),
                                                  //             );
                                                  //             // });
                                                  //           },
                                                  //           child: CircleAvatar(
                                                  //             backgroundColor:
                                                  //                 ColorResources
                                                  //                     .rosePink,
                                                  //             radius: 15,
                                                  //             child: SvgPicture.asset(
                                                  //               AppAssets
                                                  //                   .locationPin,
                                                  //               height: 16,
                                                  //             ),
                                                  //           ),
                                                  //         );
                                                  //       },
                                                  //     );
                                                  //   },
                                                  // ),
                                                  // w8,
                                                  Consumer<
                                                    CompanyCreationProvider
                                                  >(
                                                    builder: (context, provider, _) {
                                                      return Builder(
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              // WidgetsBinding.instance.addPostFrameCallback((
                                                              //   _,
                                                              // ) async {
                                                              //   await provider
                                                              //       .getAllCompanies(
                                                              //         context,
                                                              //       );
                                                              provider.isGodown
                                                                  ? context.pushNamed(
                                                                      AppRouterConst
                                                                          .godownWiseScreen,
                                                                    )
                                                                  : context.pushNamed(
                                                                      AppRouterConst
                                                                          .routeWiseScreen,
                                                                    );
                                                              // });
                                                            },
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  ColorResources
                                                                      .rosePink,
                                                              radius: 15,
                                                              child: SvgPicture.asset(
                                                                AppAssets
                                                                    .locationPin,
                                                                height: 16,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  w8,
                                                  Consumer<
                                                    CompanyCreationProvider
                                                  >(
                                                    builder: (context, provider, _) {
                                                      final selectedCompany =
                                                          provider
                                                              .selectedCompany;
                                                      return GestureDetector(
                                                        onTap: () {
                                                          CustomDialog.showBottomCustomDialog(
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  vertical: 16,
                                                                ),
                                                            child: StatefulBuilder(
                                                              builder:
                                                                  (
                                                                    context,
                                                                    setStateDialog,
                                                                  ) {
                                                                    return Container(
                                                                      decoration: BoxDecoration(
                                                                        color: ColorResources
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              12,
                                                                            ),
                                                                      ),
                                                                      child: Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.symmetric(
                                                                              horizontal: 16,
                                                                            ),
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                w10,
                                                                                Column(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${selectedCompany?.companyName}",
                                                                                      style: context.textStyle.s12.bold.indigoBlue.roboto,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                        radius: 12,
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
                                                                            addressText,
                                                                            style:
                                                                                context.textStyle.s10.w400.dustyBlue.roboto,
                                                                          ),
                                                                          h12,

                                                                          //Edit Compny Info......
                                                                          OptionItem(
                                                                            index:
                                                                                0,

                                                                            selectedIndex:
                                                                                optionIndex,
                                                                            title:
                                                                                appLocalization.dashboard_edit_company,
                                                                            icon:
                                                                                AppAssets.editIcon,
                                                                            onTap: (i) {
                                                                              Navigator.pop(
                                                                                context,
                                                                              );

                                                                              Logger.logSuccess(
                                                                                "SELECTED COMPANY ID: ${selectedCompany!.id}",
                                                                              );
                                                                              Logger.logInfo(
                                                                                "Company Selected: ${selectedCompany.companyName}",
                                                                              );

                                                                              provider.resetStageCompletion();

                                                                              context.pushNamed(
                                                                                AppRouterConst.companyCreationScreen,
                                                                                extra: {
                                                                                  'tabIndex': 0,
                                                                                  'companyData': selectedCompany,
                                                                                  'isPop': false,
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                          const CustomDivider(),

                                                                          //Integration Settings...
                                                                          OptionItem(
                                                                            index:
                                                                                1,
                                                                            selectedIndex:
                                                                                optionIndex,
                                                                            title:
                                                                                appLocalization.dashboard_integration_settings,
                                                                            icon:
                                                                                AppAssets.settings2,
                                                                            onTap: (i) {
                                                                              Logger.logSuccess(
                                                                                "SELECTED COMPANY ID: ${selectedCompany!.id}",
                                                                              );
                                                                              Logger.logInfo(
                                                                                "Company Selected: ${selectedCompany.companyName}",
                                                                              );

                                                                              Navigator.pop(
                                                                                context,
                                                                              );

                                                                              final isVoucherComplete =
                                                                                  provider.selectedCompany!.hasVoucherTypeSettings !=
                                                                                  0;

                                                                              isVoucherComplete
                                                                                  ? context.pushNamed(
                                                                                      AppRouterConst.companyCreationScreen,
                                                                                      extra: {
                                                                                        'tabIndex': 2,
                                                                                        'companyData': selectedCompany,
                                                                                        'isPop': false,
                                                                                        // "regtype":
                                                                                        //     provider.selectedregistrationtype?.registrationType ??
                                                                                        //     "",
                                                                                      },
                                                                                    )
                                                                                  : null;
                                                                            },
                                                                          ),
                                                                          const CustomDivider(),

                                                                          //Company Settings...
                                                                          OptionItem(
                                                                            index:
                                                                                2,
                                                                            selectedIndex:
                                                                                optionIndex,
                                                                            title:
                                                                                appLocalization.dashboard_company_settings,
                                                                            icon:
                                                                                AppAssets.settingsIcon,
                                                                            onTap: (i) {
                                                                              Navigator.pop(
                                                                                context,
                                                                              );

                                                                              Logger.logSuccess(
                                                                                "SELECTED COMPANY ID: ${selectedCompany!.id}",
                                                                              );
                                                                              Logger.logInfo(
                                                                                "Company Selected: ${selectedCompany.companyName}",
                                                                              );

                                                                              context.pushNamed(
                                                                                AppRouterConst.companySettingsScreen,
                                                                                extra: {
                                                                                  "companyId": selectedCompany.id,
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                          const CustomDivider(),

                                                                          //Voucher Type...
                                                                          OptionItem(
                                                                            index:
                                                                                3,
                                                                            selectedIndex:
                                                                                optionIndex,
                                                                            title:
                                                                                appLocalization.dashboard_voucher_type,
                                                                            icon:
                                                                                AppAssets.voucherIcon,
                                                                            onTap: (i) {
                                                                              Logger.logSuccess(
                                                                                "SELECTED COMPANY ID: ${selectedCompany!.id}",
                                                                              );
                                                                              Logger.logInfo(
                                                                                "Company Selected: ${selectedCompany.companyName}",
                                                                              );

                                                                              Navigator.pop(
                                                                                context,
                                                                              );

                                                                              context.pushNamed(
                                                                                AppRouterConst.companyCreationScreen,
                                                                                extra: {
                                                                                  'tabIndex': 1,
                                                                                  'companyData': selectedCompany,
                                                                                  'isPop': false,
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                          const CustomDivider(),

                                                                          //Godown/Route....
                                                                          OptionItem(
                                                                            index:
                                                                                4,
                                                                            selectedIndex:
                                                                                optionIndex,
                                                                            title:
                                                                                appLocalization.dashboard_godown_or_route_wise_voucher,
                                                                            icon:
                                                                                AppAssets.building,
                                                                            onTap: (i) {
                                                                              Navigator.pop(
                                                                                context,
                                                                              );
                                                                              context.pushNamed(
                                                                                AppRouterConst.godownRouteVoucherScreen,
                                                                              );
                                                                            },
                                                                          ),
                                                                          const CustomDivider(),

                                                                          //Add Users
                                                                          OptionItem(
                                                                            index:
                                                                                5,
                                                                            selectedIndex:
                                                                                optionIndex,
                                                                            title:
                                                                                appLocalization.dashboard_add_users,
                                                                            icon:
                                                                                AppAssets.person2,
                                                                            onTap: (i) {
                                                                              Navigator.pop(
                                                                                context,
                                                                              );
                                                                              context.pushNamed(
                                                                                AppRouterConst.companyUserMappingScreen,
                                                                                extra: {
                                                                                  "companyId": selectedCompany!.id,
                                                                                  "name": selectedCompany.companyName,
                                                                                  "companyName": "${selectedCompany.state},${selectedCompany.country}",
                                                                                  "companyData": selectedCompany,
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
                                                              ColorResources
                                                                  .rosePink,
                                                          radius: 15,
                                                          child:
                                                              SvgPicture.asset(
                                                                AppAssets
                                                                    .settings,
                                                                height: 16,
                                                              ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                Consumer<CompanyCreationProvider>(
                                  builder: (context, provider, _) {
                                    final selectedCompany =
                                        provider.selectedCompany;
                                    return Container(
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
                                          if (selectedCompany
                                                  ?.integrationType ==
                                              'Stand Alone') ...[
                                            GestureDetector(
                                              onTap: () {
                                                context.pushNamed(
                                                  AppRouterConst
                                                      .masterDetailsScreen,
                                                );
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 10,
                                                    ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color:
                                                      ColorResources.paleYellow,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          appLocalization
                                                              .dashboard_master,
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
                                                      color:
                                                          ColorResources.amber,
                                                      onTap: () {},
                                                      svgArrowPath: AppAssets
                                                          .arrowToRight,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            h16,
                                          ],
                                          Text(
                                            appLocalization
                                                .admin_dashboard_summary,
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
                                              borderRadius:
                                                  BorderRadius.circular(16),
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
                                                  text1: appLocalization
                                                      .dashboard_total_sales,
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
                                                      color:
                                                          ColorResources.amber,
                                                      onTap: () {},
                                                      svgArrowPath: AppAssets
                                                          .arrowToRight,
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
                                                          CrossAxisAlignment
                                                              .start,
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
                                                        color: ColorResources
                                                            .white
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
                                                          CrossAxisAlignment
                                                              .end,
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
                                    );
                                  },
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
                                        appLocalization.dashboard_expense_entry,
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

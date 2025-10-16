import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/custom_drawer.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/popover_body.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/option_item.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';
import 'package:popover/popover.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int? selectedIndex;
  int? optionIndex;

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
      child: CustomDrawer(
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
                          color: ColorResources.black.withValues(alpha: 0.05),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -context.getSize.height * 0.05,
                          right: -context.getSize.width * 0.23,
                          child: Image.asset(AppAssets.bgVector, height: 300),
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
                                    backgroundColor: ColorResources.transparent,
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
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: ColorResources.white.withValues(
                                        alpha: 0.1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Manvish Info Solutions",
                                          style: context
                                              .textStyle
                                              .s14
                                              .w400
                                              .white
                                              .roboto,
                                        ),
                                        w12,
                                        const Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 20,
                                          color: ColorResources.white,
                                        ),
                                      ],
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
                                              "Anakkattu bldg, Near Dhanalakshmi Bank, Bank Road, Aluva, Ernakulam.",
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
                                                  showPopover(
                                                    context: context,
                                                    bodyBuilder: (context) =>
                                                        const PopoverBody(),
                                                    direction:
                                                        PopoverDirection.bottom,
                                                    arrowDyOffset: 10,
                                                    arrowDxOffset: -60,
                                                    radius: 16,
                                                    shadow: [
                                                      BoxShadow(
                                                        offset: const Offset(
                                                          0,
                                                          3,
                                                        ),
                                                        blurRadius: 6,
                                                        color: ColorResources
                                                            .black
                                                            .withValues(
                                                              alpha: 0.2,
                                                            ),
                                                      ),
                                                    ],
                                                    width:
                                                        context.getSize.width /
                                                        3.2,
                                                    // height: 120,
                                                    arrowHeight: 0,
                                                    arrowWidth: 30,
                                                    backgroundColor:
                                                        Colors.white,
                                                    barrierColor:
                                                        Colors.transparent,
                                                  );
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      ColorResources.rosePink,
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
                                                            MainAxisSize.min,
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
                                                                      "Manvish Info Solutions",
                                                                      style: context
                                                                          .textStyle
                                                                          .s12
                                                                          .w500
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
                                                                        backgroundColor: ColorResources
                                                                            .bluishGray
                                                                            .withValues(
                                                                              alpha: 0.15,
                                                                            ),
                                                                        radius:
                                                                            12,
                                                                        child: const Icon(
                                                                          Icons
                                                                              .close,
                                                                          size:
                                                                              12,
                                                                          color:
                                                                              ColorResources.bluishGray,
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
                                                            "Bank Jn, Aluva",
                                                            style: context
                                                                .textStyle
                                                                .s10
                                                                .w400
                                                                .dustyBlue
                                                                .roboto,
                                                          ),
                                                          h12,
                                                          OptionItem(
                                                            index: 0,
                                                            // style: context.textStyle.s10.w400.dustyBlue.roboto,
                                                            selectedIndex:
                                                                optionIndex,
                                                            title:
                                                                "Edit Company",
                                                            icon: Icons
                                                                .edit_outlined,
                                                            onTap: (i) {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                              context.pushNamed(
                                                                AppRouterConst
                                                                    .companyCreationScreen,
                                                                extra: 0,
                                                              );
                                                            },
                                                          ),
                                                          const CustomDivider(),
                                                          OptionItem(
                                                            index: 1,
                                                            selectedIndex:
                                                                optionIndex,
                                                            title:
                                                                "Integration Settings",
                                                            icon: Icons
                                                                .settings_applications,
                                                            onTap: (i) {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                              context.pushNamed(
                                                                AppRouterConst
                                                                    .companyCreationScreen,
                                                                extra: 2,
                                                              );
                                                            },
                                                          ),
                                                          const CustomDivider(),
                                                          OptionItem(
                                                            index: 2,
                                                            selectedIndex:
                                                                optionIndex,
                                                            title:
                                                                "Company Settings",
                                                            icon:
                                                                Icons.settings,
                                                            onTap: (i) {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                              context.pushNamed(
                                                                AppRouterConst
                                                                    .companySettingsScreen,
                                                              );
                                                            },
                                                          ),
                                                          const CustomDivider(),
                                                          OptionItem(
                                                            index: 3,
                                                            selectedIndex:
                                                                optionIndex,
                                                            title:
                                                                "Voucher Type",
                                                            icon:
                                                                Icons.file_copy,
                                                            onTap: (i) {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                              context.pushNamed(
                                                                AppRouterConst
                                                                    .companyCreationScreen,
                                                                extra: 1,
                                                              );
                                                            },
                                                          ),
                                                          const CustomDivider(),
                                                          OptionItem(
                                                            index: 4,
                                                            selectedIndex:
                                                                optionIndex,
                                                            title:
                                                                "Godown / Route Wise Voucher",
                                                            icon:
                                                                Icons.apartment,
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
                                                          OptionItem(
                                                            index: 5,
                                                            selectedIndex:
                                                                optionIndex,
                                                            title: "Add Users",
                                                            icon: Icons.person,
                                                            onTap: (i) {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                              context.pushNamed(
                                                                AppRouterConst
                                                                    .userCreation,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      borderRadius: BorderRadius.circular(16),
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
                                              MainAxisAlignment.spaceBetween,
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
                            color: ColorResources.black.withValues(alpha: 0.05),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                appLocalization
                                    .admin_dashboard_total_sites_visits,
                                style:
                                    context.textStyle.s14.w500.dustyBlue.roboto,
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
            Positioned(
              bottom: 0,
              left: context.getSize.width / 2.3,
              child: GestureDetector(
                onTap: () {
                  final prefs = sl<SharedPreferences>();
                  prefs.remove("token");
                  context.pushNamed(AppRouterConst.login);
                },
                child: Container(
                  color: ColorResources.transparent,
                  height: context.getSize.height * 0.12,
                  child: Column(
                    children: [
                      Image.asset(AppAssets.powerButton, height: 28),
                      h4,
                      Text(
                        appLocalization.admin_home_log_out,
                        style: context.textStyle.s10.indigoBlue.raleway,
                      ),
                      h16,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

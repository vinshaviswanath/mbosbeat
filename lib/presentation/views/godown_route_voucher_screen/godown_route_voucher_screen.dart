import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/data/models/route_list_model.dart';
import 'package:mpos_beat/data/models/voucher_numbering_response.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_switch.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/godown_route_voucher_screen/widgets/B2bAndB2cPrefixSuffix.dart';
import 'package:mpos_beat/presentation/views/godown_route_voucher_screen/widgets/SingleCompanyPrefixSuffix.dart';
import 'package:mpos_beat/presentation/views/godown_route_voucher_screen/widgets/custom_dropdown_widget.dart';
import 'package:mpos_beat/presentation/views/godown_wise_screen/widgets/add_vehicle.dart';
import 'package:mpos_beat/presentation/views/route_wise_screen/widgets/add_route.dart';

class GodownRouteVoucherScreen extends StatefulWidget {
  const GodownRouteVoucherScreen({super.key});

  @override
  State<GodownRouteVoucherScreen> createState() =>
      _GodownRouteVoucherScreenState();
}

class _GodownRouteVoucherScreenState extends State<GodownRouteVoucherScreen> {
  final TextEditingController routeController = TextEditingController();
  int expandedIndex = -1;

  @override
  void initState() {
    // final pref = sl<SharedPreferences>();
    // final companyId = pref.getInt('selected_company_id').toString();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyCreationProvider>();
      provider
        // ..getVoucherNumbering(
        //   context: context,
        //   companyId: companyId,
        //   voucherModeId: provider.isGodown
        //       ? provider.selectedVehicle?.id ?? 0
        //       : provider.selectedRoute?.id ?? 0,
        // );
        ..getAllRoutess(
          context: context,
          companyId: provider.selectedCompany?.id.toString() ?? '',
        )
        ..getAllGodowns(
          context: context,
          companyId: provider.selectedCompany?.id.toString() ?? '',
        );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    // final pref = sl<SharedPreferences>();
    // final companyId = pref.getInt('selected_company_id').toString();

    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Voucher Type",
              style: context.textStyle.s22.bold.indigoBlue.roboto,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Switch Row
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: ColorResources.indigoBlue.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalizations.popover_body_godown_wise,
                        style: context.textStyle.s12.bold.roboto.copyWith(
                          color: ColorResources.indigoBlue.withValues(
                            alpha: !provider.isGodown ? 0.5 : 1,
                          ),
                        ),
                      ),
                      SelectionSwitch(
                        value: !provider.isGodown,
                        onChanged: (value) {
                          provider.toggleVoucher(context);
                        },
                      ),
                      Text(
                        appLocalizations.popover_body_route_wise,
                        style: context.textStyle.s12.bold.roboto.copyWith(
                          color: ColorResources.indigoBlue.withValues(
                            alpha: provider.isGodown ? 0.5 : 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Dropdown label & edit
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.isGodown
                          ? appLocalizations.godown_route_voucher_godown_name
                          : appLocalizations.godown_route_voucher_route_name,
                      style: context.textStyle.s12.w400.bluishGray.roboto,
                    ),
                    if ((provider.isGodown &&
                            (provider.selectedVehicle != null)) ||
                        (!provider.isGodown &&
                            (provider.selectedRoute != null)))
                      GestureDetector(
                        onTap: () {
                          CustomDialog.showBottomCustomDialog(
                            chid: provider.isGodown
                                ? AddVehicle(
                                    isEdit: true,
                                    details: provider.selectedVehicle,
                                  )
                                : AddRoute(
                                    isEdit: true,
                                    details: provider.selectedRoute,
                                  ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: ColorResources.indigoBlue.withValues(
                            alpha: 0.2,
                          ),
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
                const SizedBox(height: 8),

                // 🔹 Dropdown
                Row(
                  children: [
                    Expanded(
                      child: StreamBuilder(
                        key: ValueKey(provider.isGodown),
                        stream: provider.isGodown
                            ? provider.godownStream
                            : provider.routeStream,
                        builder: (context, snapshot) {
                          final connectionState = snapshot.connectionState;
                          final dataList = snapshot.data;

                          // CASE 1: Stream not yet ready (null data, waiting)
                          if (connectionState == ConnectionState.waiting &&
                              dataList == null) {
                            // You can show nothing or a placeholder dropdown
                            return CustomDropdown(
                              hintText: provider.isGodown
                                  ? appLocalizations
                                        .godown_route_voucher_enter_godown_name
                                  : appLocalizations
                                        .godown_route_voucher_enter_route_name,
                              value: null,
                              items: const [],
                              onChanged: (_) {},
                            );
                          }

                          // CASE 2: Once data arrives (even later)
                          if (dataList != null &&
                              (dataList as List).isNotEmpty) {
                            final items = provider.isGodown
                                ? (dataList as List<VehicleList>)
                                      .map((e) => e.name ?? "")
                                      .toList()
                                : (dataList as List<RouteList>)
                                      .map((e) => e.routeName ?? "")
                                      .toList();

                            final selectedValue = provider.isGodown
                                ? provider.selectedVehicle?.name
                                : provider.selectedRoute?.routeName;

                            return CustomDropdown(
                              hintText: provider.isGodown
                                  ? appLocalizations
                                        .godown_route_voucher_enter_godown_name
                                  : appLocalizations
                                        .godown_route_voucher_enter_route_name,
                              value: selectedValue,
                              items: items,
                              onChanged: (value) async {
                                if (provider.isGodown) {
                                  final selected =
                                      (dataList as List<VehicleList>)
                                          .firstWhere((e) => e.name == value);
                                  provider.setSelectedVehicle(selected);
                                  await provider.getVoucherNumberingGodown(
                                    context: context,
                                    companyId:
                                        provider.selectedCompany?.id
                                            .toString() ??
                                        '',
                                    voucherModeId: selected.id ?? 0,
                                  );
                                } else {
                                  final selected = (dataList as List<RouteList>)
                                      .firstWhere((e) => e.routeName == value);
                                  provider.setSelectedRoute(selected);
                                  await provider.getVoucherNumberingRoute(
                                    context: context,
                                    companyId:
                                        provider.selectedCompany?.id
                                            .toString() ??
                                        '',
                                    voucherModeId: selected.id ?? 0,
                                  );
                                }
                              },
                            );
                          }

                          // CASE 3: Empty or null list after stream completes
                          return CustomDropdown(
                            hintText: provider.isGodown
                                ? appLocalizations
                                      .godown_route_voucher_enter_godown_name
                                : appLocalizations
                                      .godown_route_voucher_enter_route_name,
                            value: null,
                            items: const [],
                            onChanged: (_) {},
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        CustomDialog.showBottomCustomDialog(
                          chid: provider.isGodown
                              ? const AddVehicle()
                              : const AddRoute(),
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

                const SizedBox(height: 16),
                Text(
                  "Voucher Series Settings:",
                  style: context.textStyle.s14.w500.bluishGray.roboto.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: context.textStyle.dustyBlue.color,
                  ),
                ),
                const SizedBox(height: 8),

                // 🔹 Voucher List Stream
                Expanded(
                  child: StreamBuilder<List<VoucherNumberingModel>>(
                    key: ValueKey(provider.isGodown),
                    stream: provider.isGodown
                        ? provider.voucherNumberingGodownStream
                        : provider.voucherNumberingRouteStream,
                    builder: (context, snapshot) {
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return const Center(child: CircularProgressIndicator());
                      // }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            "No vouchers available",
                            style: context.textStyle.s12.w500.dustyBlue.roboto,
                          ),
                        );
                      }

                      final voucherData = snapshot.data!;
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        itemCount: voucherData.length,
                        itemBuilder: (context, index) {
                          final data = voucherData[index];
                          final isExpanded = expandedIndex == index;

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: CustomDropdownWidget(
                              isExpand: isExpanded,
                              title: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    expandedIndex = isExpanded ? -1 : index;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.voucherMenuName ?? '',
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
                                  if (data.hasB2B == 0) ...[
                                    h16,
                                    SingleCompanyPrefixSuffix(data: data),
                                  ],
                                  if (data.hasB2B == 1) ...[
                                    h6,
                                    B2bAndB2cPrefixSuffix(data: data),
                                  ],
                                  h16,
                                  const CustomDivider(),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                // 🔹 Save Button
                CustomButton(
                  onTap: () {
                    provider.createVoucherNumbering(
                      context: context,
                      companyId: provider.selectedCompany?.id ?? 0,
                      voucherModeId: provider.isGodown
                          ? provider.selectedVehicle?.id ?? 0
                          : provider.selectedRoute?.id ?? 0,
                      voucherNumbers: provider.voucherNumberList ?? [],
                    );
                    // context.pop();
                  },
                  buttonText: "Save",
                  isborderEnable: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

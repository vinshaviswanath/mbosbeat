import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/data/models/route_list_model.dart';
import 'package:mpos_beat/data/models/voucher_numbering_response.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/godown_route_voucher_screen/widgets/B2bAndB2cPrefixSuffix.dart';
import 'package:mpos_beat/presentation/views/godown_route_voucher_screen/widgets/SingleCompanyPrefixSuffix.dart';
import 'package:mpos_beat/presentation/views/godown_route_voucher_screen/widgets/custom_dropdown_widget.dart';
import 'package:mpos_beat/presentation/views/transactions/sales_return/sales_return.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoucherSettingsScreen<T> extends StatefulWidget {
  final T data;
  final int voucherModeId;

  const VoucherSettingsScreen({super.key, required this.data, required this.voucherModeId});

  @override
  State<VoucherSettingsScreen<T>> createState() =>
      _VoucherSettingsScreenState<T>();
}

class _VoucherSettingsScreenState<T> extends State<VoucherSettingsScreen<T>> {
  bool get isVehicle => T == VehicleList;
  bool get isRoute => T == RouteList;
  final TextEditingController prefixController = TextEditingController();
  final TextEditingController suffixController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  int expandedIndex = -1;

  @override
  void initState() {
    final pref = sl<SharedPreferences>();
    final companyId = pref.getInt('selected_company_id').toString();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyCreationProvider>();
      provider
        ..getVoucherNumbering(context: context, companyId: companyId,voucherModeId: widget.voucherModeId)
        ..getAllRoutess(context: context, companyId: companyId)
        ..getAllGodowns(context: context, companyId: companyId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = -1;

    String nameText = '';
    if (isVehicle && widget.data is VehicleList) {
      nameText = (widget.data as VehicleList).name ?? '';
    } else if (isRoute && widget.data is RouteList) {
      nameText = (widget.data as RouteList).routeName ?? '';
    }

    final pref = sl<SharedPreferences>();
    final companyId = pref.getInt('selected_company_id').toString();
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.left,
                      colorFilter: const ColorFilter.mode(
                        ColorResources.indigoBlue,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            title: Text(
              "Voucher Settings",
              style: context.textStyle.s22.bold.indigoBlue.roboto,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.isGodown ? "Godown Name:" : "Route Name:",
                  style: context.textStyle.s12.w400.bluishGray.roboto,
                ),
                const SizedBox(height: 4),
                Text(
                  nameText,
                  style: context.textStyle.s14.w500.dustyBlue.roboto,
                ),
                const SizedBox(height: 16),
                Text(
                  "Voucher Series Settings:",
                  style: context.textStyle.s14.w500.dustyBlue.roboto.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: ColorResources.dustyBlue,
                  ),
                ),
                const SizedBox(height: 16),

                // ✅ VoucherNumbering Stream
                StreamBuilder<List<VoucherNumberingModel>>(
                  stream: provider.voucherNumberingStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          "No vouchers available",
                          style: context.textStyle.s12.w500.dustyBlue.roboto,
                        ),
                      );
                    }

                    final voucherNumberingData = snapshot.data!;

                    return StreamBuilder(
                      stream: provider.isGodown
                          ? provider.godownStream
                          : provider.routeStream,
                      builder: (context, innerSnapshot) {
                        if (innerSnapshot.hasError) {
                          return Center(
                            child: Text(
                              "Something went wrong",
                              style:
                                  context.textStyle.s12.w500.dustyBlue.roboto,
                            ),
                          );
                        }

                        final dataList = innerSnapshot.data;
                        final items = provider.isGodown
                            ? (dataList is List<VehicleList>
                                      ? dataList
                                      : <VehicleList>[])
                                  .map((e) => e.name ?? "")
                                  .toList()
                            : (dataList is List<RouteList>
                                      ? dataList
                                      : <RouteList>[])
                                  .map((e) => e.routeName ?? "")
                                  .toList();

                        if (items.isEmpty) {
                          return Center(
                            child: Text(
                              provider.isGodown
                                  ? "No vehicles available"
                                  : "No routes available",
                              style:
                                  context.textStyle.s12.w500.dustyBlue.roboto,
                            ),
                          );
                        }

                        if (provider.isGodown) {
                          if (provider.selectedVehicle == null) {
                            final firstVehicle =
                                (dataList as List<VehicleList>).first;
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              provider.setSelectedVehicle(firstVehicle);
                            });
                          }
                        } else {
                          if (provider.selectedRoute == null) {
                            final firstRoute =
                                (dataList as List<RouteList>).first;
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              provider.setSelectedRoute(firstRoute);
                            });
                          }
                        }

                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: voucherNumberingData.length,
                          itemBuilder: (context, index) {
                            final data = voucherNumberingData[index];
                            final isExpanded = expandedIndex == index;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${data.voucherMenuName}",
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
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 20),

                // ✅ Save Button at bottom
                CustomButton(
                  width: context.getSize.width - 32,
                  onTap: () {
                     provider.createVoucherNumbering(
                                    context: context,
                                    companyId: int.parse(companyId),
                                    voucherModeId: widget.voucherModeId,
                                    voucherNumbers:
                                        provider.voucherNumberList ?? [],
                                  );
                    context.pop();
                  },
                  buttonText: "Save",
                  isborderEnable: false,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

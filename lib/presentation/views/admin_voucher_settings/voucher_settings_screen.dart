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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class VoucherSettingsScreen<T> extends StatefulWidget {
  final T data;
  final int voucherModeId;

  const VoucherSettingsScreen({
    super.key,
    required this.data,
    required this.voucherModeId,
  });

  @override
  State<VoucherSettingsScreen<T>> createState() =>
      _VoucherSettingsScreenState<T>();
}

class _VoucherSettingsScreenState<T> extends State<VoucherSettingsScreen<T>> {
  int expandedIndex = -1;

  bool get isVehicle => widget.data is VehicleList;
  bool get isRoute => widget.data is RouteList;

  String get nameText {
    if (widget.data is VehicleList) {
      return (widget.data as VehicleList).name ?? '';
    } else if (widget.data is RouteList) {
      return (widget.data as RouteList).routeName ?? '';
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyCreationProvider>();

      final companyId = provider.selectedCompany?.id.toString() ?? '';

      if (provider.isGodown) {
        provider.getVoucherNumberingGodown(
          context: context,
          companyId: companyId,
          voucherModeId: widget.voucherModeId,
        );
      } else {
        provider.getVoucherNumberingRoute(
          context: context,
          companyId: companyId,
          voucherModeId: widget.voucherModeId,
        );
      }

      provider
        ..getAllRoutess(context: context, companyId: companyId)
        ..getAllGodowns(context: context, companyId: companyId);
    });
  }

  void _onSave(BuildContext context, CompanyCreationProvider provider) {
    final pref = sl<SharedPreferences>();
    final companyId = pref.getInt('selected_company_id');

    provider.createVoucherNumbering(
      context: context,
      companyId: companyId!,
      voucherModeId: widget.voucherModeId,
      voucherNumbers: provider.voucherNumberList ?? [],
    );

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: const VoucherSettingsAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VoucherHeader(
                  title: provider.isGodown ? "Godown Name:" : "Route Name:",
                  name: nameText,
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: VoucherSeriesList(
                    provider: provider,
                    expandedIndex: expandedIndex,
                    onExpand: (index) {
                      setState(() {
                        expandedIndex = expandedIndex == index ? -1 : index;
                      });
                    },
                  ),
                ),

                CustomButton(
                  width: context.getSize.width - 32,
                  onTap: () => _onSave(context, provider),
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

class VoucherSettingsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const VoucherSettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: SvgPicture.asset(
                AppAssets.left,
                colorFilter: const ColorFilter.mode(
                  ColorResources.indigoBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      title: Text(
        "Voucher Settings",
        style: context.textStyle.s22.bold.indigoBlue.roboto,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class VoucherHeader extends StatelessWidget {
  final String title;
  final String name;

  const VoucherHeader({super.key, required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textStyle.s12.w400.bluishGray.roboto),
        const SizedBox(height: 4),
        Text(name, style: context.textStyle.s14.w500.dustyBlue.roboto),
        const SizedBox(height: 16),
        Text(
          "Voucher Series Settings:",
          style: context.textStyle.s14.w500.dustyBlue.roboto.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: ColorResources.dustyBlue,
          ),
        ),
      ],
    );
  }
}

class VoucherSeriesList extends StatelessWidget {
  final CompanyCreationProvider provider;
  final int expandedIndex;
  final Function(int) onExpand;

  const VoucherSeriesList({
    super.key,
    required this.provider,
    required this.expandedIndex,
    required this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<VoucherNumberingModel>>(
      stream: provider.isGodown
          ? provider.voucherNumberingGodownStream
          : provider.voucherNumberingRouteStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const VoucherSeriesShimmer();
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              "No vouchers available",
              style: context.textStyle.s12.w500.dustyBlue.roboto,
            ),
          );
        }

        final vouchers = snapshot.data!;

        return ListView.builder(
          itemCount: vouchers.length,
          itemBuilder: (context, index) {
            final data = vouchers[index];

            return VoucherSeriesTile(
              data: data,
              isExpanded: expandedIndex == index,
              onTap: () => onExpand(index),
            );
          },
        );
      },
    );
  }
}

class VoucherSeriesTile extends StatelessWidget {
  final VoucherNumberingModel data;
  final bool isExpanded;
  final VoidCallback onTap;

  const VoucherSeriesTile({
    super.key,
    required this.data,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: CustomDropdownWidget(
        isExpand: isExpanded,
        title: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.voucherMenuName ?? '',
                style: context.textStyle.s12.w400.bluishGray.roboto,
              ),
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: ColorResources.indigoBlue,
              ),
            ],
          ),
        ),
        child: VoucherSeriesBody(data: data),
      ),
    );
  }
}

class VoucherSeriesBody extends StatelessWidget {
  final VoucherNumberingModel data;

  const VoucherSeriesBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (data.hasB2B == 0) ...[h16, SingleCompanyPrefixSuffix(data: data)],

        if (data.hasB2B == 1) ...[h6, B2bAndB2cPrefixSuffix(data: data)],

        h16,
        const CustomDivider(),
      ],
    );
  }
}

class VoucherSeriesShimmer extends StatelessWidget {
  const VoucherSeriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        );
      },
    );
  }
}

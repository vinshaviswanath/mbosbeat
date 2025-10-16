import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
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
  bool isGodownWise = true;
  final TextEditingController routeController = TextEditingController();

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
                              value: !provider.isGodown,
                              onChanged: (value) {
                                provider.toggleVoucher();
                              },
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
                            provider.isGodown
                                ? appLocalizations
                                      .godown_route_voucher_godown_name
                                : appLocalizations
                                      .godown_route_voucher_route_name,
                            style: context.textStyle.s12.w400.bluishGray.roboto,
                          ),
                          GestureDetector(
                            onTap: () {
                              CustomDialog.showBottomCustomDialog(
                                chid: provider.isGodown
                                    ? const AddVehicle(isEdit: true)
                                    : const AddRoute(isEdit: true),
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
                              hintText: provider.isGodown
                                  ? appLocalizations
                                        .godown_route_voucher_enter_godown_name
                                  : appLocalizations
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
                        onTap: () {
                          Navigator.pop(context);
                        },
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

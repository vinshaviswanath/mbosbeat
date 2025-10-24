import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/vouchertypeTile.dart';

class VoucherTypeWidget extends StatefulWidget {
  const VoucherTypeWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<VoucherTypeWidget> createState() => _VoucherTypeWidgetState();
}

class _VoucherTypeWidgetState extends State<VoucherTypeWidget> {
  @override
  void initState() {
    super.initState();
    toggleStates = {};
    checkStates = {};
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyCreationProvider>();
      provider.fetchVoucherTypes(context, 1302);
    });
  }

  Map<int, int> toggleStates = {};
  Map<int, int> checkStates = {};
  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appLocalization.voucher_type_voucher_type_activation,
                  style: context.textStyle.s12.w400.bluishGray.roboto,
                ),
                h6,
              ],
            ),
          ),
        ),

        /// Vouchers List
        Consumer<CompanyCreationProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final voucherList = provider.voucherTypes;

            if (voucherList.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: Text("No voucher types available")),
              );
            }

            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final voucher = voucherList[index];
                //  Logger.logInfo('Voucher #$index: ${voucher.voucherMenuName}');

                final isCheckOnInt =
                    (checkStates[voucher.id] ?? voucher.isEnabled) == 1 ? 1 : 0;
                final isToggleOnInt =
                    (toggleStates[voucher.id] ?? voucher.hasB2B) == 1 ? 1 : 0;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: VoucherTypeTile(
                    voucher: voucher,
                    isCheckOnInt: isCheckOnInt,
                    isToggleOnInt: isToggleOnInt,
                    onEdit: () {},

                    onChanged: (newValue) {
                      setState(() {
                        checkStates[voucher.id] = newValue;
                      });
                    },
                  ),
                );
              }, childCount: voucherList.length),
            );
          },
        ),

        /// Next Button at bottom
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  buttonText: appLocalization.company_info_widget_next,
                  isborderEnable: false,
                  onTap: widget.onTap,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

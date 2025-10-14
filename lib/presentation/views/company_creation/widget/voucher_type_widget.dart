import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/voucher_type_tile.dart';

class VoucherTypeWidget extends StatelessWidget {
  const VoucherTypeWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    final provider = context.watch<CompanyCreationProvider>();
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
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 13,
                        color: Color(0xFFD6D6D6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: provider.voucherStates.keys.map((title) {
                      final value = provider.getValue(title);
                      return VoucherTypeTile(
                        title: title,
                        value: value,
                        onChanged: (val) => provider.toggleValue(title, val),
                        onEdit: () {},
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

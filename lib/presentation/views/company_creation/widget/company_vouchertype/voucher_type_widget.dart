import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/vouchertypeTile.dart';

class VoucherTypeWidget extends StatefulWidget {
  final Company? companyData;
  const VoucherTypeWidget({super.key, this.onTap, this.companyData});
  final void Function()? onTap;

  @override
  State<VoucherTypeWidget> createState() => _VoucherTypeWidgetState();
}

class _VoucherTypeWidgetState extends State<VoucherTypeWidget> {
  int? companyId;
  Map<int, int> toggleStates = {};
  Map<int, int> checkStates = {};

  @override
  void initState() {
    super.initState();
    toggleStates = {};
    checkStates = {};
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyCreationProvider>();

      // Get companyId either from widget.companyData or provider
      if (widget.companyData != null && widget.companyData!.id != null) {
        companyId = widget.companyData!.id!;
        print(
          'companyId in voucher screen  from widget.companyData: $companyId',
        );
      } else {
        companyId = provider.companyid ?? 0;
        print('companyId in voucher screen  from provider: $companyId');
      }

      provider.fetchVoucherTypes(context, companyId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appLocalization.voucher_type_voucher_type_activation,
                  style: context.textStyle.s12.w400.bluishGray.roboto,
                ),
                //h6,
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
            //final companyId = provider.companyid;

            if (voucherList.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: Text("No voucher types available")),
              );
            }

            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    color:ColorResources.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black  .withValues(alpha: 0.1),
                        offset: Offset(0, 10),

                        blurRadius: 3,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: voucherList.length,
                    itemBuilder: (context, index) {
                      final voucher = voucherList[index];
                      final isCheckOnInt =
                          (checkStates[voucher.id] ?? voucher.isEnabled) == 1
                          ? 1
                          : 0;
                      final isToggleOnInt =
                          (toggleStates[voucher.id] ?? voucher.hasB2B) == 1
                          ? 1
                          : 0;

                      return VoucherTypeTile(
                        companyId: companyId ?? 0,
                        voucher: voucher,
                        isCheckOnInt: isCheckOnInt,
                        isToggleOnInt: isToggleOnInt,
                        onEdit: () {},
                        onChanged: (newValue) {
                          setState(() {
                            checkStates[voucher.id] = newValue;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
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
                  onTap: () {
                    final provider = Provider.of<CompanyCreationProvider>(
                      context,
                      listen: false,
                    );

                    // Check if any voucher has isEnabled == 1
                    final hasEnabledVoucher = provider.voucherTypes.any(
                      (voucher) => voucher.isEnabled == 1,
                    );

                    print("hasEnabledVoucher: $hasEnabledVoucher");

                    if (hasEnabledVoucher) {
                      provider.completeVouchers(
                        context,
                        companyId: widget.companyData?.id!,
                      );
                      widget.onTap?.call();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/completed_TickMark.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/stataus_view_widget.dart';

class CompanyCard extends StatelessWidget {
  final CompanyViewList company;
  final bool isSelected;
  final VoidCallback? onTap;

  const CompanyCard({
    Key? key,
    required this.company,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int percentage = 0;
    if (company.hasCompanySettings != 0) {
      percentage += 40;
    }
    if (company.hasIntegrationSettings != 0) {
      percentage += 30;
    }
    if (company.hasVoucherTypeSettings != 0) {
      percentage += 30;
    }
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF6FBFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    StatusView(
                      numberOfStatus: 3,
                      company: company,
                      centerImageUrl: '',
                    ),

                    if (company.hasCompanySettings != 0 &&
                        company.hasIntegrationSettings != 0 &&
                        company.hasVoucherTypeSettings != 0)
                      const Positioned(
                        bottom: -3,
                        right: -3,
                        child: CompletedTickMark(),
                      ),
                  ],
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.companyName ?? '',
                        style: context.textStyle.s12.w600.indigoBlue.roboto,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),

                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 13,
                            color: ColorResources.indigoBlue,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            company.address1 ?? '',
                            style: context.textStyle.s10.w400.mutedBlue.roboto,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 10,
                            color: ColorResources.indigoBlue,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            "9526307038",
                            style: context.textStyle.s10.w400.mutedBlue.roboto,
                          ),
                          Spacer(),
                          Text(
                            "$percentage% Completed",
                            style: context.textStyle.s08.w400.lightgreen.roboto,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 20,
          thickness: 1,
          color: ColorResources.dustyBlue.withOpacity(0.18),
        ),
      ],
    );
  }
}

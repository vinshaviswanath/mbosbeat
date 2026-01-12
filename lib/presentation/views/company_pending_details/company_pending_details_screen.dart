import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_info_widget/company_info_widget.dart';
import 'package:mpos_beat/presentation/views/company_pending_details/widgets/bank_details_form.dart';
import 'package:mpos_beat/presentation/views/company_pending_details/widgets/company_info_form.dart';
import 'package:mpos_beat/presentation/views/company_pending_details/widgets/registration_details_form.dart';
import 'package:mpos_beat/presentation/views/godown_route_voucher_screen/widgets/custom_dropdown_widget.dart';

class CompanyPendingDetailsScreen extends StatefulWidget {
  final CompanyViewList? company;
  const CompanyPendingDetailsScreen({super.key, required this.company});

  @override
  State<CompanyPendingDetailsScreen> createState() =>
      _CompanyPendingDetailsScreenState();
}

class _CompanyPendingDetailsScreenState
    extends State<CompanyPendingDetailsScreen> {
  final List<String> settings = [
    "Company Info",
    "Bank Details",
    "Registration Details",
  ];
  int expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Logger.logSuccess("INdex :: $expandedIndex");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.company?.companyName}",
          style: context.textStyle.s18.bold.indigoBlue,
        ),
        centerTitle: true,
        leading: Padding(
          padding: .only(left: 12),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.left,
                  height: context.getSize.height * 0.035,
                  colorFilter: ColorFilter.mode(
                    ColorResources.indigoBlue,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => h4,
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        itemCount: settings.length,
        itemBuilder: (context, index) {
          final data = settings[index];
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
                child: CompanyDetailsCard(
                  data: data,
                  isExpanded: isExpanded,
                  bgColor: index == 1
                      ? ColorResources.mistyrose
                      : ColorResources.lavenderBlue,
                ),
              ),
              child: expandedIndex == 0
                  ? CompanyInfoForm(company: widget.company)
                  : expandedIndex == 1
                  ? BankDetailsForm(company: widget.company)
                  : RegistrationDetailsForm(company: widget.company),
            ),
          );
        },
      ),
    );
  }
}

class CompanyDetailsCard extends StatelessWidget {
  const CompanyDetailsCard({
    super.key,
    required this.data,
    required this.isExpanded,
    required this.bgColor,
  });

  final String data;
  final bool isExpanded;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(16),
      margin: .only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(data, style: context.textStyle.bold.s14.mutedIndigo),
          Row(
            children: [
              Container(
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: ColorResources.indigoBlue,
                  ),
                ),
                child: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: ColorResources.indigoBlue,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class CompanyDetailsCard extends StatelessWidget {
//   final String label;
//   final Color bgColor;
//   final void Function()? onTap;
//   const CompanyDetailsCard({
//     super.key,
//     required this.label,
//     required this.bgColor,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: .all(16),
//         margin: .only(left: 16, right: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: bgColor,
//         ),
//         child: Row(
//           mainAxisAlignment: .spaceBetween,
//           children: [
//             Text(label, style: context.textStyle.bold.s14.mutedIndigo),
//             Row(
//               children: [
//                 Container(
//                   height: 24,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       width: 2,
//                       color: ColorResources.indigoBlue,
//                     ),
//                   ),
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: SvgPicture.asset(
//                         height: 8,
//                         AppAssets.arrowDown,
//                         colorFilter: ColorFilter.mode(
//                           ColorResources.indigoBlue,
//                           BlendMode.srcIn,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

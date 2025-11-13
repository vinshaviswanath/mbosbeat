import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/company_card_widget.dart';

class CompanyDropdown extends StatefulWidget {
  final List<CompanyViewList> companyList;
  final CompanyViewList? selectedCompany;
  final Function(CompanyViewList)? onCompanySelected;

  const CompanyDropdown({
    super.key,
    required this.companyList,
    this.selectedCompany,
    this.onCompanySelected,
  });

  @override
  State<CompanyDropdown> createState() => _CompanyDropdownState();
}

class _CompanyDropdownState extends State<CompanyDropdown> {
  CompanyViewList? selectedCompany;

  final GlobalKey _dropdownKey = GlobalKey();

  void _showCompanyDialog(BuildContext context) {
    final RenderBox box =
        _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final Size size = box.size;

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              left: position.dx,
              top: size.height + 70,
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: MediaQuery.of(context).size.width * .93,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: "Search Company",
                          hintTextStyle: context.textStyle.s12.silverGray.w300,

                          backgroundColor: ColorResources.lightGray,

                          borderRadius: 12,
                          hintColor: ColorResources.silverGray,
                          borderColor: ColorResources.transparent,
                        ),
                        h8,
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: widget.companyList.length,
                          separatorBuilder: (context, index) => const Divider(
                            height: 1,
                            color: Color(0xFFEEEEEE),
                          ),
                          itemBuilder: (context, index) {
                            final company = widget.companyList[index];
                            return CompanyCard(
                              company: company,
                              onTap: () {
                                widget.onCompanySelected?.call(company);
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      key: _dropdownKey,
      decoration: BoxDecoration(
        color: ColorResources.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.selectedCompany?.companyName ?? "",
              style: context.textStyle.s14.w400.white.roboto,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          InkWell(
            onTap: () => _showCompanyDialog(context),
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

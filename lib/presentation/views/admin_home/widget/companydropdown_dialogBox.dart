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
  TextEditingController searchController = TextEditingController();

  final GlobalKey _dropdownKey = GlobalKey();
  List<CompanyViewList> filteredList = [];
  bool isSearching = false;
  @override
  void didUpdateWidget(covariant CompanyDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedCompany != oldWidget.selectedCompany) {
      setState(() {
        selectedCompany = widget.selectedCompany;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selectedCompany = widget.selectedCompany;
    filteredList = widget.companyList;

    searchController.addListener(() {
      filterCompanyList(searchController.text);
    });
  }

  void filterCompanyList(String query) {
    if (query.isEmpty) {
      setState(() {
        isSearching = false;
        filteredList = widget.companyList;
      });
    } else {
      setState(() {
        isSearching = true;
        filteredList = widget.companyList
            .where(
              (c) => c.companyName!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      });
    }
  }

  void _showCompanyDialog(BuildContext context) {
    final RenderBox box =
        _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    double itemHeight = MediaQuery.of(context).size.height * 0.09;
    setState(() {
      searchController.clear();
      isSearching = false;
      filteredList = widget.companyList;
    });
    showDialog(
      context: context,
      barrierColor: Colors.transparent,

      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
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
                  top: MediaQuery.of(context).size.height * 0.125,
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(12),
                    color: ColorResources.white,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorResources.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: MediaQuery.of(context).size.width * 0.923,

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CustomTextField(
                              hint: "Search Company",
                              hintTextStyle:
                                  context.textStyle.s12.silverGray.w300,
                              controller: searchController,
                              backgroundColor: ColorResources.lightGray,

                              borderRadius: 12,
                              hintColor: ColorResources.silverGray,
                              borderColor: ColorResources.transparent,
                              onChange: (value) {
                                filterCompanyList(value);
                                setStateDialog(() {});
                              },
                            ),
                            h8,

                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: (widget.companyList.length > 3)
                                    ? itemHeight * 3
                                    : itemHeight *
                                          widget.companyList.length.toDouble(),
                              ),
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: isSearching
                                    ? filteredList.length
                                    : (widget.companyList.length > 3
                                          ? 3
                                          : widget.companyList.length),

                                separatorBuilder: (context, index) =>
                                    const Divider(
                                      height: 1,
                                      color: Color(0xFFEEEEEE),
                                    ),
                                itemBuilder: (context, index) {
                                  final company = isSearching
                                      ? filteredList[index]
                                      : widget.companyList[index];

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CompanyCard(
                                      company: company,
                                      isSelected:
                                          selectedCompany?.id == company.id,

                                      onTap: () {
                                        setState(() {
                                          selectedCompany = company;
                                        });

                                        widget.onCompanySelected?.call(company);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            if (widget.companyList.length > 3)
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 6,
                                  ),
                                  child: Text(
                                    "Load More",
                                    style: context
                                        .textStyle
                                        .s12
                                        .bold
                                        .indigoBlue
                                        .w400
                                        .roboto,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  _showLargeCompanyDialog(context);
                                },
                              ),

                            GestureDetector(
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: ColorResources.dustyBlue
                                    .withValues(alpha: 0.15),
                                child: const Icon(
                                  Icons.close,
                                  color: ColorResources.bluishGray,
                                  size: 12,
                                ),
                              ),
                              onTap: () => Navigator.pop(context),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.045,

      key: _dropdownKey,
      decoration: BoxDecoration(
        color: ColorResources.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        onTap: () => _showCompanyDialog(context),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.selectedCompany?.companyName ?? "",
                style: context.textStyle.s14.w400.white.roboto,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: ColorResources.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _showLargeCompanyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return Dialog(
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: "Search Company",
                        hintTextStyle: context.textStyle.s12.silverGray.w300,
                        controller: searchController,
                        backgroundColor: ColorResources.lightGray,
                        borderRadius: 12,
                        borderColor: ColorResources.transparent,
                        onChange: (value) {
                          filterCompanyList(value);
                          setStateDialog(() {});
                        },
                      ),
                      h12,
                      Expanded(
                        child: ListView.separated(
                          itemCount: filteredList.length,
                          separatorBuilder: (context, index) =>
                              const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final company = filteredList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CompanyCard(
                                company: company,
                                isSelected: selectedCompany?.id == company.id,

                                onTap: () {
                                  setState(() {
                                    selectedCompany = company;
                                  });

                                  widget.onCompanySelected?.call(company);
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                        ),
                      ),

                      // Close button
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: ColorResources.dustyBlue.withValues(
                            alpha: 0.15,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: ColorResources.bluishGray,
                            size: 12,
                          ),
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

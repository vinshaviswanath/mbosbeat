import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/domain/request/create_user_company_mapping_params.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/add_company/widgets/add_company_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCompanyScreen extends StatefulWidget {
  const AddCompanyScreen({
    super.key,
    required this.name,
    required this.companyName,
    required this.userId,
  });

  final String name;
  final String companyName;
  final int userId;

  @override
  State<AddCompanyScreen> createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends State<AddCompanyScreen> {
  final TextEditingController _searchController = TextEditingController();

  final Set<int> selectedCompanyIds = {};
  final List<CompanyList> selectedCompanyList = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = context.read<UserManagementProvider>();
      await provider.getAllCompanies(context: context);

      final pref = sl<SharedPreferences>();
      final storedList = pref.getStringList('companies');
      if (storedList != null && storedList.isNotEmpty) {
        final loadedCompanies = storedList.map(int.parse).toList();
        setState(() {
          selectedCompanyIds.addAll(loadedCompanies);
          selectedCompanyList.addAll(
            loadedCompanies.map((id) => CompanyList(companyId: id)),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    final provider = context.watch<UserManagementProvider>();
    final filteredCompanies =
        provider.companiesList?.companyViewList.where((company) {
          final query = _searchController.text.toLowerCase();
          return query.isEmpty ||
              (company.companyName ?? '').toLowerCase().contains(query);
        }).toList() ??
        [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.cloudGray,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
          ),
        ),
        title: Text(
          appLocalization.add_company_screen_add_company,
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<CompaniesListResponse?>(
        stream: provider.companyListStream,
        builder: (context, snapshot) {
          final companyList = snapshot.data?.companyViewList ?? [];

          final filteredCompanies = companyList.where((company) {
            final query = _searchController.text.toLowerCase();
            return query.isEmpty ||
                (company.companyName ?? '').toLowerCase().contains(query);
          }).toList();

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    h12,
                    Text(
                      widget.name,
                      style: context.textStyle.s12.w500.indigoBlue.roboto,
                    ),
                    h4,
                    Text(
                      widget.companyName,
                      style: context.textStyle.s10.w400.dustyBlue.roboto,
                    ),
                    h12,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: appLocalization.add_company_search_company,
                          hintStyle:
                              context.textStyle.s12.w300.bluishGray.roboto,
                          fillColor: ColorResources.cloudGray,
                          filled: true,
                          suffixIcon: const Icon(
                            Icons.search,
                            color: ColorResources.bluishGray,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    h10,
                    Divider(thickness: 1, color: Colors.grey.shade200),
                    h5,
                  ],
                ),
              ),
              if (filteredCompanies.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      "No data available",
                      style: context.textStyle.s14.w500.bluishGray.roboto,
                    ),
                  ),
                ),
              if (filteredCompanies.isNotEmpty)
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final company = filteredCompanies[index];
                    final isSelected = selectedCompanyIds.contains(company.id);

                    return AddCompanyWidget(
                      title: company.companyName ?? "",
                      subtitle: "${company.address1}, ${company.country}",
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedCompanyIds.remove(company.id);
                            selectedCompanyList.removeWhere(
                              (e) => e.companyId == company.id,
                            );
                          } else {
                            selectedCompanyIds.add(company.id!);
                            selectedCompanyList.add(
                              CompanyList(companyId: company.id!),
                            );
                          }
                        });
                        Logger.logSuccess(
                          "Selected Company IDs: ${selectedCompanyList.map((e) => e.companyId).toList()}",
                        );
                      },
                    );
                  }, childCount: filteredCompanies.length),
                ),
              if (filteredCompanies.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.getSize.width / 4,
                      vertical: 16,
                    ),
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () async {
                        final pref = sl<SharedPreferences>();
                        await pref.setStringList(
                          'companies',
                          selectedCompanyList
                              .map((e) => e.companyId.toString())
                              .toList(),
                        );
                        provider
                            .createUserCompanyMapping(
                              context: context,
                              userId: widget.userId,
                              companyList: selectedCompanyList,
                            )
                            .then((_) {
                              WidgetsBinding.instance.addPostFrameCallback(
                                (_) => context.pop(),
                              );
                            });
                      },
                      buttonText: appLocalization.save,
                      isborderEnable: false,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

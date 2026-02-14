//import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';
import 'package:mpos_beat/domain/request/create_comany_user_mapping_params.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/add_company/widgets/add_company_widget.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class CompanyUserMappingScreen extends StatefulWidget {
  const CompanyUserMappingScreen({
    super.key,
    required this.name,
    required this.companyName,
    required this.companyId,
    required this.companyData,
  });

  final String name;
  final String companyName;
  final int companyId;
  final CompanyViewList? companyData;
  @override
  State<CompanyUserMappingScreen> createState() =>
      _CompanyUserMappingScreenState();
}

class _CompanyUserMappingScreenState extends State<CompanyUserMappingScreen> {
  final TextEditingController _searchController = TextEditingController();

  final Set<int> selectedUserIds = {};
  final List<UserList> selectedUserList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = context.read<UserManagementProvider>();
      await provider.getAllUsersList(context);

      /// ✅ PRESELECT BASED ON USER MAPPING
      final userListString = widget.companyData?.userList;

      if (userListString != null && userListString.trim().isNotEmpty) {
        final ids = userListString
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .whereType<int>()
            .toSet();

        setState(() {
          selectedUserIds.addAll(ids);

          selectedUserList.addAll(ids.map((id) => UserList(userId: id)));
        });
      }

      Logger.logSuccess("Preselected User IDs: $selectedUserIds");
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    final provider = context.watch<UserManagementProvider>();
    final allUsers = provider.usersList?.userMasterList ?? [];
    final companyprovider = context.read<CompanyCreationProvider>();
    final selectedCompany = companyprovider.selectedCompany;
    final addressParts = [
      selectedCompany?.address1,
      selectedCompany?.address2,
      selectedCompany?.address3,
    ];
    final filteredAddress = addressParts
        .where((e) => e != null && e.trim().isNotEmpty)
        .toList();

    // Join with commas
    final addressText = filteredAddress.join(", ");
    final filteredUsers = allUsers.where((user) {
      final query = _searchController.text.toLowerCase();
      return query.isEmpty || (user.name ?? '').toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      body: StreamBuilder<List<UserMasterList>>(
        stream: provider.usersStream,
        builder: (context, snapshot) {
          final allUsers = snapshot.data ?? [];

          final filteredUsers = allUsers.where((user) {
            final query = _searchController.text.toLowerCase();
            return query.isEmpty ||
                (user.name ?? '').toLowerCase().contains(query);
          }).toList();

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: ColorResources.cloudGray,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: ColorResources.indigoBlue,
                  ),
                ),

                title: Text(
                  appLocalization.dashboard_add_users,
                  style: context.textStyle.s20.indigoBlue.bold.roboto,
                ),
                centerTitle: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(30),
                  child: Column(
                    children: [
                      Text(
                        widget.name,
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      SizedBox(height: 4),
                      Text(
                        addressText,
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      context.pushNamed(AppRouterConst.userCreation);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.add_circle,
                        color: ColorResources.indigoBlue,
                      ),
                    ),
                  ),
                ],
              ),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    h12,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText:
                              appLocalization.manage_user_screen_search_user,
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
                    h5,
                    Divider(thickness: 1, color: Colors.grey.shade200),
                  ],
                ),
              ),
              if (filteredUsers.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      "No users available",
                      style: context.textStyle.s14.w500.bluishGray.roboto,
                    ),
                  ),
                ),
              if (filteredUsers.isNotEmpty)
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final user = filteredUsers[index];
                    final isSelected = selectedUserIds.contains(user.id);

                    return AddCompanyWidget(
                      title: user.name ?? "",
                      subtitle: user.email ?? "",
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedUserIds.remove(user.id);
                            selectedUserList.removeWhere(
                              (e) => e.userId == user.id,
                            );
                          } else {
                            selectedUserIds.add(user.id!);
                            selectedUserList.add(UserList(userId: user.id!));
                          }
                        });
                        Logger.logSuccess(
                          "Selected User IDs: ${selectedUserList.map((e) => e.userId).toList()}",
                        );
                      },
                    );
                  }, childCount: filteredUsers.length),
                ),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.getSize.width / 4,
          vertical: 12,
        ),
        child: SafeArea(
          top: false,
          child: CustomButton(
            borderRadius: BorderRadius.circular(16),
            onTap: () async {
              provider
                  .createCompanyMapping(
                    context: context,
                    companyId: widget.companyId,
                    userList: selectedUserList,
                  )
                  .then(
                    (_) => WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.pop();
                      companyprovider.getAllCompanies(context);
                    }),
                  );

              print('selected userlist ${selectedUserList}');
            },
            buttonText: appLocalization.save,
            isborderEnable: false,
          ),
        ),
      ),
    );
  }
}

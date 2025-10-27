import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/block_user_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/no_user_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/option_item.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/unblock_user_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/list_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageUserScreen extends StatefulWidget {
  const ManageUserScreen({super.key});

  @override
  State<ManageUserScreen> createState() => _ManageUserScreenState();
}

class _ManageUserScreenState extends State<ManageUserScreen> {
  int? selectedIndex;
  int? optionIndex;

  final TextEditingController searchController = TextEditingController();
  List<UserMasterList> filteredItems = [];
  bool firstLoad = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });

    GoRouter.of(context).routerDelegate.addListener(() {
      if (ModalRoute.of(context)?.isCurrent == true) {
        context.read<UserManagementProvider>().getAllUsersList(context);
      }
    });
  }

  Future<void> _loadData() async {
    final provider = Provider.of<UserManagementProvider>(
      context,
      listen: false,
    );
    if (mounted) {
      provider
        ..getAllCompanies(context: context)
        ..getAllUsersList(context)
        ..getDesignationList(context).whenComplete(() {
          if (mounted) {
            setState(() {
              firstLoad = false; // first load finished
            });
          }
        });
    }
  }

  void _onSearchChanged() {
    final provider = context.read<UserManagementProvider>();
    final query = searchController.text.toLowerCase();

    setState(() {
      filteredItems = provider.userss.where((item) {
        return (item.name ?? '').toLowerCase().contains(query) ||
            (item.designation ?? '').toLowerCase().contains(query) ||
            (item.parentName ?? '').toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Consumer<UserManagementProvider>(
      builder: (context, provider, child) {
        final users = provider.userss;
        if (filteredItems.isEmpty && searchController.text.isEmpty) {
          filteredItems = users;
        }

        final blockUserItem =
            (selectedIndex != null && selectedIndex! < filteredItems.length)
            ? filteredItems[selectedIndex!]
            : null;
        return StreamBuilder<List<UserMasterList>>(
          stream: provider.usersStream,
          builder: (context, snapshot) {
            final users = snapshot.data ?? [];
            filteredItems = (searchController.text.isEmpty)
                ? users
                : users
                      .where(
                        (item) => item.name!.toLowerCase().contains(
                          searchController.text.toLowerCase(),
                        ),
                      )
                      .toList();

            return Scaffold(
              resizeToAvoidBottomInset: false,
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
                  appLocalizations.manage_user_screen_manage_user,
                  style: context.textStyle.s20.indigoBlue.bold.roboto,
                ),
                centerTitle: true,
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
                bottom: PreferredSize(
                  preferredSize: Size(MediaQuery.sizeOf(context).width, 85),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        h10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomTextField(
                            controller: searchController,
                            hint:
                                appLocalizations.manage_user_screen_search_user,
                            suffixIcon: const Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.search,
                                color: ColorResources.bluishGray,
                                size: 24,
                              ),
                            ),
                            backgroundColor: ColorResources.lightGray,
                            borderRadius: 12,
                            hintColor: ColorResources.silverGray,
                            borderColor: ColorResources.transparent,
                          ),
                        ),
                        h8,
                        Divider(
                          thickness: 1,
                          color: ColorResources.black.withValues(alpha: 0.1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: provider.isLoading && firstLoad
                  ? const Center(child: CircularProgressIndicator())
                  : CustomScrollView(
                      slivers: [
                        if (filteredItems.isNotEmpty)
                          SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final item = filteredItems[index];
                              final isSelected = index == selectedIndex;
                              return GestureDetector(
                                onTap: () async {
                                  final companies = item.companyList;
                                  final List<int> companyIntList =
                                      companies
                                          ?.split(',')
                                          .map((e) => int.tryParse(e))
                                          .whereType<int>()
                                          .toList() ??
                                      [];

                                  final pref = sl<SharedPreferences>();
                                  await pref.setStringList(
                                    'companies',
                                    companyIntList
                                        .map((e) => e.toString())
                                        .toList(),
                                  );
                                  final List<String>? storedList = pref
                                      .getStringList('companies');
                                  final List<int> loadedCompanies =
                                      storedList
                                          ?.map((e) => int.tryParse(e))
                                          .whereType<int>()
                                          .toList() ??
                                      [];
                                  Logger.logInfo(loadedCompanies);
                                  if (item.isBlocked) {
                                    setState(() => selectedIndex = index);
                                    CustomDialog.showBottomCustomDialog(
                                      chid: Builder(
                                        builder: (context) {
                                          return UnblockUserWidget(
                                            onConfirm: () {
                                              provider.unblockUser(
                                                context: context,
                                                userId:
                                                    provider
                                                        .usersList
                                                        ?.userMasterList[selectedIndex!]
                                                        .id ??
                                                    0,
                                              );
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    setState(() => selectedIndex = index);
                                  }
                                },
                                child: ListCard(
                                  suffixWidget: InkWell(
                                    onTap: (item.isBlocked)
                                        ? () {}
                                        : () async {
                                            final companies = item.companyList;
                                            final List<int> companyIntList =
                                                companies
                                                    ?.split(',')
                                                    .map((e) => int.tryParse(e))
                                                    .whereType<int>()
                                                    .toList() ??
                                                [];

                                            final pref =
                                                sl<SharedPreferences>();

                                            await pref.setStringList(
                                              'companies',
                                              companyIntList
                                                  .map((e) => e.toString())
                                                  .toList(),
                                            );
                                            final List<String>? storedList =
                                                pref.getStringList('companies');
                                            final List<int> loadedCompanies =
                                                storedList
                                                    ?.map(
                                                      (e) => int.tryParse(e),
                                                    )
                                                    .whereType<int>()
                                                    .toList() ??
                                                [];
                                            Logger.logInfo(loadedCompanies);
                                            setState(() {
                                              selectedIndex = index;
                                            });
                                            FocusScope.of(
                                              context,
                                            ).requestFocus(FocusNode());

                                            CustomDialog.showBottomCustomDialog(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 16,
                                                  ),
                                              chid: StatefulBuilder(
                                                builder: (context, setStateDialog) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        OptionItem(
                                                          index: 0,
                                                          selectedIndex:
                                                              optionIndex,
                                                          title: appLocalizations
                                                              .manage_user_screen_edit_user,
                                                          icon: Icons
                                                              .edit_outlined,
                                                          onTap: (i) {
                                                            setStateDialog(
                                                              () =>
                                                                  optionIndex =
                                                                      i,
                                                            );
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                            setStateDialog(
                                                              () =>
                                                                  optionIndex =
                                                                      -1,
                                                            );
                                                            context.pushNamed(
                                                              AppRouterConst
                                                                  .userCreation,
                                                              extra: {
                                                                "isEdit": true,
                                                                "user": item,
                                                              },
                                                            );
                                                            Logger.logSuccess(
                                                              "UserData : ${item.toJson()}",
                                                            );
                                                          },
                                                        ),
                                                        const CustomDivider(),
                                                        OptionItem(
                                                          index: 1,
                                                          selectedIndex:
                                                              optionIndex,
                                                          title: appLocalizations
                                                              .manage_user_screen_reset_password,
                                                          icon: Icons.refresh,
                                                          onTap: (i) {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                            context.pushNamed(
                                                              AppRouterConst
                                                                  .resetPassword,
                                                              extra:
                                                                  selectedIndex,
                                                            );
                                                          },
                                                        ),
                                                        const CustomDivider(),
                                                        OptionItem(
                                                          index: 2,
                                                          selectedIndex:
                                                              optionIndex,
                                                          title: appLocalizations
                                                              .manage_user_screen_block_user,
                                                          icon: Icons.pan_tool,
                                                          onTap: (i) {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                            CustomDialog.showBottomCustomDialog(
                                                              chid: Builder(
                                                                builder: (dialogContext) {
                                                                  return BlockUserWidget(
                                                                    onBlock: () {
                                                                      // provider.blockUser(
                                                                      //   item.id,
                                                                      // );
                                                                      provider.blockUser(
                                                                        context:
                                                                            context,
                                                                        userId:
                                                                            provider.usersList?.userMasterList[selectedIndex!].id ??
                                                                            0,
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        const CustomDivider(),
                                                        OptionItem(
                                                          index: 3,
                                                          selectedIndex:
                                                              optionIndex,
                                                          title: appLocalizations
                                                              .manage_user_screen_user_settings,
                                                          icon: Icons.settings,
                                                          onTap: (i) {
                                                            final userId =
                                                                provider
                                                                    .usersList
                                                                    ?.userMasterList[selectedIndex!]
                                                                    .id
                                                                    .toString() ??
                                                                "";
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                            context.pushNamed(
                                                              AppRouterConst
                                                                  .userSettings,
                                                              extra: userId,
                                                            );
                                                          },
                                                        ),

                                                        const CustomDivider(),
                                                        OptionItem(
                                                          index: 4,
                                                          selectedIndex:
                                                              optionIndex,
                                                          title: appLocalizations
                                                              .manage_user_screen_add_company,
                                                          icon: Icons.settings,
                                                          onTap: (i) {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                            final userId =
                                                                filteredItems[index]
                                                                    .id ??
                                                                0;
                                                            final companiesList =
                                                                provider
                                                                    .companiesList
                                                                    ?.companyViewList ??
                                                                [];

                                                            context.pushNamed(
                                                              AppRouterConst
                                                                  .addCompany,
                                                              extra: {
                                                                "name": provider
                                                                    .usersList
                                                                    ?.userMasterList[selectedIndex!]
                                                                    .username,
                                                                "companyName":
                                                                    companiesList
                                                                        .isNotEmpty
                                                                    ? "${companiesList.first.mailingName ?? ""},${companiesList.first.country ?? ""}"
                                                                    : "",
                                                                "company": provider
                                                                    .companiesList,
                                                                "userId":
                                                                    userId,
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: isSelected
                                          ? ColorResources.amber
                                          : ColorResources.dustyBlue,
                                      child: const Icon(
                                        Icons.settings,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  isSelected: isSelected,
                                  item: item,
                                  index: index,
                                  isBlocked: item.isBlocked,
                                ),
                              );
                            }, childCount: filteredItems.length),
                          ),
                        if (filteredItems.isEmpty && !provider.isLoading)
                          const SliverFillRemaining(
                            hasScrollBody: false,
                            child: NoUserWidget(),
                          ),
                      ],
                    ),
            );
          },
        );
      },
    );
  }
}

class UserModel {
  String id;
  String name;
  String phone;
  String email;
  String password;
  String whatsAppNumber;
  String designation;
  String reportingTo;
  bool isBlocked;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.whatsAppNumber,
    required this.designation,
    required this.reportingTo,
    this.isBlocked = false,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? password,
    String? whatsAppNumber,
    String? designation,
    String? reportingTo,
    bool? isBlocked,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
      designation: designation ?? this.designation,
      reportingTo: reportingTo ?? this.reportingTo,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'email': email,
    'password': password,
    'whatsAppNumber': whatsAppNumber,
    'designation': designation,
    'reportingTo': reportingTo,
    'isBlocked': isBlocked,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as String,
    name: json['name'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    email: json['email'] as String? ?? '',
    password: json['password'] as String? ?? '',
    whatsAppNumber: json['whatsAppNumber'] as String? ?? '',
    designation: json['designation'] as String? ?? '',
    reportingTo: json['reportingTo'] as String? ?? '',
    isBlocked: json['isBlocked'] as bool? ?? false,
  );
}

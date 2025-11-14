import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';
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
  bool firstLoad = true;
  GoRouterDelegate? routerDelegate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routerDelegate ??= GoRouter.of(context).routerDelegate;
    routerDelegate?.addListener(_routerListener);
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadData());
  }

  @override
  void dispose() {
    routerDelegate?.removeListener(_routerListener);
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _routerListener() {
    if (!mounted) return;
    final route = ModalRoute.of(context);
    if (route != null && route.isCurrent) {
      context.read<UserManagementProvider>().getAllUsersList(context);
    }
  }

  Future<void> _loadData() async {
    final provider = context.read<UserManagementProvider>();
    await provider
        .getAllCompanies(context: context)
        .then((_) => provider.getAllUsersList(context))
        .then((_) => provider.getDesignationList(context))
        .whenComplete(() {
          if (!mounted) return;
          setState(() => firstLoad = false);
        });
  }

  void _onSearchChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.pushReplacementNamed(AppRouterConst.adminDashboard);
        }
      },
      child: Consumer<UserManagementProvider>(
        builder: (context, provider, child) {
          return StreamBuilder<List<UserMasterList>>(
            stream: provider.usersStream,
            builder: (context, snapshot) {
              final users = snapshot.data ?? [];
              final query = searchController.text.toLowerCase();

              final filteredItems = users.where((item) {
                return query.isEmpty ||
                    (item.name ?? '').toLowerCase().contains(query) ||
                    (item.designation ?? '').toLowerCase().contains(query) ||
                    (item.parentName ?? '').toLowerCase().contains(query);
              }).toList();

              return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  backgroundColor: ColorResources.cloudGray,
                  leading: IconButton(
                    onPressed: () => context.pop(),
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
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomTextField(
                              controller: searchController,
                              hint: appLocalizations
                                  .manage_user_screen_search_user,
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
                          const SizedBox(height: 8),
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
                                    await _handleUserTap(item, index, provider);
                                  },
                                  child: ListCard(
                                    suffixWidget: InkWell(
                                      onTap: item.isBlocked
                                          ? null
                                          : () async {
                                              await _showUserOptionsDialog(
                                                context,
                                                index,
                                                item,
                                                provider,
                                                appLocalizations,
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
                                    // item: item,
                                    title: item.name ?? '',
                                    subTitle: item.designation,
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
      ),
    );
  }

  Future<void> _handleUserTap(
    UserMasterList item,
    int index,
    UserManagementProvider provider,
  ) async {
    final companies = (item.companyList ?? '')
        .split(',')
        .map((e) => int.tryParse(e))
        .whereType<int>()
        .toList();

    final prefs = sl<SharedPreferences>();
    await prefs.setStringList(
      'companies',
      companies.map((e) => e.toString()).toList(),
    );

    Logger.logInfo(companies);

    if (!mounted) return;

    if (item.isBlocked) {
      setState(() => selectedIndex = index);
      CustomDialog.showBottomCustomDialog(
        chid: Builder(
          builder: (context) {
            return UnblockUserWidget(
              onConfirm: () {
                provider.unblockUser(context: context, userId: item.id ?? 0);
                Navigator.pop(context);
              },
            );
          },
        ),
      );
    } else {
      setState(() => selectedIndex = index);
    }
  }

  Future<void> _showUserOptionsDialog(
    BuildContext context,
    int index,
    UserMasterList item,
    UserManagementProvider provider,
    AppLocalizations appLocalizations,
  ) async {
    setState(() => selectedIndex = index);
    FocusScope.of(context).unfocus();

    CustomDialog.showBottomCustomDialog(
      padding: const EdgeInsets.symmetric(vertical: 16),
      chid: StatefulBuilder(
        builder: (context, setStateDialog) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OptionItem(
                  index: 0,
                  selectedIndex: optionIndex,
                  title: appLocalizations.manage_user_screen_edit_user,
                  icon: AppAssets.editIcon,
                  onTap: (i) {
                    Navigator.pop(context);
                    context.pushNamed(
                      AppRouterConst.userCreation,
                      extra: {"isEdit": true, "user": item},
                    );
                    Logger.logSuccess("UserData : ${item.toJson()}");
                  },
                ),
                const CustomDivider(),
                OptionItem(
                  index: 1,
                  selectedIndex: optionIndex,
                  title: appLocalizations.manage_user_screen_reset_password,
                  icon: AppAssets.refresh,
                  onTap: (i) {
                    Navigator.pop(context);
                    context.pushNamed(
                      AppRouterConst.resetPassword,
                      extra: selectedIndex,
                    );
                  },
                ),
                const CustomDivider(),
                OptionItem(
                  index: 2,
                  selectedIndex: optionIndex,
                  title: appLocalizations.manage_user_screen_block_user,
                  icon: AppAssets.palm,
                  onTap: (i) {
                    Navigator.pop(context);
                    CustomDialog.showBottomCustomDialog(
                      chid: Builder(
                        builder: (dialogContext) {
                          return BlockUserWidget(
                            onBlock: () {
                              provider.blockUser(
                                context: context,
                                userId: item.id ?? 0,
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
                  selectedIndex: optionIndex,
                  title: appLocalizations.manage_user_screen_user_settings,
                  icon: AppAssets.settings,
                  onTap: (i) {
                    final userId = (item.id ?? 0).toString();
                    Navigator.pop(context);
                    context.pushNamed(
                      AppRouterConst.userSettings,
                      extra: userId,
                    );
                  },
                ),
                const CustomDivider(),
                OptionItem(
                  index: 4,
                  selectedIndex: optionIndex,
                  title: appLocalizations.manage_user_screen_add_company,
                  icon: AppAssets.addIcon,
                  onTap: (i) {
                    Navigator.pop(context);
                    final companiesList =
                        provider.companiesList?.companyViewList ?? [];

                    context.pushNamed(
                      AppRouterConst.addCompany,
                      extra: {
                        "name": item.username,
                        "companyName": companiesList.isNotEmpty
                            ? "${companiesList.first.mailingName ?? ""}, ${companiesList.first.country ?? ""}"
                            : "",
                        "company": provider.companiesList,
                        "userId": item.id ?? 0,
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

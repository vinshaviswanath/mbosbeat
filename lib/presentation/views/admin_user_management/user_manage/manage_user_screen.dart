import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/block_user_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/no_user_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/option_item.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/unblock_user_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/list_card.dart';

class ManageUserScreen extends StatefulWidget {
  const ManageUserScreen({super.key});

  @override
  State<ManageUserScreen> createState() => _ManageUserScreenState();
}

class _ManageUserScreenState extends State<ManageUserScreen> {
  int? selectedIndex;
  int? optionIndex;

  final TextEditingController searchController = TextEditingController();
  List<UserModel> filteredItems = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final provider = context.read<UserManagementProvider>();
    final query = searchController.text.toLowerCase();

    setState(() {
      filteredItems = provider.users.where((item) {
        return item.name.toLowerCase().contains(query) ||
            item.designation.toLowerCase().contains(query) ||
            item.reportingTo.toLowerCase().contains(query);
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
        final users = provider.users;
        if (filteredItems.isEmpty && searchController.text.isEmpty) {
          filteredItems = users;
        }

        final blockUserItem =
            (selectedIndex != null && selectedIndex! < filteredItems.length)
            ? filteredItems[selectedIndex!]
            : null;

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
                        hint: appLocalizations.manage_user_screen_search_user,
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
          body: CustomScrollView(
            slivers: [
              if (filteredItems.isNotEmpty)
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = filteredItems[index];
                    final isSelected = index == selectedIndex;

                    return GestureDetector(
                      onTap: () {
                        if (item.isBlocked) {
                          CustomDialog.showBottomCustomDialog(
                            chid: Builder(
                              builder: (context) {
                                return UnblockUserWidget(
                                  onConfirm: () {
                                    provider.unblockUser(item.id);
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
                          onTap: (blockUserItem?.isBlocked ?? false)
                              ? null
                              : () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(FocusNode());

                                  CustomDialog.showBottomCustomDialog(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    chid: StatefulBuilder(
                                      builder: (context, setStateDialog) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              OptionItem(
                                                index: 0,
                                                selectedIndex: optionIndex,
                                                title: appLocalizations
                                                    .manage_user_screen_edit_user,
                                                icon: Icons.edit_outlined,
                                                onTap: (i) {
                                                  setStateDialog(
                                                    () => optionIndex = i,
                                                  );
                                                  Navigator.pop(context);
                                                  setStateDialog(
                                                    () => optionIndex = -1,
                                                  );
                                                  context.pushNamed(
                                                    AppRouterConst.userCreation,
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
                                              buildDivider(),
                                              OptionItem(
                                                index: 1,
                                                selectedIndex: optionIndex,
                                                title: appLocalizations
                                                    .manage_user_screen_reset_password,
                                                icon: Icons.refresh,
                                                onTap: (i) {
                                                  Navigator.pop(context);
                                                  context.pushNamed(
                                                    AppRouterConst
                                                        .resetPassword,
                                                  );
                                                },
                                              ),
                                              buildDivider(),
                                              OptionItem(
                                                index: 2,
                                                selectedIndex: optionIndex,
                                                title: appLocalizations
                                                    .manage_user_screen_block_user,
                                                icon: Icons.pan_tool,
                                                onTap: (i) {
                                                  Navigator.pop(context);
                                                  CustomDialog.showBottomCustomDialog(
                                                    chid: Builder(
                                                      builder: (dialogContext) {
                                                        return BlockUserWidget(
                                                          onBlock: () {
                                                            provider.blockUser(
                                                              item.id,
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                              buildDivider(),
                                              OptionItem(
                                                index: 3,
                                                selectedIndex: optionIndex,
                                                title: appLocalizations
                                                    .manage_user_screen_user_settings,
                                                icon: Icons.settings,
                                                onTap: (i) {
                                                  Navigator.pop(context);
                                                  context.pushNamed(
                                                    AppRouterConst.userSettings,
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
              if (filteredItems.isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: NoUserWidget(),
                ),
            ],
          ),
        );
      },
    );
  }
}

Widget buildDivider() {
  return const Divider(height: 1, color: Color(0xFFE0E0E0));
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

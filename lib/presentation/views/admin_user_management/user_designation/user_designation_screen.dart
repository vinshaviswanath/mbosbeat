import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/add_designation_widget.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/widgets/activate_user_designation_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/widgets/deactivate_user_designation_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/widgets/delete_user_designation_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/option_item.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/widgets/user_designation_widget.dart';

class UserDesignationScreen extends StatefulWidget {
  const UserDesignationScreen({super.key});

  @override
  State<UserDesignationScreen> createState() => _UserDesignationScreenState();
}

class _UserDesignationScreenState extends State<UserDesignationScreen> {
  int selectedIndex = -1;
  int? optionIndex;

  final designationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Consumer<UserManagementProvider>(
      builder: (context, provider, _) {
        final items = provider.designations;

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
              appLocalization.user_designation_screen_all_designation,
              style: context.textStyle.s20.dustyBlue.bold.roboto,
            ),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  CustomDialog.showBottomCustomDialog(
                    chid: AddDesignationWidget(
                      designationController: designationController,
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.add_circle,
                    size: 24,
                    color: ColorResources.indigoBlue,
                  ),
                ),
              ),
            ],
          ),
          body: items.isEmpty
              ? Center(
                  child: Text(
                    appLocalization
                        .user_designation_screen_no_designation_added,
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final item = items[index];
                        final isSelected = index == selectedIndex;

                        return GestureDetector(
                          child: UserDesignationWidget(
                            backgroundColor: ColorResources.snowBlue.withValues(
                              alpha: 0.5,
                            ),
                            suffixWidget: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                                FocusScope.of(
                                  context,
                                ).requestFocus(FocusNode());

                                if (item.status == "Inactive") {
                                  CustomDialog.showBottomCustomDialog(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    chid: ActivateUserDesignationWidget(
                                      onActivate: () {
                                        provider.activateDesignation(index);
                                        setState(() {
                                          item.status = "Active";
                                        });
                                      },
                                    ),
                                  );
                                } else {
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                    ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    w24,
                                                    Column(
                                                      children: [
                                                        Text(
                                                          item.userName,
                                                          style: context
                                                              .textStyle
                                                              .s12
                                                              .w500
                                                              .roboto
                                                              .indigoBlue,
                                                        ),
                                                        h4,
                                                        Text(
                                                          item.status,
                                                          style: context
                                                              .textStyle
                                                              .s10
                                                              .w400
                                                              .roboto
                                                              .dustyBlue,
                                                        ),
                                                      ],
                                                    ),
                                                    InkWell(
                                                      onTap: () =>
                                                          Navigator.pop(
                                                            context,
                                                          ),
                                                      child: const CircleAvatar(
                                                        radius: 12,
                                                        child: Icon(
                                                          Icons.close,
                                                          size: 16,
                                                          color: ColorResources
                                                              .dustyBlue,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              h20,
                                              OptionItem(
                                                index: 0,
                                                selectedIndex: optionIndex,
                                                title: appLocalization
                                                    .user_designation_screen_edit,
                                                icon: Icons.edit_outlined,
                                                onTap: (i) {
                                                  setStateDialog(
                                                    () => optionIndex = i,
                                                  );
                                                  Navigator.pop(context);
                                                  setStateDialog(
                                                    () => optionIndex = -1,
                                                  );
                                                  designationController.text =
                                                      item.userName;

                                                  CustomDialog.showBottomCustomDialog(
                                                    chid: AddDesignationWidget(
                                                      designationController:
                                                          designationController,
                                                      isEdit: true,
                                                      onSave: (newName) {
                                                        provider
                                                            .editDesignation(
                                                              index,
                                                              newName,
                                                            );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                              const CustomDivider(),
                                              OptionItem(
                                                index: 1,
                                                selectedIndex: optionIndex,
                                                title: appLocalization
                                                    .user_designation_screen_delete,
                                                icon: Icons.delete,
                                                onTap: (i) {
                                                  setStateDialog(
                                                    () => optionIndex = i,
                                                  );
                                                  Navigator.pop(context);
                                                  setStateDialog(
                                                    () => optionIndex = -1,
                                                  );
                                                  CustomDialog.showBottomCustomDialog(
                                                    chid: Builder(
                                                      builder: (dialogContext) {
                                                        return DeleteUserDesignationWidget(
                                                          onDelete: () {
                                                            provider
                                                                .deleteDesignation(
                                                                  index,
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
                                                index: 2,
                                                selectedIndex: optionIndex,
                                                title: appLocalization
                                                    .user_designation_screen_deactivate,
                                                icon: Icons.pan_tool,
                                                onTap: (i) {
                                                  setStateDialog(
                                                    () => optionIndex = i,
                                                  );
                                                  Navigator.pop(context);
                                                  setStateDialog(
                                                    () => optionIndex = -1,
                                                  );
                                                  CustomDialog.showBottomCustomDialog(
                                                    chid: Builder(
                                                      builder: (dialogContext) {
                                                        return DeactivateUserDesignationWidget(
                                                          onDeactivate: () {
                                                            provider
                                                                .deactivateDesignation(
                                                                  index,
                                                                );
                                                            setState(() {
                                                              item.status =
                                                                  "Inactive";
                                                            });
                                                          },
                                                        );
                                                      },
                                                    ),
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
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: ColorResources.indigoBlue,
                                ),
                                child: Text(
                                  item.status == "Inactive"
                                      ? "Activate"
                                      : "Edit",
                                  style:
                                      context.textStyle.s10.w400.white.roboto,
                                ),
                              ),
                            ),
                            isSelected: isSelected,
                            item: item,
                            index: index,
                          ),
                        );
                      }, childCount: items.length),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class UserDesignationDetails {
  String userName;
  String status;

  UserDesignationDetails({required this.userName, required this.status});

  Map<String, dynamic> toJson() => {"userName": userName, "status": status};

  factory UserDesignationDetails.fromJson(Map<String, dynamic> json) {
    return UserDesignationDetails(
      userName: json["userName"] ?? "",
      status: json["status"] ?? "Active",
    );
  }
}

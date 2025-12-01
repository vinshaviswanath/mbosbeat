import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/add_designation_widget.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/widgets/activate_user_designation_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/widgets/deactivate_user_designation_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/widgets/delete_user_designation_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/widgets/shimmer/uder_designation_shimmer.dart';
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
        final items = provider.designationList?.userDesignationList;

        Logger.logSuccess(
          "DESIGNATION ::: ${provider.designationList?.toJson()}",
        );

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
                      isEdit: false,
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
          body: provider.isLoading
              ? const UserDesignationShimmer()
              : (items == null || items.isEmpty)
              ? Center(
                  child: Text(
                    appLocalization
                        .user_designation_screen_no_designation_added,
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final item = provider
                            .designationList
                            ?.userDesignationList[index];
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

                                if (item?.active == 0) {
                                  CustomDialog.showBottomCustomDialog(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    chid: ActivateUserDesignationWidget(
                                      designation: item?.name ?? "",
                                      onActivate: () {
                                        // provider.activateDesignation(index);
                                        // setState(() {
                                        //   item.status = "Active";
                                        // });
                                        provider.designationActivation(
                                          context,
                                          designationId: item?.id ?? 0,
                                        );
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
                                            color: ColorResources.white,
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
                                                          item?.name ?? '',
                                                          style: context
                                                              .textStyle
                                                              .s12
                                                              .w500
                                                              .roboto
                                                              .indigoBlue,
                                                        ),
                                                        h4,
                                                        Text(
                                                          item?.active == 0
                                                              ? 'Inactive'
                                                              : 'Active',
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
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            ColorResources
                                                                .bluishGray
                                                                .withValues(
                                                                  alpha: 0.15,
                                                                ),
                                                        radius: 12,
                                                        child: const Icon(
                                                          Icons.close,
                                                          size: 12,
                                                          color: ColorResources
                                                              .bluishGray,
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
                                                icon: AppAssets.editIcon,
                                                onTap: (i) {
                                                  setStateDialog(
                                                    () => optionIndex = i,
                                                  );
                                                  Navigator.pop(context);
                                                  setStateDialog(
                                                    () => optionIndex = -1,
                                                  );
                                                  designationController.text =
                                                      item?.name ?? '';

                                                  CustomDialog.showBottomCustomDialog(
                                                    chid: AddDesignationWidget(
                                                      index: index,
                                                      designationController:
                                                          designationController,
                                                      isEdit: true,
                                                      // onSave: (newName) {
                                                      //   provider
                                                      //       .editDesignation(
                                                      //         index,
                                                      //         newName,
                                                      //       );
                                                      // },
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
                                                icon: AppAssets.refresh,
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
                                                          designation:
                                                              item?.name ?? "",
                                                          onDelete: () {
                                                            provider
                                                                .deleteDesignation(
                                                                  context,
                                                                  designationId:
                                                                      item?.id ??
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
                                                index: 2,
                                                selectedIndex: optionIndex,
                                                title: appLocalization
                                                    .user_designation_screen_deactivate,
                                                icon: AppAssets.palm,
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
                                                          designation:
                                                              item?.name ?? "",
                                                          onDeactivate: () {
                                                            Logger.logSuccess(
                                                              "IDDDDDDDDD :: ${item?.id}",
                                                            );
                                                            // provider
                                                            //     .deactivateDesignation(
                                                            //       index,
                                                            //     );
                                                            // setState(() {
                                                            //   item.status =
                                                            //       "Inactive";
                                                            // });
                                                            provider
                                                                .designationdeactivation(
                                                                  context,
                                                                  designationId:
                                                                      item?.id ??
                                                                      0,
                                                                )
                                                                .then((
                                                                  response,
                                                                ) {
                                                                  // if (!mounted)
                                                                  //   return; // ✅ ensures widget still active

                                                                  // WidgetsBinding.instance.addPostFrameCallback((
                                                                  //   _,
                                                                  // ) {
                                                                  //   if (!mounted)
                                                                  //     return; // double safety
                                                                  //   ScaffoldMessenger.of(
                                                                  //     context,
                                                                  //   ).showSnackBar(
                                                                  //     SnackBar(
                                                                  //       content: Text(
                                                                  //         "${response?.message}",
                                                                  //         textAlign:
                                                                  //             TextAlign.center,
                                                                  //       ),
                                                                  //       behavior:
                                                                  //           SnackBarBehavior.floating,
                                                                  //       shape: RoundedRectangleBorder(
                                                                  //         borderRadius: BorderRadius.circular(
                                                                  //           16,
                                                                  //         ),
                                                                  //       ),
                                                                  //       margin: const EdgeInsets.symmetric(
                                                                  //         horizontal:
                                                                  //             16,
                                                                  //         vertical:
                                                                  //             8,
                                                                  //       ),
                                                                  //     ),
                                                                  //   );
                                                                  // });
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
                                  item?.active == 0 ? "Activate" : "Edit",
                                  style:
                                      context.textStyle.s10.w400.white.roboto,
                                ),
                              ),
                            ),
                            isSelected: isSelected,
                            item: item!,
                            index: index,
                          ),
                        );
                      }, childCount: items?.length),
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

import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/common/widgets/activate_widget.dart';
import 'package:mpos_beat/presentation/common/widgets/deactivate_widget.dart';
import 'package:mpos_beat/presentation/common/widgets/delete_widget.dart';
import 'package:mpos_beat/presentation/views/route_wise_screen/widgets/add_route.dart';
import 'package:mpos_beat/presentation/views/route_wise_screen/widgets/route_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/option_item.dart';

class RouteWiseScreen extends StatefulWidget {
  const RouteWiseScreen({super.key});

  @override
  State<RouteWiseScreen> createState() => _RouteWiseScreenState();
}

class _RouteWiseScreenState extends State<RouteWiseScreen> {
  int selectedIndex = -1;
  int? optionIndex;

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        final items = provider.routes;

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
              "Routes",
              style: context.textStyle.s20.dustyBlue.bold.roboto,
            ),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  CustomDialog.showBottomCustomDialog(chid: const AddRoute());
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
                    "No routes added yet",
                    style:context.textStyle.s12.w500.roboto,
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final item = items[index];
                        final isSelected = index == selectedIndex;

                        return GestureDetector(
                          child: RouteWidget(
                            backgroundColor: ColorResources.indigoBlue
                                .withValues(alpha: 0.02),
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
                                    chid: ActivateWidget(
                                      onActivate: () {
                                        provider.activateRoute(index);
                                        setState(() {
                                          item.status = "Active";
                                        });
                                      },
                                      headingText: appLocalization
                                          .activate_route_widget_activate_route,
                                      subHeading: appLocalization
                                          .activate_route_widget_are_you_sure,
                                      snackBarMessage: appLocalization
                                          .activate_route_widget_route_activated,
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
                                                          item.routeName,
                                                          style: context
                                                              .textStyle
                                                              .s14
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
                                                              .oceanBlue,
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

                                                  CustomDialog.showBottomCustomDialog(
                                                    chid: AddRoute(
                                                      isEdit: true,
                                                      index: selectedIndex,
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
                                                        return DeleteWidget(
                                                          onDelete: () {
                                                            provider
                                                                .deleteRoute(
                                                                  index,
                                                                );
                                                          },
                                                          headingText:
                                                              appLocalization
                                                                  .delete_route_widget_delete_route,
                                                          subHeading:
                                                              appLocalization
                                                                  .delete_route_widget_are_you_sure,
                                                          snackBarMessage:
                                                              appLocalization
                                                                  .delete_route_widget_route_removed,
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
                                                        return DeactivateWidget(
                                                          onDeactivate: () {
                                                            provider
                                                                .deactivateRoute(
                                                                  index,
                                                                );
                                                            setState(() {
                                                              item.status =
                                                                  "Inactive";
                                                            });
                                                          },
                                                          headingText:
                                                              appLocalization
                                                                  .deactivate_route_widget_deactivate_route,
                                                          subHeading:
                                                              appLocalization
                                                                  .deactivate_route_widget_are_you_sure,
                                                          snackBarMessage:
                                                              appLocalization
                                                                  .deactivate_route_widget_route_deactivated,
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
                                                title: appLocalization
                                                    .route_wise_screen_voucher_type_settings,
                                                // icon: Icons.pan_tool,
                                                onTap: (i) {
                                                  context.pushNamed(
                                                    AppRouterConst
                                                        .companyCreationScreen,
                                                    extra: 1,
                                                  );
                                                  // setStateDialog(
                                                  //   () => optionIndex = i,
                                                  // );
                                                  // Navigator.pop(context);
                                                  // setStateDialog(
                                                  //   () => optionIndex = -1,
                                                  // );
                                                  // CustomDialog.showBottomCustomDialog(
                                                  //   chid: Builder(
                                                  //     builder: (dialogContext) {
                                                  //       return DeactivateVehicleWidget(
                                                  //         onDeactivate: () {
                                                  //           provider
                                                  //               .deactivateVehicle(
                                                  //                 index,
                                                  //               );
                                                  //           setState(() {
                                                  //             item.status =
                                                  //                 "Inactive";
                                                  //           });
                                                  //         },
                                                  //       );
                                                  //     },
                                                  //   ),
                                                  // );
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

class RouteDetails {
  String routeName;
  String routeCode;
  String status;

  RouteDetails({
    required this.routeName,
    required this.routeCode,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
    "routeName": routeName,
    "routeCode": routeCode,
    "status": status,
  };

  factory RouteDetails.fromJson(Map<String, dynamic> json) {
    return RouteDetails(
      routeName: json["routeName"] ?? "",
      routeCode: json["routeCode"] ?? "",
      status: json["status"] ?? "Active",
    );
  }
}

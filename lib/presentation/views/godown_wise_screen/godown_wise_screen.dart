import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/common/widgets/activate_widget.dart';
import 'package:mpos_beat/presentation/views/godown_wise_screen/widgets/add_vehicle.dart';
import 'package:mpos_beat/presentation/common/widgets/deactivate_widget.dart';
import 'package:mpos_beat/presentation/common/widgets/delete_widget.dart';
import 'package:mpos_beat/presentation/views/godown_wise_screen/widgets/vehicle_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/widgets/activate_user_designation_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/widgets/user_designation_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/option_item.dart';

class GodownWiseScreen extends StatefulWidget {
  const GodownWiseScreen({super.key});

  @override
  State<GodownWiseScreen> createState() => _GodownWiseScreenState();
}

class _GodownWiseScreenState extends State<GodownWiseScreen> {
  int selectedIndex = -1;
  int? optionIndex;

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        final items = provider.vehicles;

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
              appLocalization.godown_wise_screen_vehicle,
              style: context.textStyle.s20.dustyBlue.bold.roboto,
            ),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  CustomDialog.showBottomCustomDialog(chid: const AddVehicle());
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
                    appLocalization.godown_wise_screen_no_vehicle,
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
                          child: VehicleWidget(
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
                                        provider.activateVehicle(index);
                                        setState(() {
                                          item.status = "Active";
                                        });
                                      },
                                      headingText: appLocalization
                                          .activate_vehicle_widget_activate_vehicle,
                                      subHeading: appLocalization
                                          .activate_vehicle_widget_are_you_sure,
                                      snackBarMessage: appLocalization
                                          .activate_vehicle_widget_vehicle_activated,
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
                                                          item.vehicleName,
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
                                                    chid: AddVehicle(
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
                                                                .deleteVehicle(
                                                                  index,
                                                                );
                                                          },
                                                          headingText:
                                                              appLocalization
                                                                  .delete_vehicle_widget_delete_vehicle,
                                                          subHeading:
                                                              appLocalization
                                                                  .delete_vehicle_widget_are_you_sure,
                                                          snackBarMessage:
                                                              appLocalization
                                                                  .delete_vehicle_widget_vehicle_removed,
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
                                                                .deactivateVehicle(
                                                                  index,
                                                                );
                                                            setState(() {
                                                              item.status =
                                                                  "Inactive";
                                                            });
                                                          },
                                                          headingText:
                                                              appLocalization
                                                                  .deactivate_vehicle_widget_deactivate_vehicle,
                                                          subHeading:
                                                              appLocalization
                                                                  .deactivate_vehicle_widget_are_you_sure,
                                                          snackBarMessage:
                                                              appLocalization
                                                                  .deactivate_vehicle_widget_vehicle_deactivated,
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
                                                title: "Voucher Type Settings",
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

class VehicleDetails {
  String vehicleName;
  String vehicleCode;
  String status;

  VehicleDetails({
    required this.vehicleName,
    required this.vehicleCode,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
    "vehicleName": vehicleName,
    "vehicleCode": vehicleCode,
    "status": status,
  };

  factory VehicleDetails.fromJson(Map<String, dynamic> json) {
    return VehicleDetails(
      vehicleName: json["vehicleName"] ?? "",
      vehicleCode: json["vehicleCode"] ?? "",
      status: json["status"] ?? "Active",
    );
  }
}

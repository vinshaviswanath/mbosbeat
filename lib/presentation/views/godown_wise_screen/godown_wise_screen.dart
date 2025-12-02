import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_divider.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/common/widgets/activate_widget.dart';
import 'package:mpos_beat/presentation/views/godown_wise_screen/widgets/add_vehicle.dart';
import 'package:mpos_beat/presentation/common/widgets/deactivate_widget.dart';
import 'package:mpos_beat/presentation/common/widgets/delete_widget.dart';
import 'package:mpos_beat/presentation/views/godown_wise_screen/widgets/vehicle_widget.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/option_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GodownWiseScreen extends StatefulWidget {
  const GodownWiseScreen({super.key});

  @override
  State<GodownWiseScreen> createState() => _GodownWiseScreenState();
}

class _GodownWiseScreenState extends State<GodownWiseScreen> {
  int selectedIndex = -1;
  int? optionIndex;

  @override
  void initState() {
    // final pref = sl<SharedPreferences>();
    // final companyId = pref.getInt('selected_company_id').toString();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyCreationProvider>();
      provider.getAllGodowns(context: context, companyId:  provider.selectedCompany?.id.toString() ?? '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;

    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
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
                  CustomDialog.showBottomCustomDialog(child: const AddVehicle());
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
          body: StreamBuilder<List<VehicleList>>(
            stream: provider.godownStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    appLocalization.godown_wise_screen_no_vehicle,
                    style: context.textStyle.s12.w500.dustyBlue.roboto,
                  ),
                );
              }

              final items = snapshot.data!;

              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = items[index];
                      final isSelected = index == selectedIndex;

                      return GestureDetector(
                        child: VehicleWidget(
                          backgroundColor: ColorResources.indigoBlue.withValues(
                            alpha: 0.02,
                          ),
                          suffixWidget: InkWell(
                            onTap: () {
                              setState(() => selectedIndex = index);
                              FocusScope.of(context).requestFocus(FocusNode());

                              if (item.active == 0) {
                                CustomDialog.showBottomCustomDialog(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  child: ActivateWidget(
                                    onActivate: () {
                                      provider.activateGodown(
                                        context,
                                        mid: item.id.toString(),
                                      );
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
                                  child: StatefulBuilder(
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
                                                        "${item.name}",
                                                        style: context
                                                            .textStyle
                                                            .s14
                                                            .w500
                                                            .roboto
                                                            .indigoBlue,
                                                      ),
                                                      h4,
                                                      Text(
                                                        item.active == 0
                                                            ? 'Inactive'
                                                            : 'Active',
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
                                                        Navigator.pop(context),
                                                    child: CircleAvatar(
                                                                                        backgroundColor: ColorResources.bluishGray.withValues(
                                                                                          alpha: 0.15,
                                                                                        ),
                                                                                        radius: 12,
                                                                                        child: const Icon(
                                                                                          Icons.close,
                                                                                          size: 12,
                                                                                          color: ColorResources.bluishGray,
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
                                              icon:  AppAssets.editIcon,
                                              onTap: (i) {
                                                setStateDialog(
                                                  () => optionIndex = i,
                                                );
                                                Navigator.pop(context);
                                                setStateDialog(
                                                  () => optionIndex = -1,
                                                );

                                                CustomDialog.showBottomCustomDialog(
                                                  child: AddVehicle(
                                                    isEdit: true,
                                                    index: selectedIndex,
                                                    details: item,
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
                                              icon:  AppAssets.refresh,
                                              onTap: (i) {
                                                setStateDialog(
                                                  () => optionIndex = i,
                                                );
                                                Navigator.pop(context);
                                                setStateDialog(
                                                  () => optionIndex = -1,
                                                );

                                                CustomDialog.showBottomCustomDialog(
                                                  child: Builder(
                                                    builder: (dialogContext) {
                                                      return DeleteWidget(
                                                        onDelete: () {
                                                          provider.deleteGodown(
                                                            context,
                                                            mid: item.id
                                                                .toString(),
                                                          );
                                                        },
                                                        headingText: appLocalization
                                                            .delete_vehicle_widget_delete_vehicle,
                                                        subHeading: appLocalization
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
                                              icon:  AppAssets.palm,
                                              onTap: (i) {
                                                setStateDialog(
                                                  () => optionIndex = i,
                                                );
                                                Navigator.pop(context);
                                                setStateDialog(
                                                  () => optionIndex = -1,
                                                );

                                                CustomDialog.showBottomCustomDialog(
                                                  child: Builder(
                                                    builder: (dialogContext) {
                                                      return DeactivateWidget(
                                                        onDeactivate: () {
                                                          provider
                                                              .deactivateGodown(
                                                                context,
                                                                mid: item.id
                                                                    .toString(),
                                                              );
                                                        },
                                                        headingText: appLocalization
                                                            .deactivate_vehicle_widget_deactivate_vehicle,
                                                        subHeading: appLocalization
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
                                              onTap: (i) {
                                                context.pushNamed(
                                                  AppRouterConst
                                                      .voucherSettingsScreen,
                                                  extra: {
                                                    'data': item,
                                                    'voucherModeId': item.id,
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
                                item.active == 0 ? "Activate" : "Edit",
                                style: context.textStyle.s10.w400.white.roboto,
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
              );
            },
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

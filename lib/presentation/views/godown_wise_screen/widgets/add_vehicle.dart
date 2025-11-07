import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key, this.isEdit = false, this.index, this.details});

  final bool isEdit;
  final int? index;
  final VehicleList? details;

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  late TextEditingController vehicleNameController;
  late TextEditingController vehicleCodeController;

  bool _submitted = false;
  String? vehicleNameError;
  String? vehicleCodeError;

  @override
  void initState() {
    super.initState();
    vehicleNameController = TextEditingController();
    vehicleCodeController = TextEditingController();

    if (!widget.isEdit) {
      vehicleNameController.clear();
      vehicleCodeController.clear();
    } else {
      vehicleNameController.text = widget.details?.name ?? '';
      vehicleCodeController.text = widget.details?.code ?? '';
    }
    _submitted = false;
    vehicleNameError = null;
  }

  @override
  void dispose() {
    vehicleNameController.dispose();
    vehicleCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    // final pref = sl<SharedPreferences>();
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
    final companyId = provider.selectedCompany?.id;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.isEdit
                      ? appLocalizations.add_vehicle_screen_edit_vehicle
                      : appLocalizations.add_vehicle_screen_add_vehicle,
                  style: context.textStyle.s14.w500.dustyBlue.roboto.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: context.textStyle.dustyBlue.color,
                  ),
                ),
              ],
            ),
            h12,
            Text(
              appLocalizations.add_vehicle_screen_vehicle_name,
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: appLocalizations.add_vehicle_screen_vehicle_name,
              controller: vehicleNameController,
              autovalidateMode: provider.vehicleAutovalidateMode,
              failure: provider.vehicleName.getFailure,
              onChange: provider.updateVehicleName,
              backgroundColor: ColorResources.lightGray,
              inputType: TextInputType.text,
              borderRadius: 12,
              hintColor: ColorResources.silverGray,
              borderColor: _submitted && vehicleNameError != null
                  ? ColorResources.roseRed
                  : ColorResources.transparent,
            ),
            h12,
            Text(
              appLocalizations.add_vehicle_screen_vehicle_code,
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: appLocalizations.add_vehicle_screen_vehicle_code,
              controller: vehicleCodeController,
              autovalidateMode: provider.vehicleAutovalidateMode,
              failure: provider.vehicleCode.getFailure,
              onChange: provider.updateVehicleCode,
              backgroundColor: ColorResources.lightGray,
              inputType: TextInputType.text,
              borderRadius: 12,
              hintColor: ColorResources.silverGray,
              borderColor: _submitted && vehicleCodeError != null
                  ? ColorResources.roseRed
                  : ColorResources.transparent,
            ),
            h16,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      if (widget.isEdit && widget.index != null) {
                        // Edit vehicle
                        // provider.editVehicle(
                        //   widget.index!,
                        //   vehicleNameController.text.trim(),
                        //   vehicleCodeController.text.trim(),
                        // );

                        setState(() {
                          _submitted = true;
                          vehicleNameError = null;
                          vehicleCodeError = null;

                          if (vehicleNameController.text.trim().isEmpty) {
                            vehicleNameError = "Please enter vehicle name";
                          }
                          if (vehicleCodeController.text.trim().isEmpty) {
                            vehicleCodeError = "Please enter vehicle code";
                          }
                        });
                        Logger.logSuccess(
                          "Godown EDIT ID ${provider.godownListResponse?.vehicleList[widget.index!].id}",
                        );
                        if (vehicleNameError != null &&
                            vehicleCodeError != null) {
                          return;
                        }
                        // Logger.logSuccess("Company Id :::: $companyId");
                        provider
                            .createGodown(
                              context: context,
                              userId:
                                  provider
                                      .godownListResponse
                                      ?.vehicleList[widget.index!]
                                      .id ??
                                  0,
                              companyId: companyId ?? 0,
                              code: vehicleCodeController.text,
                              name: vehicleNameController.text,
                            )
                            // provider
                            //     .addUserDesignation(
                            //       context,
                            //       designation: widget.designationController.text
                            //           .trim(),
                            //       customerId: customerId,
                            //       id:
                            //           provider
                            //               .designationList
                            //               ?.userDesignationList[widget.index]
                            //               .id
                            //               .toString() ??
                            //           "",
                            //     )
                            .then((_) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  _submitted = false;
                                  vehicleNameError = null;
                                  vehicleCodeError = null;
                                });
                                Navigator.pop(context);
                              });
                            });
                      } else {
                        // Add vehicle (with validation)
                        // provider.submitVehicle(context);
                        setState(() {
                          _submitted = true;
                          vehicleNameError = null;
                          vehicleCodeError = null;

                          if (vehicleNameController.text.trim().isEmpty) {
                            vehicleNameError = "Please enter vehicle name";
                          }
                          if (vehicleCodeController.text.trim().isEmpty) {
                            vehicleCodeError = "Please enter vehicle code";
                          }
                        });

                        if (vehicleNameError != null &&
                            vehicleCodeError != null) {
                          return;
                        }

                        Logger.logSuccess("Company Id :::: $companyId");

                        provider
                            .createGodown(
                              context: context,
                              userId: 0,
                              companyId: companyId ?? 0,
                              code: vehicleCodeController.text,
                              name: vehicleNameController.text,
                            )
                            // provider
                            //     .addUserDesignation(
                            //       context,
                            //       designation: widget.designationController.text
                            //           .trim(),
                            //       customerId: customerId,
                            //       id: "0",
                            //     )
                            .then((_) {
                              vehicleNameController.clear();
                              vehicleCodeController.clear();
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.pop(context);
                              });
                            });
                      }
                    },
                    borderRadius: BorderRadius.circular(16),
                    buttonText: appLocalizations.save,
                    textStyle: context.textStyle.s12.w500.white,
                    isborderEnable: false,
                  ),
                ),
                w12,
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      vehicleNameController.clear();
                      vehicleCodeController.clear();
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(16),
                    buttonText: appLocalizations.cancel,
                    textStyle: context.textStyle.s12.w500.white,
                    isborderEnable: false,
                  ),
                ),
              ],
            ),
            h8,
          ],
        );
      },
    );
  }
}

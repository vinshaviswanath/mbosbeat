import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/core/utils/imports.dart';

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
    vehicleCodeError = null;
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
        // final companyId = provider.selectedCompany?.id;

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
            if (_submitted && vehicleNameError != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  SvgPicture.asset(AppAssets.alertError, height: 16),
                  const SizedBox(width: 2),
                  Text(
                    vehicleNameError!,
                    style: context.textStyle.s09.roseRed.w400.roboto,
                  ),
                ],
              ),
            ],
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
            if (_submitted && vehicleCodeError != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  SvgPicture.asset(AppAssets.alertError, height: 16),
                  const SizedBox(width: 2),
                  Text(
                    vehicleCodeError!,
                    style: context.textStyle.s09.roseRed.w400.roboto,
                  ),
                ],
              ),
            ],
            h16,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
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

                      // Stop execution if there are validation errors
                      if (vehicleNameError != null ||
                          vehicleCodeError != null) {
                        return;
                      }

                      final companyId = provider.selectedCompany?.id ?? 0;
                      final vehicleName = vehicleNameController.text.trim();
                      final vehicleCode = vehicleCodeController.text.trim();

                      if (widget.isEdit && widget.index != null) {
                        // Edit vehicle
                        provider
                            .createGodown(
                              context: context,
                              userId:
                                  provider
                                      .godownListResponse
                                      ?.vehicleList[widget.index!]
                                      .id ??
                                  0,
                              companyId: companyId,
                              code: vehicleCode,
                              name: vehicleName,
                            )
                            .then((_) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  _submitted = false;
                                  vehicleNameError = null;
                                  vehicleCodeError = null;
                                });
                                if (provider.godownResponse?.status == 1) {
                                  Navigator.pop(context);
                                }
                              });
                            });
                      } else {
                        // Add new vehicle
                        provider
                            .createGodown(
                              context: context,
                              userId: 0,
                              companyId: companyId,
                              code: vehicleCode,
                              name: vehicleName,
                            )
                            .then((_) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (provider.godownResponse?.status == 1) {
                                  vehicleNameController.clear();
                                  vehicleCodeController.clear();
                                  Navigator.pop(context);
                                }
                              });
                            });
                      }
                      FocusScope.of(context).unfocus();
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
                      vehicleNameError = null;
                      vehicleCodeError = null;
                      vehicleNameController.clear();
                      vehicleCodeController.clear();
                      setState(() {});
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

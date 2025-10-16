import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key, this.isEdit = false, this.index});

  final bool isEdit;
  final int? index;

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  late TextEditingController vehicleNameController;
  late TextEditingController vehicleCodeController;

  @override
  void initState() {
    super.initState();
    final provider = context.read<CompanyCreationProvider>();
    vehicleNameController = TextEditingController(
      text: widget.isEdit && widget.index != null
          ? provider.vehicles[widget.index!].vehicleName
          : widget.isEdit == true && widget.index == null
          ? "VEHICLE 1"
          : '',
    );

    vehicleCodeController = TextEditingController(
      text: widget.isEdit && widget.index != null
          ? provider.vehicles[widget.index!].vehicleCode
          : widget.isEdit == true && widget.index == null
          ? "VEH264"
          : '',
    );
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
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
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
              borderColor: ColorResources.transparent,
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
              borderColor: ColorResources.transparent,
            ),
            h16,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.getSize.width / 4,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        if (widget.isEdit && widget.index != null) {
                          // Edit vehicle
                          provider.editVehicle(
                            widget.index!,
                            vehicleNameController.text.trim(),
                            vehicleCodeController.text.trim(),
                          );
                          Navigator.pop(context);
                        } else {
                          // Add vehicle (with validation)
                          provider.submitVehicle(context);
                        }
                        vehicleNameController.clear();
                        vehicleCodeController.clear();
                      },
                      borderRadius: BorderRadius.circular(16),
                      buttonText: appLocalizations.save,
                      textStyle: context.textStyle.s12.w500.white,
                      isborderEnable: false,
                    ),
                  ),
                ],
              ),
            ),
            h8,
          ],
        );
      },
    );
  }
}

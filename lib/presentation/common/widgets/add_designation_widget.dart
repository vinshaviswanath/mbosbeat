import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';

class AddDesignationWidget extends StatelessWidget {
  const AddDesignationWidget({
    super.key,
    required this.designationController,
    this.isEdit = false,
    this.onSave,
  });

  final TextEditingController designationController;
  final bool isEdit;
  final Function(String)? onSave;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManagementProvider>(
      builder: (context, provider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Designation",
                  style: context.textStyle.s14.w500.dustyBlue.roboto.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: context.textStyle.dustyBlue.color,
                  ),
                ),
              ],
            ),
            h12,
            Text(
              "Designation Name",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter Name",
              controller: designationController,
              autovalidateMode: provider.designationAutovalidateMode,
              failure: provider.designation.getFailure,
              onChange: (value) {
                provider.updateDesignation(value);
              },
              backgroundColor: ColorResources.lightGray,
              inputType: TextInputType.text,
              borderRadius: 12,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.transparent,
            ),
            h16,
            if (isEdit == false) ...[
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        provider.submitDesignation(context);
                        designationController.clear();
                      },
                      borderRadius: BorderRadius.circular(16),
                      buttonText: "Save",
                      isborderEnable: false,
                    ),
                  ),
                  w12,
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        provider.resetDesignation();
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(16),
                      color: ColorResources.bluishGray,
                      buttonText: "Cancel",
                      isborderEnable: false,
                    ),
                  ),
                ],
              ),
              h8,
            ],

            if (isEdit == true) ...[
              h8,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.getSize.width / 4,
                ),
                child: CustomButton(
                  onTap: () {
                    if (isEdit && onSave != null) {
                      onSave!(designationController.text.trim());
                    } else {
                      context.read<UserManagementProvider>().addDesignation(
                        designationController.text.trim(),
                      );
                    }
                    designationController.clear();
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(16),
                  buttonText: "Save",
                  isborderEnable: false,
                ),
              ),
              h8,
            ],
          ],
        );
      },
    );
  }
}

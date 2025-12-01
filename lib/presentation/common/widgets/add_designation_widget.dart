import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddDesignationWidget extends StatefulWidget {
  const AddDesignationWidget({
    super.key,
    required this.designationController,
    this.isEdit = false,
    this.onSave,
    this.index = 0,
  });

  final TextEditingController designationController;
  final bool isEdit;
  final Function(String)? onSave;
  final int index;

  @override
  State<AddDesignationWidget> createState() => _AddDesignationWidgetState();
}

bool _submitted = false;
String? designationError;

class _AddDesignationWidgetState extends State<AddDesignationWidget> {
  @override
  void initState() {
    if (!widget.isEdit) {
      widget.designationController.clear();
    }
    _submitted = false;
    designationError = null;
    super.initState();
  }

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
                  widget.isEdit ? "Edit Designation" : "Add Designation",
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
              controller: widget.designationController,
              autovalidateMode: provider.designationAutovalidateMode,
              failure: provider.designation.getFailure,
              onChange: (value) {
                provider.updateDesignation(value);
              },
              backgroundColor: ColorResources.lightGray,
              inputType: TextInputType.text,
              borderRadius: 12,
              hintColor: ColorResources.silverGray,
              borderColor: _submitted && designationError != null
                  ? ColorResources.roseRed
                  : ColorResources.transparent,
            ),
            if (_submitted && designationError != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  SvgPicture.asset(AppAssets.alertError, height: 16),
                  const SizedBox(width: 2),
                  Text(
                    designationError!,
                    style: context.textStyle.s09.roseRed.w400.roboto,
                  ),
                ],
              ),
            ],
            h16,

            if (widget.isEdit == false) ...[
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        setState(() {
                          _submitted = true;
                          designationError = null;

                          if (widget.designationController.text
                              .trim()
                              .isEmpty) {
                            designationError = "Please enter designation";
                          }
                        });

                        if (designationError != null) return;
                        final pref = sl<SharedPreferences>();
                        final customerId = pref.getInt('customerId').toString();
                        Logger.logSuccess("Cust. No :::: $customerId");
                        provider
                            .addUserDesignation(
                              context,
                              designation: widget.designationController.text
                                  .trim(),
                              customerId: customerId,
                              id: "0",
                            )
                            .then((_) {
                              widget.designationController.clear();
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                provider.selectLastAddedDesignation();
                                Navigator.pop(context);
                              });
                            });
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
                        // setState(() {
                        //   _submitted = false;
                        //   designationError = null;
                        // });

                        provider.resetDesignation();
                        if (provider.designationResponse?.status == 1) {
                          widget.designationController.clear();
                          // Navigator.pop(context);
                        }
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
            if (widget.isEdit == true) ...[
              h8,
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        setState(() {
                          _submitted = true;
                          designationError = null;

                          if (widget.designationController.text
                              .trim()
                              .isEmpty) {
                            designationError = "Please enter designation";
                          }
                        });
                        Logger.logSuccess(
                          "EDIT ID ${provider.designationList?.userDesignationList[widget.index].id}",
                        );
                        if (designationError != null) return;
                        final pref = sl<SharedPreferences>();
                        final customerId = pref.getInt('customerId').toString();
                        Logger.logSuccess("Cust. No :::: $customerId");
                        provider
                            .addUserDesignation(
                              context,
                              designation: widget.designationController.text
                                  .trim(),
                              customerId: customerId,
                              id:
                                  provider
                                      .designationList
                                      ?.userDesignationList[widget.index]
                                      .id
                                      .toString() ??
                                  "",
                            )
                            .then((_) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  _submitted = false;
                                  designationError = null;
                                });
                                if (provider.designationResponse?.status == 1) {
                                  Navigator.pop(context);
                                }
                              });
                            });
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
                        // setState(() {
                        //   _submitted = false;
                        //   designationError = null;
                        // });

                        provider.resetDesignation();
                        widget.designationController.clear();
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
          ],
        );
      },
    );
  }
}

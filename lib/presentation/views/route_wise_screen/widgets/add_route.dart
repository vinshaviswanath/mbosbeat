import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/route_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddRoute extends StatefulWidget {
  const AddRoute({super.key, this.isEdit = false, this.index, this.details});

  final bool isEdit;
  final int? index;
  final RouteList? details;

  @override
  State<AddRoute> createState() => _AddRouteState();
}

class _AddRouteState extends State<AddRoute> {
  late TextEditingController routeNameController;
  late TextEditingController routeCodeController;

  bool _submitted = false;
  String? routeNameError;
  String? routeCodeError;

  @override
  void initState() {
    super.initState();
    routeNameController = TextEditingController();
    routeCodeController = TextEditingController();

    if (!widget.isEdit) {
      routeNameController.clear();
      routeCodeController.clear();
    } else {
      routeNameController.text = widget.details?.routeName ?? '';
      routeCodeController.text = widget.details?.routeCode ?? '';
    }
    _submitted = false;
    routeNameError = null;
    routeCodeError = null;
  }

  @override
  void dispose() {
    routeNameController.dispose();
    routeCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    final pref = sl<SharedPreferences>();
    final companyId = pref.getInt('selected_company_id');
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
                      ? appLocalizations.add_route_screen_edit_route
                      : appLocalizations.add_route_screen_add_route,
                  style: context.textStyle.s14.w500.dustyBlue.roboto.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: context.textStyle.dustyBlue.color,
                  ),
                ),
              ],
            ),
            h12,
            Text(
              appLocalizations.add_route_screen_add_route,
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: appLocalizations.add_route_screen_add_route,
              controller: routeNameController,
              autovalidateMode: provider.routeAutovalidateMode,
              failure: provider.routeName.getFailure,
              onChange: provider.updateRouteName,
              backgroundColor: ColorResources.lightGray,
              inputType: TextInputType.text,
              borderRadius: 12,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.transparent,
            ),
            h12,
            Text(
              appLocalizations.add_route_screen_route_code,
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: appLocalizations.add_route_screen_route_code,
              controller: routeCodeController,
              autovalidateMode: provider.routeAutovalidateMode,
              failure: provider.routeCode.getFailure,
              onChange: provider.updateRouteCode,
              backgroundColor: ColorResources.lightGray,
              inputType: TextInputType.text,
              borderRadius: 12,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.transparent,
            ),
            h16,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      if (widget.isEdit && widget.index != null) {
                        // Edit Route
                        // provider.editRoute(
                        //   widget.index!,
                        //   routeNameController.text.trim(),
                        //   routeCodeController.text.trim(),
                        // );
                        // Navigator.pop(context);
                        setState(() {
                          _submitted = true;
                          routeNameError = null;
                          routeCodeError = null;

                          if (routeNameController.text.trim().isEmpty) {
                            routeNameError = "Please enter route name";
                          }
                          if (routeCodeController.text.trim().isEmpty) {
                            routeCodeError = "Please enter route code";
                          }
                        });
                        Logger.logSuccess(
                          "Route EDIT ID ${provider.routeListResponse?.routeList[widget.index!].id}",
                        );
                        if (routeNameError != null && routeCodeError != null) {
                          return;
                        }
                        Logger.logSuccess("Company Id :::: $companyId");
                        provider
                            .createRoute(
                              context: context,
                              id:
                                  provider
                                      .routeListResponse
                                      ?.routeList[widget.index!]
                                      .id ??
                                  0,
                              // provider
                              //     .godownListResponse
                              //     ?.vehicleList[widget.index!]
                              //     .id ??
                              // 0,
                              companyId: companyId ?? 0,
                              routeCode: routeCodeController.text,
                              routeName: routeNameController.text,
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
                                  routeNameError = null;
                                  routeCodeError = null;
                                });
                                Navigator.pop(context);
                              });
                            });
                      } else {
                        // Add route (with validation)
                        // provider.submitRoute(context);
                        setState(() {
                          _submitted = true;
                          routeNameError = null;
                          routeCodeError = null;

                          if (routeNameController.text.trim().isEmpty) {
                            routeNameError = "Please enter route name";
                          }
                          if (routeCodeController.text.trim().isEmpty) {
                            routeCodeError = "Please enter route code";
                          }
                        });

                        if (routeNameError != null && routeCodeError != null) {
                          return;
                        }

                        Logger.logSuccess("Company Id :::: $companyId");

                        provider
                            .createRoute(
                              context: context,
                              id: 0,
                              companyId: companyId ?? 0,
                              routeCode: routeCodeController.text,
                              routeName: routeNameController.text,
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
                              routeNameController.clear();
                              routeCodeController.clear();
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
                      routeNameController.clear();
                      routeCodeController.clear();
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

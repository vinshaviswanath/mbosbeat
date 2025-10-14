import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class AddRoute extends StatefulWidget {
  const AddRoute({super.key, this.isEdit = false, this.index});

  final bool isEdit;
  final int? index;

  @override
  State<AddRoute> createState() => _AddRouteState();
}

class _AddRouteState extends State<AddRoute> {
  late TextEditingController routeNameController;
  late TextEditingController routeCodeController;

  @override
  void initState() {
    super.initState();
     final provider = context.read<CompanyCreationProvider>();
    routeNameController = TextEditingController(
      text: widget.isEdit && widget.index != null
          ? provider.routes[widget.index!].routeName
          : '',
    );

    routeCodeController = TextEditingController(
      text: widget.isEdit && widget.index != null
          ? provider.routes[widget.index!].routeCode
          : '',
    );
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
                          // Edit Route
                          provider.editRoute(
                            widget.index!,
                            routeNameController.text.trim(),
                            routeCodeController.text.trim(),
                          );
                          Navigator.pop(context);
                        } else {
                          // Add route (with validation)
                          provider.submitRoute(context);
                        }
                        routeNameController.clear();
                        routeCodeController.clear();
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

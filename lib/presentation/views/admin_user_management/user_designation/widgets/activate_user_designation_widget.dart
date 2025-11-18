import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';

class ActivateUserDesignationWidget extends StatelessWidget {
  final VoidCallback onActivate;
  final String designation;

  const ActivateUserDesignationWidget({
    super.key,
    required this.onActivate,
    required this.designation,
  });

  @override
  Widget build(BuildContext context) {
    final appLocatlizations = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            appLocatlizations.activate_user_designation_widget_activate_user,
            style: context.textStyle.s14.w500.indigoBlue,
          ),
          h10,
          Text(
            "${appLocatlizations.activate_user_designation_widget_are_you_sure}$designation ?",
            style: context.textStyle.s12.w500.dustyBlue.roboto,
          ),
          h24,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                    onActivate();
                    AppDetails.rootScaffoldMessengerKey.currentState
                        ?.showSnackBar(
                          SnackBar(
                            content: Consumer<UserManagementProvider>(
                              builder: (context, provider, _) {
                                return Text(
                                  provider.designationResponse?.message ?? "",
                                  textAlign: TextAlign.center,
                                  style:
                                      context.textStyle.s12.w500.white.roboto,
                                );
                              },
                            ),
                            backgroundColor: ColorResources.black.withValues(
                              alpha: 0.6,
                            ),
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                  },
                  buttonText: appLocatlizations
                      .activate_user_designation_widget_activate,
                  textStyle: context.textStyle.s12.w500.white.roboto,
                  isborderEnable: false,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              w10,
              Expanded(
                child: CustomButton(
                  onTap: () => Navigator.pop(context),
                  buttonText: appLocatlizations.cancel,
                  textStyle: context.textStyle.s12.w500.white.roboto,
                  color: ColorResources.bluishGray,
                  isborderEnable: false,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
          h10,
        ],
      ),
    );
  }
}

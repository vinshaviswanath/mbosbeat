import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class PopoverBody extends StatelessWidget {
  const PopoverBody({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Consumer<CompanyCreationProvider>(
      builder: (context, provider, _) {
        return Material(
          color: ColorResources.white,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                provider.isGodown
                    ? GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouterConst.godownWiseScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorResources.rosePink,
                          ),
                          child: Text(
                            appLocalizations.popover_body_godown_wise,
                            style: context.textStyle.s09.w400.white.roboto,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouterConst.routeWiseScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorResources.rosePink,
                          ),
                          child: Text(
                            appLocalizations.popover_body_route_wise,
                            style: context.textStyle.s09.w400.white.roboto,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

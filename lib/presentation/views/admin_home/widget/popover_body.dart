import 'package:mpos_beat/core/utils/imports.dart';

class PopoverBody extends StatelessWidget {
  const PopoverBody({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRouterConst.godownWiseScreen);
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
                  appLocalizations.popover_body_godown_wise,
                  style: context.textStyle.s09.w400.white.roboto,
                ),
              ),
            ),
            w10,
            GestureDetector(
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
  }
}

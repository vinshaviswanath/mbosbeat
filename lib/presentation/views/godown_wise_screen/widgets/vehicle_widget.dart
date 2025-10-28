import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';

class VehicleWidget extends StatelessWidget {
  const VehicleWidget({
    super.key,
    required this.isSelected,
    required this.item,
    required this.index,
    this.onTap,
    this.isBlocked = false,
    this.suffixWidget,
    this.backgroundColor,
  });

  final bool isSelected;
  final VehicleList item;
  final int index;
  final void Function()? onTap;
  final bool isBlocked;
  final Widget? suffixWidget;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final bool isInactive = item.active == 0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:
            backgroundColor ?? ColorResources.indigoBlue.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            "${index + 1}",
            style: isInactive
                ? context.textStyle.s12.w500.roboto.copyWith(
                    color: ColorResources.indigoBlue.withValues(alpha: 0.3),
                  )
                : context.textStyle.s12.w500.indigoBlue.roboto,
          ),
          w24,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.name}",
                  style: context.textStyle.s12.w500.roboto.copyWith(
                    color: isInactive
                        ? ColorResources.indigoBlue.withValues(alpha: 0.3)
                        : ColorResources.indigoBlue,
                  ),
                ),
                h4,
                Text(
                  isInactive ? "Inactive" : "Active",
                  style: context.textStyle.s10.w400.roboto.copyWith(
                    color: isInactive
                        ? ColorResources.dustyBlue.withValues(alpha: 0.6)
                        : ColorResources.oceanBlue,
                  ),
                ),
              ],
            ),
          ),
          if (!isBlocked && suffixWidget != null) suffixWidget!,
        ],
      ),
    );
  }
}

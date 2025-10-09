import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/user_designation_screen.dart';

class UserDesignationWidget extends StatelessWidget {
  const UserDesignationWidget({
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
  final UserDesignationDetails item;
  final int index;
  final void Function()? onTap;
  final bool isBlocked;
  final Widget? suffixWidget;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final bool isInactive = item.status == "Inactive";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:
            backgroundColor ?? ColorResources.snowBlue.withValues(alpha: 0.5),
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
          w12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.userName,
                  style: context.textStyle.s12.w500.roboto.copyWith(
                    color: isInactive
                        ? ColorResources.indigoBlue.withValues(alpha: 0.3)
                        : ColorResources.indigoBlue,
                  ),
                ),
                h4,
                Text(
                  item.status,
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

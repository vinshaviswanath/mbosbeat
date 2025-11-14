import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.isSelected,
    // required this.item,
    required this.index,
    this.onTap,
    this.isBlocked = false,
    this.suffixWidget,
    this.backgroundColor,
    this.showIndex = true,
    required this.title,
    this.subTitle,
  });

  final bool isSelected;
  // ignore: prefer_typing_uninitialized_variables
  // final UserMasterList item;
  final int index;
  final bool? showIndex;
  final void Function()? onTap;
  final bool isBlocked;
  final Widget? suffixWidget;
  final Color? backgroundColor;
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final cardColor = isBlocked
        ? Colors.grey.shade300
        : isSelected
        ? ColorResources.indigoBlue
        : ColorResources.snowBlue.withValues(alpha: 0.5);

    final textColor = isBlocked
        ? Colors.grey
        : isSelected
        ? Colors.white
        : ColorResources.dustyBlue;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor ?? cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (showIndex == true) ...[
            Text(
              "${index + 1}",
              style: context.textStyle.s12.w500.copyWith(color: textColor),
            ),
          ],
          w12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textStyle.s12.w500.copyWith(color: textColor),
                ),
                if (subTitle != null) ...[
                  h4,
                  Text(
                    "$subTitle",
                    style: context.textStyle.s10.w400.copyWith(
                      color: isBlocked
                          ? Colors.grey
                          : ColorResources.bluishGray,
                    ),
                  ),
                ],
              ],
            ),
          ),

          if (!isBlocked || suffixWidget != null) ...[suffixWidget!],
        ],
      ),
    );
  }
}

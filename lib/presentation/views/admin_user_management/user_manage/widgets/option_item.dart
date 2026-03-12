import 'package:mpos_beat/core/utils/imports.dart';

class OptionItem extends StatelessWidget {
  final int index;
  final int? selectedIndex;
  final String title;
  final String? icon;
  final TextStyle? style;
  final Function(int) onTap;
  final Color? iconColor;

  const OptionItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.title,
    this.icon,
    required this.onTap,
    this.style,
     this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style:
                  style ??
                  (isSelected
                      ? context.textStyle.s12.w500.indigoBlue.roboto
                      : context.textStyle.s10.dustyBlue.w500.roboto),
            ),
            SvgPicture.asset(
              icon ?? '',
              colorFilter: ColorFilter.mode(
                iconColor ?? ColorResources.bluishGray,
                // isSelected
                //     ? ColorResources.indigoBlue
                //     : ColorResources.bluishGray,
                BlendMode.srcIn,
              ),

              height: context.getSize.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

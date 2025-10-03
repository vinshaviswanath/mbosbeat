import 'package:mpos_beat/core/utils/imports.dart';

class OptionItem extends StatelessWidget {
  final int index;
  final int? selectedIndex;
  final String title;
  final IconData icon;
  final Function(int) onTap;

  const OptionItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.title,
    required this.icon,
    required this.onTap,
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
              style: isSelected
                  ? context.textStyle.s12.w500.indigoBlue.roboto
                  : context.textStyle.s12.dustyBlue.w500.roboto,
            ),
            Icon(
              icon,
              color: isSelected
                  ? ColorResources.indigoBlue
                  : ColorResources.bluishGray,
              size: context.getSize.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
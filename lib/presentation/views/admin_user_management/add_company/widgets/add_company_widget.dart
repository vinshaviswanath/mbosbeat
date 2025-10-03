import 'package:mpos_beat/core/utils/imports.dart';

class AddCompanyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const AddCompanyWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? ColorResources.indigoBlue : ColorResources.snowBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 13, right: 10),
        leading: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? ColorResources.white
                    : ColorResources.coolGray,
                width: 2,
              ),
              color: isSelected
                  ? ColorResources.indigoBlue
                  : ColorResources.white,
            ),
            child: isSelected
                ? const Icon(
                    Icons.circle,
                    size: 14,
                    color: ColorResources.amber,
                  )
                : const Icon(
                    Icons.circle,
                    size: 14,
                    color: ColorResources.coolGray,
                  ),
          ),
        ),
        title: Text(
          title,
          style: isSelected
              ? context.textStyle.s12.w500.white.roboto
              : context.textStyle.s12.w500.indigoBlue.roboto,
        ),
        subtitle: Text(
          subtitle,
          style: isSelected
              ? context.textStyle.s10.w400.white.roboto
              : context.textStyle.s10.w400.dustyBlue.roboto,
        ),
        trailing: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorResources.amber
                  : ColorResources.coolGray,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.add, color: ColorResources.white, size: 18),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

import 'package:mpos_beat/core/utils/imports.dart';

class UserManagementSelectionCard extends StatelessWidget {
  const UserManagementSelectionCard({
    super.key,
    this.onTap,
    this.icon,
    required this.text,
  });
  final void Function()? onTap;
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 21),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 10,
              color: ColorResources.bluishGray,
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [ColorResources.softViolet, ColorResources.deepViolet],
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 111, 176, 255),
              ),
              child: Icon(icon, size: 34, color: ColorResources.white),
            ),
            Text(text, style: context.textStyle.s22.bold.white.gilroy),
          ],
        ),
      ),
    );
  }
}

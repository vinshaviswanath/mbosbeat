import 'package:mpos_beat/core/utils/imports.dart';

class AdminHomeWidget extends StatelessWidget {
  const AdminHomeWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.colors, this.onTap,
  });

  final String iconData;
  final String title;
  final List<Color> colors;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 1,
                  color: ColorResources.indigoBlue,
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                iconData,
                height: 65,
                color: ColorResources.white,
              ),
            ),
          ),
          h10,
          Text(
            title,
            style: context.textStyle.s22.bluishGray.bold.dustyBlue.gilroy,
          ),
        ],
      ),
    );
  }
}

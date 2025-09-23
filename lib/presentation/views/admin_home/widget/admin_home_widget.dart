import 'package:mpos_beat/core/utils/imports.dart';

class AdminHomeWidget extends StatelessWidget {
  const AdminHomeWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.colors,
  });

  final String iconData;
  final String title;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        gap10,
        Text(
          title,
          style: context.textStyle.s22.bluishGray.bold.dustyBlue.gilroy,
        ),
      ],
    );
  }
}

import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/animations/vibrationg_icon.dart';

class AdminHomeWidget extends StatelessWidget {
  const AdminHomeWidget({
    super.key,
    required this.iconData,
    required this.title,
  });

  final String iconData;
  final String title;

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
            gradient: const LinearGradient(
              colors: [ColorResources.softViolet, ColorResources.deepViolet],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 1,
                color: ColorResources.indigoBlue,
              )
            ],
          ),
          child: Center(
            child: VibratingIconAnimation(
              icon: iconData,
              size: 65,
              color: ColorResources.white,
            ),
          ),
        ),
        gap10,
        Text(
          title,
          style: context.textStyle.s22.bluishGray.bold,
        ),
      ],
    );
  }
}

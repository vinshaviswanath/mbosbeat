import 'package:avatar_glow/avatar_glow.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class ResetSuccessScreen extends StatelessWidget {
  const ResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getSize.height,
      width: context.getSize.width,
      color: ColorResources.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              AvatarGlow(
                glowColor: ColorResources.amber,
                glowShape: BoxShape.circle,
                glowRadiusFactor: 0.3,
                animate: true,
                repeat: true,
                child: SvgPicture.asset(AppAssets.tick, height: 144),
              ),
              h30,
              Text(
                'Password Updated\nSuccessfully',
                style: context.textStyle.s22.bold.indigoBlue,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.getSize.width / 3,
            ),
            child: CustomButton(
              onTap: () {
                GoRouter.of(
                  context,
                ).pushReplacementNamed(AppRouterConst.manageUser);
              },
              buttonText: 'Done',
              isborderEnable: false,
            ),
          ),
        ],
      ),
    );
  }
}

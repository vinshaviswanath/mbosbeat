import 'package:mpos_beat/core/utils/imports.dart';

class BaseBox extends StatelessWidget {
  final Widget widgwt;
  final double? height;
  const BaseBox({
    super.key,
    required this.widgwt,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getSize.width - 32,
      height: height ?? context.getSize.height * 0.4,
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
          color: ColorResources.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 13),
                blurRadius: 20,
                color: ColorResources.overlayBlack)
          ]),
      child: widgwt,
    );
  }
}

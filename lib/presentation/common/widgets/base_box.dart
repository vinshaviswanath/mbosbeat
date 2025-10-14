import 'package:mpos_beat/core/utils/imports.dart';

// class BaseBox extends StatelessWidget {
//   final Widget widgwt;
//   final double? height;
//   const BaseBox({
//     super.key,
//     required this.widgwt,
//     this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: context.getSize.width - 32,
//       height: height,
//       padding: const EdgeInsets.all(36),
//       decoration: BoxDecoration(
//           color: ColorResources.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: const [
//             BoxShadow(
//                 offset: Offset(0, 13),
//                 blurRadius: 20,
//                 color: ColorResources.overlayBlack)
//           ]),
//       child: widgwt,
//     );
//   }
// }

class BaseBox extends StatelessWidget {
  final Widget widgwt;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  const BaseBox({
    super.key,
    required this.widgwt,
    this.height,
    this.padding,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width ?? context.getSize.width - 16,
        minWidth: 0,
        minHeight: 0,
        maxHeight: height ?? context.getSize.height * 0.42,
      ),
      child: Container(
        padding: padding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorResources.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 13),
              blurRadius: 20,
              color: ColorResources.overlayBlack,
            ),
          ],
        ),
        child: widgwt,
      ),
    );
  }
}

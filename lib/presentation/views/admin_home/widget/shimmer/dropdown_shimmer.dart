import 'package:mpos_beat/core/utils/imports.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;

  const ShimmerBox({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorResources.white.withValues(alpha: 0.3),
      highlightColor: ColorResources.white.withValues(alpha: 0.1),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

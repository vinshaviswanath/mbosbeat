import 'package:flutter/material.dart';

// class CircleThumbShape extends SliderComponentShape {
//   const CircleThumbShape({this.thumbRadius = 10.0});

//   final double thumbRadius;

//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return Size.fromRadius(thumbRadius);
//   }

//   @override
//   void paint(
//     PaintingContext context,
//     Offset center, {
//     required Animation<double> activationAnimation,
//     required Animation<double> enableAnimation,
//     required bool isDiscrete,
//     required TextPainter labelPainter,
//     required RenderBox parentBox,
//     required SliderThemeData sliderTheme,
//     required TextDirection textDirection,
//     required double value,
//     required double textScaleFactor,
//     required Size sizeWithOverflow,
//   }) {
//     final Canvas canvas = context.canvas;

//     final Paint fillPaint = Paint()
//       ..color = ColorResources.textColor
//       ..style = PaintingStyle.fill;

//     final Paint borderPaint = Paint()
//       ..color = ColorResources.secondary
//       ..strokeWidth = 5
//       ..style = PaintingStyle.stroke;

//     final Paint shadowPaint = Paint()
//       ..color = Colors.black.withOpacity(0.5) // Shadow color and opacity
//       ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

//     canvas
//       ..drawCircle(center, thumbRadius, fillPaint)
//       ..drawCircle(center, thumbRadius, shadowPaint)
//       ..drawCircle(center, thumbRadius, borderPaint);
//   }
// }

class EdgeToEdgeTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight ?? 2.0;
    final trackWidth = parentBox.size.width;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    return Rect.fromLTWH(offset.dx, trackTop, trackWidth, trackHeight);
  }
}

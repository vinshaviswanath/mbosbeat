import 'dart:math';

import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';

class StatusView extends StatelessWidget {
  final int numberOfStatus;
  final double spacing;
  final double radius;
  final double padding;
  final String centerImageUrl;
  final double strokeWidth;
  final Color incompleteColor;
  final Color completeColor;
  final CompanyViewList company;

  const StatusView({
    super.key,
    this.numberOfStatus = 3,
    this.spacing = 8.0,
    this.radius = 28,
    this.padding = 5,
    required this.centerImageUrl,
    this.strokeWidth = 2,
    this.incompleteColor = Colors.grey,
    this.completeColor = ColorResources.indigoBlue,
    required this.company,
  }) : assert(centerImageUrl != null, "Please provide centerImageUrl");
  int calculateCompletedSteps(CompanyViewList c) {
    int steps = 0;

    if (c.hasCompanySettings != 0) steps++;
    if (c.hasIntegrationSettings != 0) steps++;
    if (c.hasVoucherTypeSettings != 0) steps++;

    return steps;
  }

  @override
  Widget build(BuildContext context) {
    // print('Company: ${company.companyName}');
    // print('company completion: ${company.hasCompanySettings}');
    // print('integration completion: ${company.hasIntegrationSettings}');
    // print('voucher completion: ${company.hasVoucherTypeSettings}');
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: CustomPaint(
            painter: Arc(
              alreadyWatch: calculateCompletedSteps(company),
              numberOfArc: numberOfStatus,
              spacing: spacing,
              strokeWidth: strokeWidth,
              seenColor: completeColor,
              unSeenColor: incompleteColor,
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: ColorResources.veryLightGray,
          radius: radius - padding,
          backgroundImage: centerImageUrl.isNotEmpty
              ? NetworkImage(centerImageUrl)
              : null,
          child: centerImageUrl.isEmpty
              ? Image.asset(
                  'assets/images/pngs/mpos_logo.png',
                  fit: BoxFit.cover,
                )
              : null,
        ),
      ],
    );
  }
}

class Arc extends CustomPainter {
  final int numberOfArc;
  final int alreadyWatch;
  final double spacing;
  final double strokeWidth;
  final Color seenColor;
  final Color unSeenColor;
  Arc({
    required this.numberOfArc,
    required this.alreadyWatch,
    required this.spacing,
    required this.strokeWidth,
    required this.seenColor,
    required this.unSeenColor,
  });

  double doubleToAngle(double angle) => angle * pi / 180.0;

  void drawArcWithRadius(
    Canvas canvas,
    Offset center,
    double radius,
    double angle,
    Paint seenPaint,
    Paint unSeenPaint,
    double start,
    double spacing,
    int number,
    int alreadyWatch,
  ) {
    for (var i = 0; i < number; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        doubleToAngle((start + ((angle + spacing) * i))),
        doubleToAngle(angle),
        false,
        alreadyWatch - 1 >= i ? seenPaint : unSeenPaint,
      );
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2.0, size.height / 2.0);
    final double radius = size.width / 2.0;
    double angle = numberOfArc == 1 ? 360.0 : (360.0 / numberOfArc - spacing);
    var startingAngle = 410.0;

    Paint seenPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..color = seenColor;

    Paint unSeenPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..color = unSeenColor;

    drawArcWithRadius(
      canvas,
      center,
      radius,
      angle,
      seenPaint,
      unSeenPaint,
      startingAngle,
      spacing,
      numberOfArc,
      alreadyWatch,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

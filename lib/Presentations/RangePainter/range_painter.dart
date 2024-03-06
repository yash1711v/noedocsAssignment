
import 'package:flutter/material.dart';

import '../../Model/model.dart';

class CustomRanger extends CustomPainter {
  final double value;
  final TestMetadata testMetadata;
  final double axisWidth;
  final double pointerWidth;
  CustomRanger({required this.value,required this.testMetadata,required this.axisWidth,required this.pointerWidth});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.strokeCap = StrokeCap.round;

    for (var section in testMetadata.sections) {
      paint.color = section.color;
      paint.strokeWidth =  axisWidth;
      final double startPosition = section.start / 120 * size.width;
      final double endPosition = section.end / 120 * size.width;

      canvas.drawLine(
        Offset(startPosition, size.height / 2),
        Offset(endPosition, size.height / 2),
        paint,
      );
    }

    drawPointer(canvas, paint, value, size);
  }

  void drawPointer(Canvas canvas, Paint paint, double value, Size size) {
    paint.color = Colors.blue;
    paint.strokeWidth = pointerWidth;
    final double position = value / 120 * size.width;
    canvas.drawLine(Offset(position, 0), Offset(position, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
import 'package:flutter/material.dart';

class WatermarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    TextSpan span = TextSpan(
      text: 'Sample Watermark',
      style: TextStyle(
        fontSize: 24.0,
        color: paint.color,
      ),
    );

    TextPainter tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    tp.layout();

    double stepX = size.width / 5; // Horizontal spacing for 5 columns
    double stepY = size.height / 4; // Vertical spacing for 4 rows

    for (double y = 0; y < size.height; y += stepY) {
      for (double x = 0; x < size.width; x += stepX) {
        canvas.save();
        canvas.translate(x + stepX / 2, y + stepY / 2);
        canvas.rotate(-0.5); // Rotate text by -0.5 radians
        canvas.translate(-tp.width / 2, -tp.height / 2);
        tp.paint(canvas, const Offset(0, 0));
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(WatermarkPainter oldDelegate) {
    return false;
  }
}
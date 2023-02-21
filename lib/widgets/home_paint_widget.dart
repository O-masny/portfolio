import 'package:flutter/material.dart';

class FaceOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define a paint object
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.indigo;
    final paintInnerCircle = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.amber.withOpacity(0.4);

    // Left eye
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          const Rect.fromLTWH(20, 40, 100, 100), const Radius.circular(20)),
      paint,
    );
    // Right eye
    canvas.drawOval(Rect.fromLTWH(size.width - 120, 40, 100, 100), paint);
    canvas.drawLine(const Offset(50, 50), const Offset(50, 200), paint);
    canvas.drawOval(
        Rect.fromLTWH(size.width / 2.5, 40, 300, 300), paintInnerCircle);
    canvas.drawLine(
        Offset(size.width - 120, 50), Offset(size.width - 120, 200), paint);
    // Mouth
    final mouth = Path();
    mouth.moveTo(size.width * 0.8, size.height * 0.6);
    mouth.arcToPoint(
      Offset(size.width * 0.2, size.height * 0.1),
      radius: const Radius.circular(150),
    );
    mouth.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.6),
      radius: const Radius.circular(200),
      clockwise: false,
    );
    final mouthSecond = Path();
    mouthSecond.moveTo(size.width * 0.9, size.height * 0.6);
    mouthSecond.arcToPoint(
      Offset(size.width * 0.2, size.height * 0.1),
      radius: const Radius.circular(150),
    );
    mouthSecond.arcToPoint(
      Offset(size.width * 0.5, size.height * 0.1),
      radius: const Radius.circular(800),
      clockwise: false,
    );
    canvas.drawPath(mouth, paint);
    canvas.drawPath(mouthSecond, paintInnerCircle);
    canvas.drawPath(mouthSecond, paintInnerCircle);
  }

  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;
}

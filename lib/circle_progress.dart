import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter{
  final stroke = 15.0;
  double currentProgress = 0;

  CircleProgress(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    // создаем круг с параметрами
    Paint circle = Paint()
        ..strokeWidth = stroke
        ..color = Colors.black
        ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);  //center of device
    double radius = 150;
    // выводим наш круг по центру экрана
    canvas.drawCircle(center, radius, circle);

    Paint animationArc = Paint()
    ..strokeWidth = stroke
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
    
    double angle = 2 * pi * (currentProgress/100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        pi/2, angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
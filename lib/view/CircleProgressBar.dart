import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ytcardapp/theme.dart';

class CircleProgressBar {
  CircleProgressBar(this.progress, {this.min = 0.0, this.max = 100.0});

  double progress;

  double min;

  double max;

  static CircleProgressBar lerp(
      CircleProgressBar begin, CircleProgressBar end, double t) {
    return new CircleProgressBar(lerpDouble(begin.progress, end.progress, t));
  }

}

class CircleProgressBarTween extends Tween<CircleProgressBar> {
  CircleProgressBarTween(CircleProgressBar begin, CircleProgressBar end)
      : super(begin: begin, end: end);

  @override
  CircleProgressBar lerp(double t) => CircleProgressBar.lerp(begin, end, t);
}


class CircleProgressBarPainter extends CustomPainter {
  CircleProgressBarPainter(Animation<CircleProgressBar> animation)
      : animation = animation,
        super(repaint: animation);

  Animation<CircleProgressBar> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final progressBar = animation.value;
    final paint = new Paint()
      ..color = Style.appColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;
    final double wh = max(size.width, size.height);
    final centerX = (size.width  ) / 2.0,
        centerY = (size.height ) / 2.0;
    final radius = wh /2.0;
    canvas.drawPath(getArcPath(centerX, centerY, radius, true), paint);
    paint.color = Colors.red;
    canvas.drawPath(getArcPath(centerX, centerY, radius, false, (progressBar.progress / progressBar.max) * 360), paint);
  }

  Path getArcPath(
      double centerX, double centerY, double radius, bool isClosePath, [double arcAngle = 360.0]) {
    var path = Path();
    for (double i = 0.0; i < arcAngle; i += 0.1) {
      double x = centerX + radius * cos(i * 3.141592653 / 180);
      double y = centerY / 2.0 + radius * sin(i * 3.141592653 / 180);
      if (i != 0)
        path.lineTo(x, y);
      else
        path.moveTo(x, y);
    }
    if (isClosePath) path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
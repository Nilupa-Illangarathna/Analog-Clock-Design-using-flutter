import 'package:flutter/material.dart';
import 'dart:math';

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();



  @override
  void paint(Canvas canvas, Size size) {
    var centerX =250 / 2;
    var centerY = 250 / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);

    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = centerX/12.5;

    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = centerX/30;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = centerX/18.75;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = centerX/12.5;

    var outerdashBrush = Paint()
      ..color = Color(0xFF1C1C1C)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = centerX/12.5;

    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = centerX/150;

    var innernonbold_dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = centerX/37.5;

    canvas.drawCircle(center, radius - centerX/3.75, fillBrush);
    canvas.drawCircle(center, radius - centerY/3.75, outlineBrush);

    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);


    var outerCircleRadius = radius - centerX/7.5;
    var innerCircleRadius = radius - centerX*14/75;

    canvas.drawCircle(center ,outerCircleRadius-4 ,outerdashBrush);

    for (double i = 0; i < 360; i += 8) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);
      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }

    var nonboldinsideouterCircleRadius = radius - centerX/2.5 ;
    var nonboldinsideinnerCircleRadius = radius - centerX*37/75 ;
    var boldinsideinnerCircleRadius = radius - centerX*13/25 ;
    for (double i = 0; i < 360; i += 6) {
      var x1 = centerX + nonboldinsideouterCircleRadius * cos(i * pi / 180);
      var y1 = centerX + nonboldinsideouterCircleRadius * sin(i * pi / 180);
      var x2 = centerX + nonboldinsideinnerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + nonboldinsideinnerCircleRadius * sin(i * pi / 180);
      var x3 = centerX + boldinsideinnerCircleRadius * cos(i * pi / 180);
      var y3 = centerX + boldinsideinnerCircleRadius * sin(i * pi / 180);

      if(i%5==0)
        canvas.drawLine(Offset(x1, y1), Offset(x3, y3), innernonbold_dashBrush);
      else
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
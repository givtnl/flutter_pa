import 'package:flutter/material.dart';

class CustomSliderTickMarkShape extends SliderTickMarkShape {
  final double height;
  final double width;
  final Color color;

  const CustomSliderTickMarkShape({
    required this.height, required this.width, required this.color
  });

  @override
  Size getPreferredSize(
      {required SliderThemeData sliderTheme, required bool isEnabled}) {
    return Size(width, height);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required Offset thumbCenter,
        required bool isEnabled,
        required TextDirection textDirection}) {
    final canvas = context.canvas;
    final Paint paint =  Paint()
      ..color = color
      ..strokeWidth = 2;
    canvas.drawLine(center.translate(0, -5), center.translate(0, 5), paint);
  }
}

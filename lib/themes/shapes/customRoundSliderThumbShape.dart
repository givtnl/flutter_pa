import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomRoundSliderThumbShape extends SliderComponentShape {
  final double outerRadius;
  final double innerRadius;
  final Color outerColor;
  final Color innerColor;

  const CustomRoundSliderThumbShape({
    required this.outerRadius,
    required this.innerRadius,
    required this.outerColor,
    required this.innerColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(outerRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    canvas.drawCircle(
      center,
      outerRadius,
      Paint()..color = outerColor,
    );

    canvas.drawCircle(
      center,
      innerRadius,
      Paint()..color = innerColor,
    );

  }
}

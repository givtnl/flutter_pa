import 'package:flutter/material.dart';

class CustomRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  final Color trackColor;

  const CustomRectSliderTrackShape({
    required this.trackColor
  });

  @override
  void paint(PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset thumbCenter,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 1,
      }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );


    final Paint trackPaint = Paint()
      ..color = trackColor;

    context.canvas.drawRect(
        Rect.fromLTRB(
            parentBox.semanticBounds.left,
            trackRect.top,
            parentBox.semanticBounds.right,
            trackRect.bottom),
        trackPaint);
  }
}

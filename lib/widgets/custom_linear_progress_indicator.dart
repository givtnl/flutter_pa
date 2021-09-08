import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

const int _kIndeterminateLinearDuration = 1800;

class CustomLinearProgressIndicator extends ProgressIndicator {
  /// Creates a linear progress indicator.
  ///
  /// {@macro flutter.material.ProgressIndicator.ProgressIndicator}
  const CustomLinearProgressIndicator({
    Key? key,
    double? value,
    Color? backgroundColor,
    Color? color,
    Animation<Color?>? valueColor,
    this.height,
    required this.borderRadius,
    String? semanticsLabel,
    String? semanticsValue,
  }) : assert(height == null || height > 0),
        super(
        key: key,
        value: value,
        backgroundColor: backgroundColor,
        color: color,
        valueColor: valueColor,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
      );

  /// The minimum height of the line used to draw the indicator.
  ///
  /// This defaults to 4dp.
  final double? height;
  final double borderRadius;

  @override
  _CustomLinearProgressIndicatorState createState() => _CustomLinearProgressIndicatorState();

  Color _getBackgroundColor(BuildContext context) => backgroundColor ?? Theme.of(context).colorScheme.background;
  Color _getValueColor(BuildContext context) => valueColor?.value ?? color ?? Theme.of(context).colorScheme.primary;

  Widget _buildSemanticsWrapper({
    required BuildContext context,
    required Widget child,
  }) {
    String? expandedSemanticsValue = semanticsValue;
    if (value != null) {
      expandedSemanticsValue ??= '${(value! * 100).round()}%';
    }
    return Semantics(
      label: semanticsLabel,
      value: expandedSemanticsValue,
      child: child,
    );
  }
}

class _CustomLinearProgressIndicatorState extends State<CustomLinearProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: _kIndeterminateLinearDuration),
      vsync: this,
    );
    if (widget.value == null)
      _controller.repeat();
  }

  @override
  void didUpdateWidget(CustomLinearProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && !_controller.isAnimating)
      _controller.repeat();
    else if (widget.value != null && _controller.isAnimating)
      _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIndicator(BuildContext context, double animationValue, TextDirection textDirection) {
    return widget._buildSemanticsWrapper(
      context: context,
      child: Container(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: widget.height ?? 4.0,
        ),
        child: CustomPaint(
          painter: _CustomLinearProgressIndicatorPainter(
            borderRadius: widget.borderRadius,
            backgroundColor: widget._getBackgroundColor(context),
            valueColor: widget._getValueColor(context),
            value: widget.value, // may be null
            animationValue: animationValue, // ignored if widget.value is not null
            textDirection: textDirection,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);

    if (widget.value != null)
      return _buildIndicator(context, _controller.value, textDirection);

    return AnimatedBuilder(
      animation: _controller.view,
      builder: (BuildContext context, Widget? child) {
        return _buildIndicator(context, _controller.value, textDirection);
      },
    );
  }
}

class _CustomLinearProgressIndicatorPainter extends CustomPainter {
  const _CustomLinearProgressIndicatorPainter({
    required this.borderRadius,
    required this.backgroundColor,
    required this.valueColor,
    this.value,
    required this.animationValue,
    required this.textDirection,
  }) : assert(textDirection != null);

  final double borderRadius;
  final Color backgroundColor;
  final Color valueColor;
  final double? value;
  final double animationValue;
  final TextDirection textDirection;
  // The indeterminate progress animation displays two lines whose leading (head)
  // and trailing (tail) endpoints are defined by the following four curves.
  static const Curve line1Head = Interval(
    0.0,
    750.0 / _kIndeterminateLinearDuration,
    curve: Cubic(0.2, 0.0, 0.8, 1.0),
  );
  static const Curve line1Tail = Interval(
    333.0 / _kIndeterminateLinearDuration,
    (333.0 + 750.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.4, 0.0, 1.0, 1.0),
  );
  static const Curve line2Head = Interval(
    1000.0 / _kIndeterminateLinearDuration,
    (1000.0 + 567.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.0, 0.0, 0.65, 1.0),
  );
  static const Curve line2Tail = Interval(
    1267.0 / _kIndeterminateLinearDuration,
    (1267.0 + 533.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.10, 0.0, 0.45, 1.0),
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
            0, 0, size.width, size.height),
        Radius.circular(borderRadius)));
    canvas.drawPath(path, paint);

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0)
        return;

      final double left;
      switch (textDirection) {
        case TextDirection.rtl:
          left = size.width - width - x;
          break;
        case TextDirection.ltr:
          left = x;
          break;
      }
      Path path = Path();
      path.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(
              left, 0, width, size.height),
          Radius.circular(borderRadius)));
      canvas.drawPath(path, paint);
    }

    if (value != null) {
      drawBar(0.0, value!.clamp(0.0, 1.0) * size.width);
    } else {
      final double x1 = size.width * line1Tail.transform(animationValue);
      final double width1 = size.width * line1Head.transform(animationValue) - x1;

      final double x2 = size.width * line2Tail.transform(animationValue);
      final double width2 = size.width * line2Head.transform(animationValue) - x2;

      drawBar(x1, width1);
      drawBar(x2, width2);
    }
  }

  @override
  bool shouldRepaint(_CustomLinearProgressIndicatorPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor
        || oldPainter.valueColor != valueColor
        || oldPainter.value != value
        || oldPainter.animationValue != animationValue
        || oldPainter.textDirection != textDirection;
  }
}
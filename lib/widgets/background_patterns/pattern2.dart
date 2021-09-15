import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/background_patterns/MediaQueryService.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundPattern2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mqs = MediaQueryService.getInstance(context);

    final Widget halfMoon = SvgPicture.asset('assets/svg/pattern2/ellipse 25.svg');
    final Widget halfCircle = SvgPicture.asset('assets/svg/pattern2/Ellipse 30.svg');
    final Widget smallCircle = SvgPicture.asset('assets/svg/pattern2/Ellipse 24.svg');
    final Widget halfCirclePurple = SvgPicture.asset('assets/svg/pattern2/Ellipse 23 (Stroke).svg');
    final Widget snake = SvgPicture.asset('assets/svg/pattern2/path (Stroke).svg');

    return Container(
        child: Stack(
      children: [
        Positioned(
          child: halfMoon,
          top: mqs.getPercentageHeight(5),
          left: mqs.getPercentageWidth(5),
        ),
        Positioned(
          child: halfCircle,
          top: mqs.getPercentageHeight(50),
          left: 0,
        ),
        Positioned(
          child: smallCircle,
          top: mqs.getPercentageHeight(6),
          right: mqs.getPercentageWidth(10),
        ),
        Positioned(
          child: halfCirclePurple,
          top: mqs.getPercentageHeight(8),
          right: 0,
        ),
        Positioned(
          child: snake,
          top: mqs.getPercentageHeight(45),
          right: 0,
        )
      ],
    ));
  }
}

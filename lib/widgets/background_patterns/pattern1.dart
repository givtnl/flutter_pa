import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/background_patterns/MediaQueryService.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundPattern1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mqs = MediaQueryService.getInstance(context);

    final Widget ellipse = SvgPicture.asset('assets/svg/ellipse 25.svg');
    final Widget arrow = SvgPicture.asset('assets/svg/Vector 16 (Stroke).svg');
    final Widget rectangle = SvgPicture.asset('assets/svg/Rectangle 1437 (Stroke).svg');
    final Widget halfCircle = SvgPicture.asset('assets/svg/Ellipse 30 (Stroke).svg');

    return Container(
      child: Stack(
        children: [
          Positioned(
            child: ellipse,
            left: 0,
            top: 0,
          ),
          Positioned(
            child: arrow,
            left: mqs.getPercentageWidth(5),
            top: mqs.getPercentageHeight(20),
          ),
          Positioned(
            child: rectangle,
            bottom: 0,
            left: 0,
          ),
          Positioned(
            child: halfCircle,
            top: mqs.getPercentageHeight(50),
            right: 0,
          ),
        ],
      ),
    );
  }
}

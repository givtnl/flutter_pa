import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/background_patterns/MediaQueryService.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundPattern3 extends StatelessWidget {
  const BackgroundPattern3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mqs = MediaQueryService.getInstance(context);

    final Widget halfCirclePurple = SvgPicture.asset('assets/svg/pattern3/Ellipse 23 (Stroke).svg');
    final Widget snake = SvgPicture.asset('assets/svg/pattern3/path (Stroke).svg');
    final Widget ellipse = SvgPicture.asset('assets/svg/pattern3/ellipse 25.svg');
    final Widget arrowGreen = SvgPicture.asset('assets/svg/pattern3/Vector 16 (Stroke).svg');
    final Widget rightRectangle = SvgPicture.asset('assets/svg/pattern3/Rectangle 1437 (Stroke).svg');

    return Container(
      child: Stack(
        children: [
          Positioned(
            child: ellipse,
            top: 0,
            right: 0,
          ),
          Positioned(
            child: halfCirclePurple,
            top: mqs.getPercentageHeight(8, "halve cirkel paars"),
            left: 0,
          ),
          Positioned(
            child: arrowGreen,
            top: mqs.getPercentageHeight(16, "pijl"),
            right: mqs.getPercentageWidth(6, "pijl"),
          ),
          Positioned(
            child: rightRectangle,
            bottom: 0,
            right: 0,
          ),
          Positioned(
            child: snake,
            top: mqs.getPercentageHeight(45, "slangetje"),
            left: 0,
          )
        ],
      ),
    );
  }
}

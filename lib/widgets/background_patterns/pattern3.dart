import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundPattern3 extends StatelessWidget {
  const BackgroundPattern3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg4 = SvgPicture.asset('assets/svg/pattern3/Ellipse 23 (Stroke).svg');
    final Widget svg5 = SvgPicture.asset('assets/svg/pattern3/path (Stroke).svg');
    final Widget svg1 = SvgPicture.asset('assets/svg/pattern3/ellipse 25.svg');
    final Widget svg2 = SvgPicture.asset('assets/svg/pattern3/Vector 16 (Stroke).svg');
    final Widget svg3 = SvgPicture.asset('assets/svg/pattern3/Rectangle 1437 (Stroke).svg');

    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              svg4,
              svg5,
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              svg1,
              svg2,
              svg3,
            ],
          )
        ],
      ),
    );
  }
}

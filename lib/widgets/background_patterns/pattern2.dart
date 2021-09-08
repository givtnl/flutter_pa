import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgrounPattern2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget svg1 = SvgPicture.asset('assets/svg/pattern2/ellipse 25.svg');
    final Widget svg2 = SvgPicture.asset('assets/svg/pattern2/Ellipse 30.svg');
    final Widget svg3 = SvgPicture.asset('assets/svg/Vector 16 (Stroke).svg');
    final Widget svg4 = SvgPicture.asset('assets/svg/Rectangle 1437 (Stroke).svg');

    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 25.0),
                child: svg1,
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: svg2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

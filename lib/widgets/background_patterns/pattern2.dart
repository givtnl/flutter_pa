import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundPattern2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget svg1 = SvgPicture.asset('assets/svg/pattern2/ellipse 25.svg');
    final Widget svg2 = SvgPicture.asset('assets/svg/pattern2/Ellipse 30.svg');
    final Widget svg3 = SvgPicture.asset('assets/svg/pattern2/Ellipse 24.svg');
    final Widget svg4 = SvgPicture.asset('assets/svg/pattern2/Ellipse 23 (Stroke).svg');
    final Widget svg5 = SvgPicture.asset('assets/svg/pattern2/path (Stroke).svg');

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
          Expanded(
            child: Container(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 65.0, right: 55.0),
                child: svg3,
              ),
              svg4,
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: svg5,
              )
            ],
          ),
        ],
      ),
    );
  }
}

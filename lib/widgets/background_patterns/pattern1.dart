import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundPattern1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Widget svg1 = SvgPicture.asset('assets/svg/ellipse 25.svg');
    final Widget svg2 = SvgPicture.asset('assets/svg/Vector 16 (Stroke).svg');
    final Widget svg3 = SvgPicture.asset('assets/svg/Rectangle 1437 (Stroke).svg');
    final Widget svg4 = SvgPicture.asset('assets/svg/Ellipse 30 (Stroke).svg');

    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              svg1,
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: svg2,
              ),
              Expanded(
                child: Container(),
              ),
              svg3,
            ],
          ),
          Expanded(child: Container(),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: svg4,
              ),
            ],
          )
        ],
      ),
    );
  }
}

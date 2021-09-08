import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg1 = SvgPicture.asset('assets/svg/ellipse 25.svg');
    final Widget svg2 = SvgPicture.asset('assets/svg/Vector 16 (Stroke).svg');
    final Widget svg3 = SvgPicture.asset('assets/svg/Rectangle 1437 (Stroke).svg');

    return Container(
      child: Column(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String assetName = 'assets/svg/ellipse 25.svg';
    final Widget svg = SvgPicture.asset(
        assetName
    );

    return Container(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                svg
              ],
            ),
          ],
        ),
      ),
    );
  }
}

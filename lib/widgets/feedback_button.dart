import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class FeedbackButton extends StatelessWidget {
  late final String name;
  late final VoidCallback onClick;

  FeedbackButton(this.name, this.onClick);

  @override
  Widget build(BuildContext context) {
    var test = MediaQuery.of(context).size.width > 360;

    return GestureDetector(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          child: SvgPicture.asset(
            'assets/svg/feedback-modal/' + name + '.svg',
          ),
        ),
      ),
      onTap: onClick,
    );
  }
}

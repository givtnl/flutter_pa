import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/UserFeedback.dart';
import 'package:flutter_svg/svg.dart';

class FeedbackButton extends StatelessWidget {
  late final UserFeedback feedback;
  late final Function onClick;

  FeedbackButton(this.feedback, this.onClick);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          child: SvgPicture.asset(
            'assets/svg/feedback-modal/' + feedback.toString() + '.svg',
          ),
        ),
      ),
      onTap: () {
        onClick(feedback);
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/models/UserFeedback.dart';
import 'package:flutter_svg/svg.dart';

import 'feedback_button.dart';

class FeedbackWidget extends StatelessWidget {
  late final bool isBiggerThan360;
  final VoidCallback closeModal;
  final Function giveFeedback;

  FeedbackWidget(this.closeModal, this.giveFeedback);

  @override
  Widget build(BuildContext context) {
    isBiggerThan360 = MediaQuery.of(context).size.width > 360;

    List<FeedbackButton> buttons = UserFeedback.values.map((opinion) => FeedbackButton(opinion, giveFeedback)).toList();

    return Stack(
      children: [
        GestureDetector(
          onTap: closeModal,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              color: Theme.of(context).backgroundColor.withOpacity(.75),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: isBiggerThan360 ? 310 : MediaQuery.of(context).size.width - 60,
            height: isBiggerThan360 ? 310 : MediaQuery.of(context).size.width - 60,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 8,
                    blurRadius: 15,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: SvgPicture.asset(
                          'assets/svg/krus.svg',
                        ),
                      ),
                      onTap: closeModal,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          S.of(context).feedbackWidget_title,
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        S.of(context).feedbackWidget_title,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: buttons,
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}

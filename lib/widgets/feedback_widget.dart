import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'feedback_button.dart';

class FeedbackWidget extends StatelessWidget {
  late final bool isBiggerThan360;
  final VoidCallback closeModal;

  FeedbackWidget(this.closeModal);

  @override
  Widget build(BuildContext context) {
    isBiggerThan360 = MediaQuery.of(context).size.width > 360;
    List<String> opinions = [
      'very-sad',
      'sad',
      'neutral',
      'happy',
      'very-happy',
    ];
    List<FeedbackButton> buttons =
        opinions.map((opinion) => FeedbackButton(opinion, closeModal)).toList();

    return Stack(
      children: [
        GestureDetector(
          onTap: closeModal,
          child: Container(
            color: Theme.of(context).backgroundColor.withOpacity(.75),
          ),
        ),
        Center(
          child: SizedBox(
            width:
                isBiggerThan360 ? 300 : MediaQuery.of(context).size.width - 60,
            height:
                isBiggerThan360 ? 300 : MediaQuery.of(context).size.width - 60,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/svg/krus.svg',
                      ),
                      onTap: closeModal,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Wat vind je van de Givt Wizard?",
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Hoe zou je je ervaring met de Givt Wizard beoordelen?",
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'accent_rounded_button.dart';

class FeedbackEmailWidget extends StatefulWidget {
  final Function closeModal;

  FeedbackEmailWidget(this.closeModal);

  @override
  State<FeedbackEmailWidget> createState() => _FeedbackEmailWidgetState();
}

class _FeedbackEmailWidgetState extends State<FeedbackEmailWidget> {
  late final bool isBiggerThan360;

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isBiggerThan360 = MediaQuery.of(context).size.width > 360;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            this.widget.closeModal();
          },
          child: Container(
            color: Theme.of(context).backgroundColor.withOpacity(.75),
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
                      child: SvgPicture.asset(
                        'assets/svg/krus.svg',
                      ),
                      onTap: () {
                        this.widget.closeModal();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            "Jouw feedback geeft ons richting",
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          "Vul je emailadres in en we contacteren je voor een gesprekje.",
                          style: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: TextField(
                            controller: emailController,
                            decoration: new InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(233, 237, 242, 1),
                              hintText: 'Username',
                              contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.only(bottomRight: Radius.circular(25)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.only(bottomRight: Radius.circular(25)),
                              ),
                            ),
                          ),
                        ),
                        AccentRoundedButton("Ik wiln elpen", () {
                          widget.closeModal();
                        }, Theme.of(context).buttonColor, true),
                      ],
                    ),
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
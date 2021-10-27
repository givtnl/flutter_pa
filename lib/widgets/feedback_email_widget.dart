import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_svg/svg.dart';

import 'accent_rounded_button.dart';

class FeedbackEmailWidget extends StatefulWidget {
  final Function sendFeedback;
  final VoidCallback closeModal;

  FeedbackEmailWidget(this.sendFeedback, this.closeModal);

  @override
  State<FeedbackEmailWidget> createState() => _FeedbackEmailWidgetState();
}

class _FeedbackEmailWidgetState extends State<FeedbackEmailWidget> {

  bool isBiggerThan360 = false;

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
          onTap: this.widget.closeModal,
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
                      onTap: this.widget.closeModal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            S.of(context).feedbackEmailWidget_title,
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          S.of(context).feedbackEmailWidget_subTitle,
                          style: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Form(
                            autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: validateEmail,
                              controller: emailController,
                              decoration: new InputDecoration(
                                errorText: null,
                                errorStyle: TextStyle(height: 0),
                                filled: true,
                                fillColor: Color.fromRGBO(233, 237, 242, 1),
                                hintText: 'Email',
                                contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.red),
                                  borderRadius: new BorderRadius.only(bottomRight: Radius.circular(25)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.red),
                                  borderRadius: new BorderRadius.only(bottomRight: Radius.circular(25)),
                                ),
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
                        ),
                        AccentRoundedButton(S.of(context).feedbackEmailWidget_mainButton, () {
                          if (validateEmail(emailController.text) == null)
                            widget.sendFeedback(emailController.text);
                          else
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Enter valid email please."),
                              duration: Duration(seconds: 2),
                            ));
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

  String? validateEmail(String? value) {
    RegExp regex = new RegExp("(?:[a-z0-9A-Z!#\$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9A-Z!#\$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-zA-Z0-9-]*[a-zA-Z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])");
    if (value == null || !regex.hasMatch(value))
      return "";
    else
      return null;
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/intro';

  @override
  Widget build(BuildContext context) {
    var questionnaireProvider = Provider.of<QuestionnaireProvider>(context, listen: false);
     var screen = TrackedScreen(
      screenName: 'IntroScreen',
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: BigText(S.of(context).introText),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: BlueButton(
                    label: S.of(context).introButton,
                    tapped: () {
                      // questionnaireProvider.prepareNextScreen();
                      Navigator.of(context).pushNamed("/choice");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return new FutureBuilder(
        future:  questionnaireProvider.loadQuestions(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return screen;
            case ConnectionState.active:
            case ConnectionState.waiting:
            return Container(
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 100),
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(36, 106, 177, 1),
                ),
              ),
            );
            case ConnectionState.none:
              print("none");
              return Container();
              break;
          }
        });
  }
}

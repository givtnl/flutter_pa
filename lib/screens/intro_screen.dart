import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/generated/l10n.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/intro';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuestionsProvider>(context);
    return TrackedScreen(
      screenName: 'IntroScreen',
      child: Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
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
                      var question = provider.nextQuestion;
                      if (question != null)
                        Navigator.of(context).pushNamed(QuestionScreen.routeName, arguments: question.id);
                      else
                        Navigator.of(context).pushNamed(SuggestionsScreen.routeName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

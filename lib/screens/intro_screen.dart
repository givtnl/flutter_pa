import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {

  static const String routeName = '/intro';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuestionsProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: BigText("Kom er achter welke doelen aansluiten bij jouw waarden, normen en identiteit."),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlueButton(
                label: "Naar de keuzewijzer!",
                tapped: () {
                  var question = provider.nextQuestion;
                  if (question != null)
                    Navigator.of(context).pushNamed(QuestionScreen.routeName, arguments: question.id);
                  else
                    Navigator.of(context).pushNamed(SuggestionsScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

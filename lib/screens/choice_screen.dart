import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/categories_container.dart';
import 'package:flutter_app/widgets/statement_container.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';

class ChoiceScreen extends StatefulWidget {
  static const String routeName = '/choice';
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  var body;

  @override
  Widget build(BuildContext context) {
    var questionnaireProvider = Provider.of<QuestionnaireProvider>(context);
var userProvider =Provider.of<UserProvider>(context);
    if (!questionnaireProvider.isCompleted) {
      body = (questionnaireProvider.currentScreenType ==
          ChoiceScreenType.statement)
          ? StatementContainer()
          : CategoriesContainer();


    }

    return TrackedScreen(
      screenName: 'ChoiceScreen',
      child: WillPopScope(
        onWillPop: () {return questionnaireProvider.preparePreviousScreen();},
        child: Scaffold(
          backgroundColor: Color.fromRGBO(222, 233, 243, 1),
          body: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 10,
                    child: Stack(
                      children: [
                        FractionallySizedBox(
                          heightFactor: 1,
                          widthFactor:
                              questionnaireProvider.currentProgress / 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(36, 106, 177, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  body,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: MediaQuery.of(context).size.height * .04),
                    child: BlueButton(
                      label: 'volgende',
                      tapped: () async {
                        await  questionnaireProvider.saveQuestion(userProvider.userName);
                        questionnaireProvider.prepareNextScreen();

                        if (questionnaireProvider.isCompleted) {
                          Navigator.of(context).pushNamed(SuggestionsScreen.routeName);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

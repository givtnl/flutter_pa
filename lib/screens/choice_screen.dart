import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/matches_screen.dart';
import 'package:flutter_app/widgets/background_widget.dart';
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
    var userProvider = Provider.of<UserProvider>(context);
    if (!questionnaireProvider.isCompleted) {
      body = (questionnaireProvider.currentScreenType == ChoiceScreenType.statement) ? StatementContainer() : CategoriesContainer();
    }

    return TrackedScreen(
      screenName: 'ChoiceScreen',
      child: WillPopScope(
        onWillPop: () async {
          // do not allow the user to go back to prevent shit from happening
          return false;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Stack(children: [
            BackgroundWidget(1),
            SafeArea(
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
                            widthFactor: questionnaireProvider.currentProgress / 100,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
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
                        label: S.of(context).nextButton,
                        tapped: () async {
                          MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "NEXT"});

                          await questionnaireProvider.saveQuestion(userProvider.userName);
                          questionnaireProvider.prepareNextScreen();

                          if (questionnaireProvider.isCompleted) {
                            Navigator.of(context).pushNamed(MatchesScreen.routeName);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

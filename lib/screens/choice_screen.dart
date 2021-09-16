import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/matches_screen.dart';
import 'package:flutter_app/widgets/background_widget.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:flutter_app/widgets/categories_container.dart';
import 'package:flutter_app/widgets/slideable_container/slideable_container.dart';
import 'package:flutter_app/widgets/statement_container.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';

class ChoiceScreen extends StatefulWidget {
  static const String routeName = '/choice';

  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  var body;

  final GlobalKey<SlideableContainerState> key = GlobalKey<SlideableContainerState>();

  @override
  Widget build(BuildContext context) {
    var questionnaireProvider = Provider.of<QuestionnaireProvider>(context, listen: false);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
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
            BackgroundWidget(),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 15,
                      child: Stack(
                        children: [
                          FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: questionnaireProvider.currentProgress / 100,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    SlideableContainer(key: key, widgetsToShow: [StatementContainer(), StatementContainer(),],),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                      child: MainButton(
                        label: S.of(context).nextButton,
                        tapped: () async {
                          MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "NEXT"});

                          await questionnaireProvider.saveQuestion(userProvider.userName);
                          questionnaireProvider.prepareNextScreen();

                          key.currentState?.showNextWidget();

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

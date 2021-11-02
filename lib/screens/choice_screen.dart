import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/matches_screen.dart';
import 'package:flutter_app/widgets/background_patterns/pattern1.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:flutter_app/widgets/questionnaire_body_widget.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ChoiceScreen extends StatefulWidget {
  static const String routeName = '/choice';

  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    var questionnaireProvider = Provider.of<QuestionnaireProvider>(context, listen: false);
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    var size = MediaQuery.of(context).size;
    var portrait = size.height > size.width;

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
            BackgroundPattern1(),
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
                          Consumer<QuestionnaireProvider>(builder: (_, a, ctx) {
                            return FractionallySizedBox(
                              heightFactor: 1,
                              widthFactor: questionnaireProvider.currentProgress / 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).buttonColor,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    portrait ? Container() : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 80.0),
                      child: SvgPicture.asset(
                        'assets/svg/givt-logo.svg',
                        height: 30,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    QuestionnaireBody(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: MediaQuery.of(context).size.height > 580 ? 50 : MediaQuery.of(context).size.height * .02),
                      child: MainButton(
                        label: S.of(context).nextButton,
                        tapped: () async {
                          await MixpanelManager.mixpanel.track("STATEMENT_ANSWER", properties: {
                            "STATEMENT_ID": questionnaireProvider.getCurrentQuestion?.id ?? "unknown"
                          });
                          await questionnaireProvider.saveQuestion(userProvider.userName);
                          questionnaireProvider.prepareNextScreen();
                          await MixpanelManager.mixpanel.track("STATEMENT_LOAD", properties: {
                            "STATEMENT_ID": questionnaireProvider.getCurrentQuestion?.id ?? "unknown"
                          });

                          if (questionnaireProvider.isCompleted) {
                            Navigator.of(context).pushNamed(MatchesScreen.routeName);
                          }
                        },
                        height: 45,
                        fontSize: 16,
                        webWidth: 275.0,
                      ),
                    ),
                    SizedBox(
                      height: kIsWeb && MediaQuery.of(context).size.height > 950 ? MediaQuery.of(context).size.height * .2 : 0,
                    ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/matches_screen.dart';
import 'package:provider/provider.dart';

import 'big_text.dart';

class StatementContainer extends StatefulWidget {
  @override
  _StatementContainerState createState() => _StatementContainerState();
}

class _StatementContainerState extends State<StatementContainer> {
  @override
  Widget build(BuildContext context) {
    final _valueTexts = [
      S.of(context).choiceScreen_totallyDisagree,
      S.of(context).choiceScreen_disagree,
      S.of(context).choiceScreen_neutral,
      S.of(context).choiceScreen_agree,
      S.of(context).choiceScreen_totallyAgree
    ];
    var provider = Provider.of<QuestionnaireProvider>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 50,
              vertical: MediaQuery.of(context).size.height * .05),
          child: BigText(provider.getCurrentQuestionTranslation),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * .005,
              left: 25,
              right: 25),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 3,
            ),
            child: Slider(
              inactiveColor: Theme.of(context).primaryColor,
              activeColor: Theme.of(context).primaryColor,
              value: provider.currentSelectedStatementAnswer,
              min: 0,
              max: 4,
              divisions: 4,
              label:
                  _valueTexts[provider.currentSelectedStatementAnswer.toInt()],
              onChanged: (double value) {
                setState(() {
                  provider.setCurrentStatementValue(value);
                });
              },
              onChangeEnd: (value) {
                MixpanelManager.mixpanel.track("SLIDER_CHANGED", properties: {
                  "STATEMENT_ID": "${provider.getCurrentQuestion!.id}",
                  "VALUE": "${value.toStringAsFixed(0)}"
                });
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * .05,
              left: 50,
              right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  S.of(context).choiceScreen_totallyDisagree,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                  ),
                ),
              ),
              Flexible(child: Container()),
              //necessary because otherwise the 'helemaal niet akkoord' doesn't get a line break
              Flexible(
                child: Text(
                  S.of(context).choiceScreen_totallyAgree,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                alignment: AlignmentDirectional.centerStart,
              ),
              onPressed: () {
                MixpanelManager.mixpanel
                    .track("CLICKED", properties: {"BUTTON_NAME": "SKIP"});
                provider.skipCurrentQuestion();
                if (provider.isCompleted) {
                      Navigator.of(context).pushNamed(MatchesScreen.routeName);
                } else {
                  provider.prepareNextScreen();
                }
              },
              child: Text(
                S.of(context).choiceScreen_skip,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

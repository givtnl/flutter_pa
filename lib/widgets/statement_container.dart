import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
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
    ].map((e) => e.replaceFirst(" ", "\n")).toList();
    // did map and replace above cus im lazy and dont want to change the terms
    // words should be on split lines according to design.

    var provider = Provider.of<QuestionnaireProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          BigText(provider.getCurrentQuestionTranslation),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20),
            child: InkWell(
              child: Text(
                'overslaan',
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          /*Container(
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                alignment: AlignmentDirectional.centerStart,
              ),
              onPressed: () {
                MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "SKIP"});
                provider.skipCurrentQuestion();
                if (provider.isCompleted) {
                  Navigator.of(context).pushNamed(MatchesScreen.routeName);
                } else {
                  provider.prepareNextScreen();
                }
              },
              child: Text(
                S.of(context).choiceScreen_skip.toLowerCase(),
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ),*/
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: SliderTheme(
                data: SliderTheme.of(context),
                child: Slider(
                  divisions: 4,
                  min: 0,
                  max: 4,
                  value: provider.currentSelectedStatementAnswer,
                  label: _valueTexts[provider.currentSelectedStatementAnswer.toInt()],
                  onChanged: (double value) {
                    setState(() {
                      provider.setCurrentStatementValue(value);
                    });
                  },
                  onChangeEnd: (value) {
                    MixpanelManager.mixpanel.track("SLIDER_CHANGED", properties: {"STATEMENT_ID": "${provider.getCurrentQuestion!.id}", "VALUE": "${value.toStringAsFixed(0)}"});
                  },
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  S.of(context).choiceScreen_totallyDisagree,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Flexible(child: Container()),
              //necessary because otherwise the 'helemaal niet akkoord' doesn't get a line break
              Flexible(
                child: Text(
                  S.of(context).choiceScreen_totallyAgree,
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

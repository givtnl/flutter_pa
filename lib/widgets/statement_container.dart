import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/screens/matches_screen.dart';
import 'package:provider/provider.dart';

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
      S.of(context).choiceScreen_totallyAgree,
    ].map((e) => e.replaceFirst(" ", "\n")).toList();
    // did map and replace above cus im lazy and dont want to change the terms
    // words should be on split lines according to design.
    var provider = Provider.of<QuestionnaireProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.5),
            child: AutoSizeText(
              provider.getCurrentQuestionTranslation,
              style: Theme.of(context).textTheme.headline1,
              maxLines: 5,
              wrapWords: false,
            ),
          ),
          if (provider.getCurrentQuestion != null && provider.getCurrentQuestion!.metaTags != null && provider.getCurrentQuestion!.metaTags["explanation_nl"] != null)
            Padding(
              padding: EdgeInsets.only(top: 10, left: 4.5, right: 4.5),
              child: Text(
                provider.getCurrentQuestion!.metaTags["explanation_nl"].toString(),
                style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.5),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20),
              child: InkWell(
                child: Text(
                  S.of(context).choiceScreen_skip.toLowerCase(),
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.start,
                ),
                onTap: () {
                  MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "SKIP"});
                  provider.skipCurrentQuestion();
                  if (provider.isCompleted) {
                    Navigator.of(context).pushNamed(MatchesScreen.routeName);
                  } else {
                    provider.prepareNextScreen();
                  }
                },
              ),
            ),
          ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    S.of(context).choiceScreen_disagree,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Flexible(child: Container()),
                //necessary because otherwise the 'helemaal niet akkoord' doesn't get a line break
                // TODO EDIT: this might not be necessary anymore, because changed now to 'disagree' and 'agree'
                Flexible(
                  child: Text(
                    S.of(context).choiceScreen_agree,
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

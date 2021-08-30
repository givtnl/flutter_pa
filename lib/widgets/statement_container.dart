import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:provider/provider.dart';

import 'big_text.dart';

class StatementContainer extends StatefulWidget {
  @override
  _StatementContainerState createState() => _StatementContainerState();
}


class _StatementContainerState extends State<StatementContainer> {
  final _valueTexts = ["Helemaal oneens", "Niet akkoord", "Neutraal", "Akkoord", "Helemaal eens"];

  String get valueText {
    return _valueTexts[_sliderValue.round()];
  }

  double _sliderValue = 2;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuestionnaireProvider>(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: MediaQuery.of(context).size.height * .05),
          child: BigText(provider.getCurrentQuestionTranslation),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .005, left: 25, right: 25),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 3,
            ),
            child: Slider(
              inactiveColor: Color.fromRGBO(36, 106, 177, 1),
              activeColor: Color.fromRGBO(36, 106, 177, 1),
              value: _sliderValue,
              min: 0,
              max: 4,
              divisions: 4,
              label: valueText,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              onChangeEnd: (_) {
                MixpanelManager.mixpanel.track("SLIDER_CHANGED", properties: {"STATEMENT_ID": "${provider.getCurrentQuestion!.id}", "VALUE": "${_sliderValue.toStringAsFixed(0)}"});
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .05, left: 50, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Helemaal niet akkoord",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color.fromRGBO(36, 106, 177, 1),
                    fontSize: 12,
                  ),
                ),
              ),
              Flexible(child: Container()), //necessary because otherwise the 'helemaal niet akkoord' doesn't get a line break
              Flexible(
                child: Text(
                  "Helemaal akkoord",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color.fromRGBO(36, 106, 177, 1),
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
                MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "SKIP"});
                //provider.skipQuestion(question.id);
                provider.skipCurrentQuestion();
                provider.prepareNextScreen();
              },
              child: Text(
                "overslaan",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(36, 106, 177, 1),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:provider/provider.dart';

import 'big_text.dart';

class GivtSlider extends StatefulWidget {
  @override
  _GivtSliderState createState() => _GivtSliderState();
}


class _GivtSliderState extends State<GivtSlider> {
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
          padding: const EdgeInsets.all(50.0),
          child: BigText(provider.getCurrentQuestionTranslation),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 25, right: 25),
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
          padding: const EdgeInsets.only(bottom: 50, left: 50, right: 50),
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
          padding: const EdgeInsets.symmetric(horizontal: 50),
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
                Navigator.of(context).pushNamed(provider.getNextRouteName);
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

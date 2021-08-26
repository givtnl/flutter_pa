import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';

class ChoiceScreen extends StatefulWidget {
  static const String routeName = '/choice';

  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    var questioinnaireProvider = Provider.of<QuestionnaireProvider>(context);

    return TrackedScreen(
      screenName: 'QuestionScreen',
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
                        widthFactor: questioinnaireProvider.currentProgress/100,
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
                Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: questioinnaireProvider.isCompleted ? BigText("Completed") : questioinnaireProvider.isFoo ? BigText("Foo") : BigText("Bar"),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: BlueButton(
                    label: "yeet",
                    tapped: () async {
                      // MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "NEXT"});
                      // await provider.saveQuestion(_sliderValue.round(), userProvider.userName);
                      // provider.prepareNextScreen();
                      //Navigator.of(context).push(AppRouting.getNextScreen(provider.isCompleted, provider.isCompleted ? QuestionType.number0 : provider.getCurrentQuestion!.type));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


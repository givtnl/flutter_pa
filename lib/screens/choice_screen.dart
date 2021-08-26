import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/categories_container.dart';
import 'package:flutter_app/widgets/givt_slider.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';

class ChoiceScreen extends StatefulWidget {
  static const String routeName = '/choice';
  ChoiceScreenType screenType = ChoiceScreenType.statement;

  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {

  var statement = GivtSlider();
  var categories = CategoriesContainer();

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
                        widthFactor:
                            questioinnaireProvider.currentProgress / 100,
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
                questioinnaireProvider.currentScreenType == ChoiceScreenType.statement ?
                    statement : categories,
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: BlueButton(
                    label: 'volgende',
                    tapped: () async {

                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

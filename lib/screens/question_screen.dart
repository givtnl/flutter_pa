import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/category_card.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatefulWidget {
  static const String routeName = '/question';

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final _valueTexts = ["Helemaal niet akkoord", "Niet akkoord", "Neutraal", "Akkoord", "Helemaal akkoord"];

  String get valueText {
    return _valueTexts[_sliderValue.round()];
  }

  double _sliderValue = 2;

  Widget questionScreen(QuestionnaireProvider provider, UserProvider userProvider) {
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
                        widthFactor: provider.currentProgress/100,
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
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: BlueButton(
                    label: "yeet",
                    tapped: () async {
                      MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "NEXT"});
                      await provider.saveQuestion(_sliderValue.round(), userProvider.userName);
                      provider.prepareNextScreen();
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

  Widget categoryScreen(QuestionnaireProvider provider, UserProvider userProvider, List<CategoryCard> cards) {
    return TrackedScreen(
      screenName: 'Categories',
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
                          provider.currentProgress / 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(36, 106, 177, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child:
                    BigText('Welke van deze thema’s vind jij belangrijk?'),
                  ),
                  Container(height: 350, child: ListView(children: cards)),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: BlueButton(
                      label: 'volgende',
                      tapped: () async {
                        cards
                            .where((element) => element.selected)
                            .forEach((element)  {
                          provider
                              .addCategoryAnswer(cards.indexOf(element));
                        });
                        // show ze spinner,
                        await provider.saveCategories(userProvider.userName);
                        //hide ze spinner
                        provider.prepareNextScreen();
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuestionnaireProvider>(context);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    final categories = provider.getCurrentCategoriesTranslation;

    List<CategoryCard> cards =
    categories.map((cat) => CategoryCard(cat, cat, cat)).toList();

    return provider.getNextRouteName == QuestionScreen.routeName ? questionScreen(provider, userProvider) : categoryScreen(provider, userProvider, cards);
  }
}
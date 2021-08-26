import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/category_card.dart';
import 'package:flutter_app/widgets/givt_slider.dart';
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
                GivtSlider(),
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

    return provider.determineNextScreen == ChoiceScreenType.statement ? questionScreen(provider, userProvider) : categoryScreen(provider, userProvider, cards);
  }
}
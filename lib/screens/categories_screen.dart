import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/providers/categories_provider.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/category_card.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    MixpanelManager.mixpanel.track("Category screen showing");
    final provider = Provider.of<CategoryProvider>(context);
    final questionnaireProvider = Provider.of<QuestionnaireProvider>(context);
    final categories = provider.nextFourCategories(questionnaireProvider.screenNumber, questionnaireProvider.numberOfQuestionScreensPerCategoryScreen);

    var questionId = ModalRoute.of(context)!.settings.arguments as int;

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
                      widthFactor: questionnaireProvider.currentProgress,
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
                child: BigText('Welke van deze thema’s vind jij belangrijk?'),
              ),
              Container(
                  height: 350,
                  child: ListView(
                    children: categories.map((category) {
                      return CategoryCard(
                          category.id, category.category, category.icon);
                    }).toList(),
                  ),
                ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: BlueButton(
                  label: 'volgende',
                  tapped: () {
                    print(questionId);
                    questionnaireProvider.incrementScreenNumber();
                    if (questionnaireProvider.screenNumber >=
                        questionnaireProvider.totalNumberOfScreens) {
                      Navigator.of(context)
                          .pushNamed(SuggestionsScreen.routeName);
                    } else {
                      Navigator.of(context).pushNamed(QuestionScreen.routeName,
                          arguments: questionId);
                    }
                  },
                ),)
              ],
            ),
          ),
        )
      ),
    );
  }
}

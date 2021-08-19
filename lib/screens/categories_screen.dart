import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    final questionnaireProvider = Provider.of<QuestionnaireProvider>(context);

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
                      widthFactor: questionnaireProvider.currentProgress/100,
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
                  child: Container()/*ListView(
                    children: categories.map((category) {
                      return CategoryCard(
                          category.id, category.category, category.icon);
                    }).toList(),
                  ),*/
                ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: BlueButton(
                  label: 'volgende',
                  tapped: () {
                    
                    questionnaireProvider.showNextScreen(context);
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

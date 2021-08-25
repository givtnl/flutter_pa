import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:flutter_app/widgets/category_card.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionnaireProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final categories = provider.getCurrentCategoriesTranslation;

    List<CategoryCard> cards =
        categories.map((cat) => CategoryCard(cat, cat, cat)).toList();

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
                      tapped: ()  {
                        cards
                            .where((element) => element.selected)
                            .forEach((element)  {
                          provider
                              .addCategoryAnswer(cards.indexOf(element));
                        });
                        // show ze spinner,
                        provider.saveCategories(userProvider.userName);
                        //hide ze spinner
                        provider.prepareNextScreen();
                        Navigator.of(context)
                            .pushNamed(provider.getNextRouteName);
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

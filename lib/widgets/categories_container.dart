import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:provider/provider.dart';

import 'big_text.dart';
import 'category_card.dart';

class CategoriesContainer extends StatelessWidget {

  Widget categoryContainer(cards, context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 35),
          child:
          BigText('Welke van deze thema’s vind jij belangrijk?'),
        ),
        Container(height: MediaQuery.of(context).size.height * .5, child: Column(children: cards)),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionnaireProvider>(context);
    final categories = provider.getCurrentCategoriesTranslation;

    List<CategoryCard> cards =
    categories.map((cat) => CategoryCard(cat, cat, cat)).toList();
    return categoryContainer(cards, context);
  }
}

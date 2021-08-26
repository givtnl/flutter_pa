import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:provider/provider.dart';

import 'big_text.dart';
import 'category_card.dart';

class CategoriesContainer extends StatefulWidget {
  const CategoriesContainer({Key? key}) : super(key: key);

  @override
  _CategoriesContainerState createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {

  Widget categoryContainer(cards) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(50.0),
        child:
        BigText('Welke van deze thema’s vind jij belangrijk?'),
      ),
      Container(height: 350, child: ListView(children: cards)),
      Expanded(child: Container()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionnaireProvider>(context);
    final categories = provider.getCurrentCategoriesTranslation;

    List<CategoryCard> cards =
    categories.map((cat) => CategoryCard(cat, cat, cat)).toList();
    return categoryContainer(cards);
  }
}

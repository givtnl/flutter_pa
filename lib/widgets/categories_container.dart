import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:provider/provider.dart';
import 'category_card.dart';

class CategoriesContainer extends StatelessWidget {
  bool sizeBigEnough = true;

  Widget categoryContainer(cards, context) {

    sizeBigEnough = MediaQuery.of(context).size.height > 500;

    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                S.of(context).categoryScreenTitleQuestion,
                style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: sizeBigEnough ? 24 : 18),
              ),
              SizedBox(height: 15,),
              AutoSizeText(S.of(context).categoryScreenSubtitle,
                style: Theme.of(context).textTheme.subtitle1!,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        Container(child: Column(children: cards)),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionnaireProvider>(context);
    final categories = provider.getCurrentCategoriesTranslation;

    List<CategoryCard> cards = categories.asMap().entries.map((entry) {
      int index = entry.key;
      CategoryCard card = CategoryCard(entry.value, entry.value, entry.value, index);
      return card;
    }).toList();
    return categoryContainer(cards, context);
  }
}

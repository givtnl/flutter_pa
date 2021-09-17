import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:provider/provider.dart';
import 'category_card.dart';

class CategoriesContainer extends StatelessWidget {
  Widget categoryContainer(cards, context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55.0, vertical: 35),
          child: AutoSizeText(
            S.of(context).categoryScreenTitleQuestion,
//            "Welke thema’s vind jij belangrijk?", // TODO: Localize this

            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24),
          ),
        ),
        Container(height: MediaQuery.of(context).size.height * .5, child: Column(children: cards)),
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/givt_icons.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:provider/provider.dart';

import 'custom_box_shadow.dart';

class CategoryCard extends StatefulWidget {
  final String categoryId;
  final String categoryText;
  final String iconText;
  final int index;
  var selected = false;

  CategoryCard(this.categoryId, this.categoryText, this.iconText, this.index);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuestionnaireProvider>(context);

    IconData icon;
    switch (this.widget.iconText) {
      case 'dieren':
        {
          icon = Givt.dieren;
        }
        break;
      case 'natuur en milieu':
        {
          icon = Givt.natuur;
        }
        break;
      case 'onderwijs en wetenschap':
        {
          icon = Givt.onderwijs;
        }
        break;
      case 'religie en levensbeschouwing':
        {
          icon = Givt.religie;
        }
        break;
      case 'gezondheid':
        {
          icon = Givt.gezondheid;
        }
        break;
      case 'welzijn':
        {
          icon = Givt.welzijn;
        }
        break;
      case 'internationale hulp en mensenrechten':
        {
          icon = Givt.hulp;
        }
        break;
      case 'kunst en cultuur':
        {
          icon = Givt.kunst;
        }
        break;
      default:
        {
          icon = Givt.dieren;
        }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 50),
      child: GestureDetector(
        onTap: () {
          setState(() {
            this.widget.selected = !this.widget.selected;
            provider.toggleCategoryAnswer(this.widget.selected, this.widget.index);
            MixpanelManager.mixpanel.track("CATEGORY_SELECTED", properties: {"CATEGORY_ID": "${this.widget.categoryId}"});
          });
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: this.widget.selected ? Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0),
            ),
            boxShadow: this.widget.selected
                ? [
                    CustomBoxShadow(
                      color: Theme.of(context).primaryColor,
                      blurRadius: 5.0,
                      blurStyle: BlurStyle.outer,
                    ),
                  ]
                : [],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      icon,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                      semanticLabel: this.widget.iconText,
                    ),
                  ),
                ),
                Container(
                  width: kIsWeb && MediaQuery.of(context).size.width > 500 ? 300 : MediaQuery.of(context).size.width * .3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: AutoSizeText(
                      widget.categoryText,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

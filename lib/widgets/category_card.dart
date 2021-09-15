import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/p_a_icons_icons.dart';
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
          icon = PAIcons.dieren;
        }
        break;
      case 'natuur en milieu':
        {
          icon = PAIcons.natuur;
        }
        break;
      case 'onderwijs en wetenschap':
        {
          icon = PAIcons.onderwijs;
        }
        break;
      case 'Religie en levensbeschouwing':
        {
          icon = PAIcons.religie;
        }
        break;
      case 'gezondheid':
        {
          icon = PAIcons.gezondheid;
        }
        break;
      case 'welzijn':
        {
          icon = PAIcons.welzijn;
        }
        break;
      case 'internationale hulp en mensenrechten':
        {
          icon = PAIcons.hulp;
        }
        break;
      case 'kunst en cultuur':
        {
          icon = PAIcons.kunst;
        }
        break;
      default:
        {
          icon = PAIcons.dieren;
        }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
      child: GestureDetector(
        onTap: () {
          setState(() {
            this.widget.selected = !this.widget.selected;
            provider.toggleCategoryAnswer(this.widget.selected, this.widget.index);
            MixpanelManager.mixpanel.track("CATEGORY_SELECTED", properties: {"CATEGORY_ID": "${this.widget.categoryId}"});
          });
        },
        child: Container(
          height: 70,
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
                      blurRadius: 10.0,
                      blurStyle: BlurStyle.outer,
                    ),
                  ]
                : [],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
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
                  width: MediaQuery.of(context).size.width * .55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      widget.categoryText,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
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

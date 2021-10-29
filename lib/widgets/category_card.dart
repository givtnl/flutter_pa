import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/givt_icons.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:provider/provider.dart';

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
  var sizeBigEnough = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuestionnaireProvider>(context);

    sizeBigEnough = MediaQuery.of(context).size.height > 500;

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
            MixpanelManager.mixpanel.track("CATEGORY_SELECTED", properties: {
              "CATEGORY_ID": "${this.widget.categoryId}"
            });
          });
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            height: sizeBigEnough ? 60 : 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: this.widget.selected ? Theme.of(context).primaryColor : Colors.white,
              ),
              boxShadow: this.widget.selected
                  ? [
                      new BoxShadow(
                        color: Theme.of(context).primaryColor,
                        blurRadius: 5.0,
                      ),
                    ]
                  : [],
            ),
            child: Padding(
              padding: sizeBigEnough ? EdgeInsets.symmetric(vertical: 5) + EdgeInsets.only(left: 15) : EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizeBigEnough
                      ? Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              icon,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                              semanticLabel: this.widget.iconText,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  sizeBigEnough
                      ? Container(
                          width: kIsWeb && MediaQuery.of(context).size.width > 500 ? 300 : MediaQuery.of(context).size.width * .54,
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
                        )
                      : Container(
                          width: kIsWeb && MediaQuery.of(context).size.width > 500 ? 300 : MediaQuery.of(context).size.width * .54,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Center(
                              child: AutoSizeText(
                                widget.categoryText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

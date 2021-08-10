import 'package:flutter/material.dart';
import 'package:flutter_app/p_a_icons_icons.dart';

class CategoryCard extends StatefulWidget {
  final String categoryText;
  final String iconText;

  CategoryCard(this.categoryText, this.iconText);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final icon;
    switch (this.widget.iconText) {
      case 'dieren':
        {
          icon = PAIcons.dieren;
        }
        break;
      case 'gezondheid':
        {
          icon = PAIcons.gezondheid;
        }
        break;
      case 'hulp':
        {
          icon = PAIcons.hulp;
        }
        break;
      case 'kunst':
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Container(
              decoration: BoxDecoration(
              color: Color.fromRGBO(239, 244, 249, 1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1,
              color: Color.fromRGBO(36, 106, 177, selected ? 1 : 0)),
          boxShadow: selected
          ? [
          BoxShadow(
            color: Color.fromRGBO(36, 106, 177, 1),
            spreadRadius: .2,
            blurRadius: 3,
            offset: Offset(0, 1),
          )
          ]
              : []),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Color.fromRGBO(36, 106, 177, 1),
              size: 30,
              semanticLabel: this.widget.iconText,
            ),
            Container(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  widget.categoryText,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(36, 106, 177, 1),
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    ),)
    ,
    );
  }
}

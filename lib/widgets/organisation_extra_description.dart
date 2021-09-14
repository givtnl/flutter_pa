import 'package:flutter/material.dart';

class OrganisationExtra extends StatelessWidget {
  final String title;
  final String text;

  OrganisationExtra(this.title, this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1,
              children: <TextSpan>[
                TextSpan(text: '$title\n\n'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w900, color: Theme.of(context).accentColor)),
                TextSpan(text: text, style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

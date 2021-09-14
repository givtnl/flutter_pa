import 'package:flutter/material.dart';

class OrganisationTag extends StatelessWidget {
  final String text;
  final bool enabled;

  OrganisationTag(this.text, this.enabled);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
                color: Colors.white.withOpacity(0),
                border: Border.all(width: 1,color: Theme.of(context).accentColor),
                borderRadius: BorderRadius.circular(25),
              ),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        child: Text(
          text.toLowerCase(),
          style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w600, fontSize: 11),
        ),
      ),
    );
  }
}

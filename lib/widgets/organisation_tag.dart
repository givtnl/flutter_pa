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
        decoration: enabled
            ? BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(25),
              )
            : BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(25),
              ),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Text(
          text,
          style: enabled ? TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 11) : TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 11),
        ),
      ),
    );
  }
}

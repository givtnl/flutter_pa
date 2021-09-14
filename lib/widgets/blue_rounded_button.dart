import 'package:flutter/material.dart';

class BlueRoundedButton extends StatelessWidget {

  final String buttonText;
  final VoidCallback clickListener;

  BlueRoundedButton(this.buttonText, this.clickListener);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: clickListener,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).accentColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Text(buttonText, style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AccentRoundedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback clickListener;
  Color buttonColor;

  AccentRoundedButton(this.buttonText, this.clickListener, this.buttonColor);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: clickListener,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        backgroundColor: MaterialStateProperty.all(buttonColor)
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.button!.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

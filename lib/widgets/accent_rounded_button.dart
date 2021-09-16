import 'package:flutter/material.dart';

class AccentRoundedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback clickListener;

  AccentRoundedButton(this.buttonText, this.clickListener);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: clickListener,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor),  
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.button!.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

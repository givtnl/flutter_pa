import 'package:flutter/material.dart';

class AccentRoundedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback clickListener;

  AccentRoundedButton(this.buttonText, this.clickListener);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: clickListener,
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).accentColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.button!.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

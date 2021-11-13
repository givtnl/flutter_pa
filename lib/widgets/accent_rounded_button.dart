import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AccentRoundedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback clickListener;
  Color buttonColor;
  bool isWebsiteButton;

  AccentRoundedButton(this.buttonText, this.clickListener, this.buttonColor, this.isWebsiteButton);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: clickListener,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        backgroundColor: MaterialStateProperty.all(buttonColor)
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          child: Padding(
            padding: isWebsiteButton ? const EdgeInsets.symmetric(horizontal: 18,vertical: 3) : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.button!.copyWith(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}

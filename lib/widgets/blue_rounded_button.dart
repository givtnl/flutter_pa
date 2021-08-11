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
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(36, 106, 177, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(buttonText, style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}

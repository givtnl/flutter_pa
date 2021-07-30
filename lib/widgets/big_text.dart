import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;

  BigText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(50),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(36, 106, 177, 1),
          fontSize: 25,
        ),
      ),
    );
  }
}

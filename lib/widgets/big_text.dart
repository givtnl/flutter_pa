import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/themes/light/theme.dart';

class BigText extends StatelessWidget {
  final String text;

  BigText(this.text);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
        text,
        style: Theme.of(context).textTheme.headline1,
        wrapWords: false,
      );
  }
}

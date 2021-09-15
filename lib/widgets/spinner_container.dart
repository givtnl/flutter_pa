import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/big_text.dart';

class SpinnerContainer extends StatelessWidget {

  late final String text;

  SpinnerContainer(String text) {
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 100),
        child: Center(
          child: Column(
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: BigText("Even geduld."),
              ),
              Text(text, style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}

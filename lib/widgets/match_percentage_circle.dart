import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';

class MatchPercentageCircle extends StatelessWidget {
  late final int percentage;

  MatchPercentageCircle(this.percentage){}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Container(
        width: 50,
        height: 50,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$percentage%",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button,
              ),
              Text(
                S.of(context).matchCircle_match,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white, fontSize: 9),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}

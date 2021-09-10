import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/big_text.dart';

class SpinnerContainer extends StatelessWidget {

  late final bool loadingMatches;

  SpinnerContainer(bool loadingMatches) {
    this.loadingMatches = loadingMatches;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 50),
        child: Center(
          child: Column(
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BigText("Even geduld."),
              ),
              Text(loadingMatches ? "We berekenen je matches!" :  "We halen de vragen op!", style: Theme.of(context).textTheme.subtitle1,)
            ],
          ),
        ),
      ),
    );
  }
}

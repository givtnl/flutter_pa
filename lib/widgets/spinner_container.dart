import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/widgets/background_widget.dart';

class SpinnerContainer extends StatelessWidget {
  late final String text;

  SpinnerContainer(String text) {
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Stack(children: [
        BackgroundWidget(),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 300, left: 50, right: 50),
            child: Center(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: AutoSizeText(
                      S.of(context).loadingTitle,
                      style: Theme.of(context).textTheme.headline1,
                      wrapWords: false,
                    ),
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

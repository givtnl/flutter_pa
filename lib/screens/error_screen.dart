import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/intro_screen.dart';
import 'package:flutter_app/widgets/accent_rounded_button.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';

class ErrorScreen extends StatelessWidget {
  static const String routeName = '/error';

  @override
  Widget build(BuildContext context) {
    // TODO: Localize terms here on this screen
    return TrackedScreen(
      screenName: 'IntroScreen',
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "Er ging iets mis!",
                  style: Theme.of(context).textTheme.headline1,
                  wrapWords: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: AccentRoundedButton("probeer opnieuw", () {
                      Navigator.of(context).pushNamed(IntroScreen.routeName);
                    }, Theme.of(context).buttonColor, false),
                  ),
                ]
              ),
            ),
          ),
        ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';

class ErrorScreen extends StatelessWidget {
  static const String routeName = '/error';

  @override
  Widget build(BuildContext context) {
    return TrackedScreen(
        screenName: 'IntroScreen',
        child: Scaffold(
            backgroundColor: Theme
                .of(context)
                .backgroundColor,
            body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText("Er ging iets mis!"),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('Herstart de applicatie.', style: Theme
                            .of(context)
                            .textTheme
                            .subtitle1,),
                      )
                    ],
                  ),
                )
            )
        )
    );
  }
}

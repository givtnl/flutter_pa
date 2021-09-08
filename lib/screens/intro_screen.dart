import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/intro';

  @override
  Widget build(BuildContext context) {
    var questionnaireProvider =
        Provider.of<QuestionnaireProvider>(context, listen: false);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var screen = TrackedScreen(
      screenName: 'IntroScreen',
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.of(context).introTitle,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        S.of(context).introText,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: MainButton(
                    label: S.of(context).introButton,
                    tapped: () {
                      final DateTime now = DateTime.now();
                      final DateFormat formatter =
                          DateFormat("yyyy-MM-dd hh:mm");
                      final String formatted = formatter.format(now);
                      userProvider.userName = formatted;
                      if (kDebugMode) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("DEBUG MODE : ${userProvider.userName}"),
                          duration: Duration(seconds: 2),
                        ));
                        print(userProvider.userName);
                      }
                      Navigator.of(context).pushNamed("/choice");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return new FutureBuilder(
        future: questionnaireProvider.loadQuestions(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return screen;
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Container(
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 300, horizontal: 100),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              );
            case ConnectionState.none:
              print("none");
              return Container();
              break;
          }
        });
  }
}

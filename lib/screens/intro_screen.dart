import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/choice_screen.dart';
import 'package:flutter_app/screens/error_screen.dart';
import 'package:flutter_app/widgets/background_widget.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:flutter_app/widgets/spinner_container.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/intro';

  @override
  Widget build(BuildContext context) {
    var questionnaireProvider = Provider.of<QuestionnaireProvider>(context, listen: false);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var screen = TrackedScreen(
      screenName: 'IntroScreen',
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundWidget(),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 80.0),
                  child: SvgPicture.asset('assets/svg/givt-logo.svg', height: 30,),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).introTitle,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: 20,
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
                      final DateFormat formatter = DateFormat("yyyy-MM-dd hh:mm");
                      final String formatted = formatter.format(now);
                      userProvider.userName = formatted;
                      if (kDebugMode) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("DEBUG MODE : ${userProvider.userName}"),
                          duration: Duration(seconds: 2),
                        ));
                        print(userProvider.userName);
                      }
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => ChoiceScreen(),
                        ),
                      );
                    },
                    fontSize: 16,
                    height: 45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return new FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2), () => questionnaireProvider.loadQuestions()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return screen;
            case ConnectionState.active:
            case ConnectionState.waiting:
              return SpinnerContainer("We halen de vragen op!");
            case ConnectionState.none:
              return ErrorScreen();
              break;
          }
        });
  }
}

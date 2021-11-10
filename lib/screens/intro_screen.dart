import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/choice_screen.dart';
import 'package:flutter_app/screens/error_screen.dart';
import 'package:flutter_app/themes/light/theme.dart';
import 'package:flutter_app/widgets/background_widget.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:flutter_app/widgets/privacy_statement_widget.dart';
import 'package:flutter_app/widgets/spinner_container.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = '/intro';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var showPrivacyStatement = false;
  var initialLoad = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var portrait = size.height > size.width;

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
                alignment: portrait ? Alignment.topLeft : Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 80.0),
                  child: SvgPicture.asset(
                    'assets/svg/givt-logo.svg',
                    height: 30,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: portrait ? CrossAxisAlignment.start : CrossAxisAlignment.center,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPrivacyStatement = true;
                            });
                          },
                          child: Container(
                            height: 25,
                            alignment: Alignment.center,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                S.of(context).introPrivacyPolicyLink,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  decoration: TextDecoration.underline,
                                  color: LightTheme.mediumBlueColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      MainButton(
                        label: S.of(context).introButton,
                        tapped: () {
                          userProvider.userName = Uuid().v4();
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
                        webWidth: 350.0,
                      ),
                      SizedBox(
                        height: kIsWeb && MediaQuery.of(context).size.height > 1000 ? MediaQuery.of(context).size.height * .2 : 0,
                      ),
                    ],
                  ),
                ),
              ),
              if (showPrivacyStatement)
                PrivacyStatementWidget(() {
                  setState(() {
                    showPrivacyStatement = false;
                  });
                })
            ],
          ),
        ),
      ),
    );
    var futureBuilder = new FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2), () => {questionnaireProvider.loadQuestions()}),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              initialLoad = false;
              return screen;
            case ConnectionState.active:
            case ConnectionState.waiting:
              return SpinnerContainer(S.of(context).fetchingQuestions);
            case ConnectionState.none:
              return ErrorScreen();
              break;
          }
        });
    return initialLoad ? futureBuilder : screen;
  }
}

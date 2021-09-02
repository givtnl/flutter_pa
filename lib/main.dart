import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/choice_screen.dart';
import 'package:flutter_app/screens/intro_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/organisation_screen.dart';
import 'package:flutter_app/screens/matches_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/generated/l10n.dart';

import 'analytics/mixpanel_manager.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MixpanelManager.mixpanel.flushEvents();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    MixpanelManager.mixpanel.flushEvents();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuestionnaireProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MatchesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('en', 'GB'),
          Locale('nl', ''),
          Locale('de', '')
        ],
        theme: ThemeData(
          primaryColor: Color.fromRGBO(36, 106, 177, 1),
          backgroundColor: Color.fromRGBO(222, 233, 243, 1),
          cardColor: Color.fromRGBO(239, 244, 249, 1),
          textTheme: TextTheme(
            bodyText1:TextStyle(
              fontFamily: 'Inter',
              color: Theme.of(context).primaryColor,
            )
          )
        ),
        routes: {
          '/': (ctx) => kReleaseMode ? IntroScreen() : LoginScreen(),
          IntroScreen.routeName: (ctx) => IntroScreen(),
          MatchesScreen.routeName: (ctx) => MatchesScreen(),
          OrganisationScreen.routeName: (ctx) => OrganisationScreen(),
          ChoiceScreen.routeName: (ctx) => ChoiceScreen()
        },
      ),
    );
  }
}

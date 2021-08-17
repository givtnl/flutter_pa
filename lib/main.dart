import 'package:flutter/material.dart';
import 'package:flutter_app/providers/categories_provider.dart';
import 'package:flutter_app/providers/organisation_provider.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/screens/categories_screen.dart';
import 'package:flutter_app/screens/intro_screen.dart';
import 'package:flutter_app/screens/organisation_screen.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
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
          create: (_) => QuestionsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrganisationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
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
          textTheme: TextTheme(
            bodyText1:TextStyle(
              fontFamily: 'Inter',
              color: Color.fromRGBO(36, 106, 177, 1),
            )
          )
        ),
        routes: {
          '/': (ctx) => IntroScreen(),
          IntroScreen.routeName: (ctx) => IntroScreen(),
          QuestionScreen.routeName: (ctx) => QuestionScreen(),
          SuggestionsScreen.routeName: (ctx) => SuggestionsScreen(),
          OrganisationScreen.routeName: (ctx) => OrganisationScreen(),
          CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        },
      ),
    );
  }
}

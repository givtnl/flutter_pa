import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/choice_screen.dart';
import 'package:flutter_app/screens/error_screen.dart';
import 'package:flutter_app/screens/intro_screen.dart';
import 'package:flutter_app/screens/matches_screen.dart';
import 'package:flutter_app/screens/organisation_screen.dart';
import 'package:flutter_app/themes/light/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'analytics/mixpanel_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MixpanelManager.mixpanel.flushEvents();
  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorScreen();
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
        localizationsDelegates: [S.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
        supportedLocales: [Locale('en', ''), Locale('en', 'GB'), Locale('nl', ''), Locale('de', '')],
        theme: LightTheme.theme,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
            case IntroScreen.routeName:
              return CustomPageRoute(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => IntroScreen(),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child,) {
                  final Tween<Offset> offsetTween = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-1.0, 0.0));
                  final Animation<Offset> slideOutLeftAnimation = offsetTween.animate(secondaryAnimation);
                  return SlideTransition(position: slideOutLeftAnimation, child: child);
                },
              );
            case ErrorScreen.routeName:
              return CustomPageRoute(pageBuilder: (context, anim1, anim2) => ErrorScreen());
            case MatchesScreen.routeName:
              return CustomPageRoute(
                pageBuilder: (context, anim1, anim2) => MatchesScreen(),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child,) {
                  final Tween<Offset> offsetTween = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-1.0, 0.0));
                  final Animation<Offset> slideOutLeftAnimation = offsetTween.animate(secondaryAnimation);
                  return SlideTransition(position: slideOutLeftAnimation, child: child);
                },
              );
            case OrganisationScreen.routeName:
              return CustomPageRoute(
                pageBuilder: (context, anim1, anim2) => OrganisationScreen(),
                transitionsBuilder: (
                BuildContext context,
                Animation < double > animation,
                Animation < double > secondaryAnimation,
                Widget child,
              )
              {
                final Tween<Offset> offsetTween = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-1.0, 0.0));
                final Animation<Offset> slideOutLeftAnimation = offsetTween.animate(secondaryAnimation);
                return SlideTransition(position: slideOutLeftAnimation, child: child);
              },
          );
          case ChoiceScreen.routeName:
              return CustomPageRoute(pageBuilder: (context, anim1, anim2) => ChoiceScreen
          (
          )
          );
        }
        },
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  CustomPageRoute({pageBuilder, transitionsBuilder}) : super(pageBuilder: pageBuilder, transitionsBuilder: transitionsBuilder);
}

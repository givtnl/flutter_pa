import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
          title: 'Givt Selection Guide',
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
          theme: LightTheme.theme,
          initialRoute: '/',
          routes: {
            '/': (ctx) => IntroScreen(),
            IntroScreen.routeName: (ctx) => IntroScreen(),
            MatchesScreen.routeName: (ctx) => MatchesScreen(),
            OrganisationScreen.routeName: (ctx) => OrganisationScreen(),
            ChoiceScreen.routeName: (ctx) => ChoiceScreen(),
            ErrorScreen.routeName: (ctx) => ErrorScreen(),
          }),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  CustomPageRoute({pageBuilder, transitionsBuilder})
      : super(pageBuilder: pageBuilder, transitionsBuilder: transitionsBuilder);
}

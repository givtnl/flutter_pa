import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/feedback_provider.dart';
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
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';
import 'analytics/mixpanel_manager.dart';
import 'flavors_config.dart';

const URL_PROD = "https://2pl7tv80ki.execute-api.eu-west-3.amazonaws.com/prod";
const URL_QA = "https://poxv71al5m.execute-api.eu-west-3.amazonaws.com/prod";
const URL_DEV = "https://0v9xof580f.execute-api.eu-west-3.amazonaws.com/prod";

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() async {
    await MixpanelManager.mixpanel.flushEvents();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    ApiClient apiClient = ApiClient(basePath: FlavorConfig.instance.values.baseUrl);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuestionnaireProvider.withDependencies(apiClient),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MatchesProvider.withDependencies(apiClient),
        ),
        ChangeNotifierProvider(
          create: (_) => FeedbackProvider.withDependencies(apiClient),
        ),
      ],
      child: MaterialApp(
          title: "Givt Wizard",
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [
            Locale('nl', '')
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

  CustomPageRoute({pageBuilder, transitionsBuilder}) : super(pageBuilder: pageBuilder, transitionsBuilder: transitionsBuilder);
}

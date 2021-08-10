import 'package:flutter/material.dart';
import 'package:flutter_app/providers/categories_provider.dart';
import 'package:flutter_app/providers/organisation_provider.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/screens/categories_screen.dart';
import 'package:flutter_app/screens/intro_screen.dart';
import 'package:flutter_app/screens/organisation_screen.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        theme: ThemeData(
          primaryColor: Color.fromRGBO(36, 106, 177, 1),
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

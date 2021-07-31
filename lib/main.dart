import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/screens/intro_screen.dart';
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
    return ChangeNotifierProvider(
      create: (BuildContext context) => QuestionsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (ctx) => IntroScreen(),
          IntroScreen.routeName: (ctx) => IntroScreen(),
          QuestionScreen.routeName: (ctx) => QuestionScreen(),
          SuggestionsScreen.routeName: (ctx) => SuggestionsScreen(),
        },
      ),
    );
  }
}
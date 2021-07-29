import 'package:flutter/material.dart';
import 'package:flutter_app/screens/intro_screen.dart';
import 'package:flutter_app/screens/question_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (ctx) => IntroScreen(),
        IntroScreen.routeName: (ctx) => IntroScreen(),
        QuestionScreen.routeName: (ctx) => QuestionScreen(),
      },
    );
  }
}
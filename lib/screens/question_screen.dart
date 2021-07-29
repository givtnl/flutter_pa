import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/blue_button.dart';

class QuestionScreen extends StatelessWidget {
  static const String routeName = '/question';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("First question"),
      ),
    );
  }
}

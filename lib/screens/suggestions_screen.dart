import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuggestionsScreen extends StatelessWidget {

  static const routeName = "/suggestion";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Thanks for your answers!"),
        ),
      ),
    );
  }
}

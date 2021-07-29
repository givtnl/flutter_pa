import 'package:flutter/material.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/widgets/blue_button.dart';

class IntroScreen extends StatelessWidget {

  static const String routeName = '/intro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(50),
              child: Text(
                "Kom er achter welke doelen aansluiten bij jouw waarden, normen en identiteit.",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(36, 106, 177, 1),
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlueButton(
              label: "Naar de keuzewijzer!",
              tapped: () {
                Navigator.of(context).pushNamed(QuestionScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}

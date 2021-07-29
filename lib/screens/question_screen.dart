import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {

  static const String routeName = '/question';

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

        ],
      ),
    );
  }
}

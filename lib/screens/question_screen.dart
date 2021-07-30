import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';

class QuestionScreen extends StatelessWidget {
  static const String routeName = '/question';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 10,
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: 0.1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(36, 106, 177, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              BigText("Een goed doel met keurmerk geeft mij meer vertrouwen in een juiste besteding van mijn donatie."),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text("slider"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text("Akkoord - niet akkoord"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text("Overslaan"),
              ),
              BlueButton(
                label: "Naar de keuzewijzer!",
                tapped: () {
                  Navigator.of(context).pushNamed(QuestionScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

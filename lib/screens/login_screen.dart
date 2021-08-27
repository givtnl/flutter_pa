import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/intro_screen.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    var color = Theme
        .of(context)
        .backgroundColor;

    var errorWidget = Container(
      child: Text(
        'Identificatie is verplicht',
        style: const TextStyle(
          color: Color.fromRGBO(36, 106, 177, 1),),
      ),
    );

    Widget loginScreen = Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      body: SafeArea(
          child: Stack(children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        color: provider.inputEmpty && !provider.initialEmpty
                            ? Colors.deepOrange
                            : color,
                        child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter username or email'),
                            onChanged: (text) {
                              provider.userName = text;
                              provider.inputEmpty = text == '';
                              provider.setInitialEmptyFalse();
                            }),
                      )),
                  provider.inputEmpty && !provider.initialEmpty ? errorWidget : Container(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: BlueButton(
                  label: "Start",
                  tapped: () {
                    if (provider.initialEmpty) {
                      provider.setInitialEmptyFalse();
                    }
                    if (!provider.inputEmpty) {
                      Navigator.of(context).pushNamed(IntroScreen.routeName);
                    }
                  },
                ),
              ),
            )
          ])
      ),
    );

    return loginScreen;
  }
}

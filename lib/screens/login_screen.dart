import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/intro_screen.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: Stack(children: [
        Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter username or email'),
                  onChanged: (text) {
                    userProvider.userName = text;
                  })),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: BlueButton(
              label: "Start",
              tapped: () {
                Navigator.of(context).pushNamed(IntroScreen.routeName);
              },
            ),
          ),
        )
      ])),
    );
  }
}

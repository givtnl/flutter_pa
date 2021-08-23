import 'package:flutter/material.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MyTextFieldForm extends StatefulWidget {

  const MyTextFieldForm({Key? key}) : super(key: key);

  @override
  _MyTextFieldFormState createState() => _MyTextFieldFormState();
}

class _MyTextFieldFormState extends State<MyTextFieldForm> {
  final myTextFieldController = TextEditingController();
  @override
  void dispose() {
    myTextFieldController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return TextField(
      controller: myTextFieldController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter username or email'
        ),
      onChanged: (text) {
        userProvider.userName = text;
      }
    );
  }
}
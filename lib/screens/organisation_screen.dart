import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/big_text.dart';

class OrganisationScreen extends StatelessWidget {


  static const routeName = '/organisation-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                BigText("text")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

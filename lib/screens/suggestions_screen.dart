import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/organisation.dart';
import 'package:flutter_app/providers/organisation_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/organisation_proposal_widget.dart';
import 'package:provider/provider.dart';

class SuggestionsScreen extends StatelessWidget {
  static const routeName = "/suggestion";

  @override
  Widget build(BuildContext context) {

    var orgProvider = Provider.of<OrganisationProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 233, 243, 1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(50),
              child: BigText("Jouw persoonlijke voorstellen"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                "Dit zijn de organisaties die qua identiteit het beste bij jou passen.",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(36, 106, 177, 1),
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children:
                  orgProvider.organisations.map((e) => OrganisationProposal(e.name, e.explanation, 57)).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}

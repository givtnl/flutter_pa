import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/organisation_proposal_widget.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';

class SuggestionsScreen extends StatelessWidget {
  static const routeName = "/suggestion";

  Widget buildWidget(GetMatchesListResponse matches) {
    return TrackedScreen(
      screenName: 'SuggestionScreen',
      child: Scaffold(
        backgroundColor: Color.fromRGBO(222, 233, 243, 1),
        body: SafeArea(
          child: SingleChildScrollView(
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
                      children: matches.result
                          .map((e) => OrganisationProposal(
                          e.organisation.id,
                          e.organisation.name,
                          e.organisation.description,
                          e.score))
                          .take(5)
                          .toList()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MatchesProvider provider = Provider.of<MatchesProvider>(context);
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return new FutureBuilder(
        future: provider.loadMatches(userProvider.userName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildWidget(snapshot.data as GetMatchesListResponse);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

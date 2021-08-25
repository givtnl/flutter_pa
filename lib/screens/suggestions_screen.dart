import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/organisation_proposal_widget.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';

class SuggestionsScreen extends StatefulWidget {
  static const routeName = "/suggestion";

  @override
  _SuggestionsScreenState createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final MatchesProvider provider = Provider.of<MatchesProvider>(context);
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    var screen = TrackedScreen(
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
                      children: provider.organisations
                          .map((e) => OrganisationProposal(
                              e.organisation.id,
                              e.organisation.name,
                              e.organisation.description,
                              e.score))
                          .toList()),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return new FutureBuilder(
        future: provider.loadMatches(userProvider.userName),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }

          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return screen;
            case ConnectionState.active:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              print("none");
              return Container();
              break;
          }
        }
      );
  }
}

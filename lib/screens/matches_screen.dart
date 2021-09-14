import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/matches/match_widget.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';

class MatchesScreen extends StatefulWidget {
  static const routeName = "/suggestion";

  _MatchesScreen createState() => _MatchesScreen();
}

class _MatchesScreen extends State<MatchesScreen> {
  Widget buildWidget(BuildContext context) {
    var provider = Provider.of<MatchesProvider>(context);
    var matches = [
      UserOrganisationMatchListModel(
        organisation: OrganisationDetailModel(
          id: "1",
          description: "Description",
          imageUrl: "http://www.google.be/",
          mission: "Wij gaan voor de beste brandwondenzorg: de beste zorg aan patiënten, de hoogst mogelijke kwaliteit van leven en de meest effectieve preventie.",
          name: "Brandwonden stichting",
          vision: "Vision",
          websiteUrl: "http://www.google.be/",
          metaTags: {'sectors': 'animals',}
        ),
        score: 87,
      )
    ];

    return WillPopScope(
      onWillPop: () async {
        // this prevents the user of going back in the flow to the questionnaire
        return false;
      },
      child: TrackedScreen(
        screenName: 'MatchesScreen',
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 20),
                    child: Text(
                      "Jouw persoonlijke voorstellen",
                      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Text(
                      "Dit zijn de organisaties die qua identiteit het beste bij jou passen.",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(children: matches.map((e) => MatchWidget(e)).take(5).toList()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MatchesProvider provider = Provider.of<MatchesProvider>(context, listen: false);
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return new FutureBuilder(
        future: provider.loadMatches(userProvider.userName),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return buildWidget(context);
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Container(
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 100),
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              );
            case ConnectionState.none:
              print("none");
              return Container();
              break;
          }
        });
  }
}

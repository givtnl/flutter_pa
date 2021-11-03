import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/organisation_screen.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';

import '../match_percentage_circle.dart';

class MatchWidget extends StatelessWidget {
  final UserOrganisationMatchListModel match;

  MatchWidget(this.match);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MatchesProvider>(context);

    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50).copyWith(top: 20),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              match.organisation.name.toUpperCase(),
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 15,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              match.organisation.mission, // TODO: Change to organisationDescription
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                MainButton(
                    label: S.of(context).matchesScreen_findOutMore,
                    tapped: () async {
                      var userName = Provider.of<UserProvider>(context, listen: false).userName;
                      await provider.selectOrganisationMatch(match, userName);
                      Navigator.of(context).pushNamed(OrganisationScreen.routeName);
                    },
                    height: 35,
                    fontSize: 14),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              MatchPercentageCircle(match.score.round()),
            ],
          )
        ],
      ),
    );
  }
}

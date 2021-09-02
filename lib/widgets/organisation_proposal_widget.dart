import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/screens/organisation_screen.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';

import 'big_text.dart';
import 'blue_rounded_button.dart';

class OrganisationProposal extends StatelessWidget {
  final UserOrganisationMatchListModel  match;

  OrganisationProposal(this.match);

  @override
  Widget build(BuildContext context) {

   var provider = Provider.of<MatchesProvider>(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(match.organisation.name),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              match.organisation.mission,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BlueRoundedButton("Ontdek meer", () {
                  MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "DISCOVER_MORE"});
                  provider.selectOrganisationMatch(this.match);
                  Navigator.of(context).pushNamed(OrganisationScreen.routeName);
                }),
                Expanded(child: Container()),
                BigText(match.score.toString() + '%'),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 3.0),
                  child: Text(
                    "match",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

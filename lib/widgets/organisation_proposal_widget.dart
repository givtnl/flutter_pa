import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/providers/organisation_provider.dart';
import 'package:flutter_app/screens/organisation_screen.dart';
import 'package:provider/provider.dart';

import 'big_text.dart';
import 'blue_rounded_button.dart';

class OrganisationProposal extends StatelessWidget {
  final String title;
  final String explanation;
  final int match;
  final String orgId;

  OrganisationProposal(this.orgId, this.title, this.explanation, this.match);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(title),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              explanation,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(36, 106, 177, 1),
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
                  Provider.of<OrganisationProvider>(context, listen: false).currentSelectedProposal = orgId;
                  Navigator.of(context).pushNamed(OrganisationScreen.routeName);
                }),
                Expanded(child: Container()),
                BigText("$match%"),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 3.0),
                  child: Text(
                    "match",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(36, 106, 177, 1),
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

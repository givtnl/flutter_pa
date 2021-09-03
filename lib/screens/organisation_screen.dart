import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/organisation_extra_description.dart';
import 'package:flutter_app/widgets/organisation_tag.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OrganisationScreen extends StatelessWidget {
  static const routeName = '/organisation-detail';

  final Map<String, bool> _tags = {
    "Internationale hulp en mensenrechten": false,
    "religie en levensbeschouwing": true,
  };

  OrganisationScreen();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MatchesProvider>(context);
    var currentMatch = provider.selectedOrganisationMatch;
    var currentOrganisation = provider.selectedOrganisationMatch.organisation;
    return TrackedScreen(
      screenName: 'OrganisationScreen',
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: BigText(currentOrganisation.name),
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  currentMatch.score.toString() + '%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  "match",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    itemBuilder: (ctx, idx) {
                      return OrganisationTag(_tags.entries.elementAt(idx).key, _tags.entries.elementAt(idx).value);
                    },
                    itemCount: _tags.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    currentOrganisation.description,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      currentOrganisation.websiteUrl,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  OrganisationExtra('Missie', currentOrganisation.mission),
                  SizedBox(
                    height: 10,
                  ),
                  OrganisationExtra('Visie', currentOrganisation.vision),
                  if (currentOrganisation.givtIdentifier != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: BlueButton(
                          label: "Steun ${currentOrganisation.name}",
                          tapped: () async {
                            MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "SUPPORT_ORGANISATION"});
                            var url = "https://www.givtapp.net/download?code=${base64.encode(utf8.encode("${currentOrganisation.givtIdentifier!}.ea0000000001"))}";
                            if (await canLaunch(url))
                              await launch(url);
                            else
                              throw "Could not launch $url";
                          }),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_rounded_button.dart';
import 'package:flutter_app/widgets/custom_linear_progress_indicator.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:flutter_app/widgets/organisation_extra_description.dart';
import 'package:flutter_app/widgets/organisation_tag.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions/intl_extension.dart';

class MatchingTag {
  int score;
  String name;

  MatchingTag(this.score, this.name);
}

class OrganisationScreen extends StatelessWidget {
  static const routeName = '/organisation-detail';

  OrganisationScreen();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MatchesProvider>(context);
    var currentMatch = provider.selectedOrganisationMatch;
    var currentOrganisation = provider.selectedOrganisationMatch.organisation;
    var tagScores = [UserOrganisationTagMatchListModel(score: 90, tag: 'animals', organisationId: "1")];

    var itlProvider = S.of(context);

    final _tags = currentMatch.organisation.metaTags["sectors"]!
        .split(",")
        .map((e) => itlProvider.getSector(e));
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: BigText(currentOrganisation.name),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${currentMatch.score}%",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.button!.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "match",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white, fontSize: 9),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                    itemBuilder: (ctx, idx) {
                      return OrganisationTag(_tags.elementAt(idx), false);
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
                  OrganisationExtra(
                    'Missie',
                    currentOrganisation.mission,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OrganisationExtra(
                    'Visie',
                    currentOrganisation.vision,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BlueRoundedButton(
                      'bezoek de website',
                        () {}
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Waarom matchen jullie?",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, idx) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tagScores.elementAt(idx).tag,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomLinearProgressIndicator(
                              height: 20,
                              borderRadius: 20,
                              value: tagScores
                                      .elementAt(idx)
                                      .score
                                      .toDouble() /
                                  100,
                              color: getColorForIndicator(idx, context),
                              backgroundColor:
                                  getColorForIndicator(idx, context)
                                      .withOpacity(0.15),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: tagScores.length),
                  if (currentOrganisation.metaTags.containsKey("donationUrl"))
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: MainButton(
                          label: "geven",//todo
                          tapped: () async {
                            MixpanelManager.mixpanel.track("CLICKED",
                                properties: {
                                  "BUTTON_NAME": "SUPPORT_ORGANISATION"
                                });
                            var url =
                                currentOrganisation.metaTags["donationUrl"]!;
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

Color getColorForIndicator(int idx, BuildContext context) {
  int number = idx;
  switch (number) {
    case 0:
      return Theme.of(context).accentColor;
    case 1:
      return Theme.of(context).primaryColor;
    case 2:
      return Theme.of(context).buttonColor;
    default:
      return Theme.of(context).primaryColor;
  }
}

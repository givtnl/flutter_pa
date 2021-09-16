import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/widgets/accent_rounded_button.dart';
import 'package:flutter_app/widgets/custom_linear_progress_indicator.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:flutter_app/widgets/match_percentage_circle.dart';
import 'package:flutter_app/widgets/organisation_extra_description.dart';
import 'package:flutter_app/widgets/organisation_tag.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions/intl_extension.dart';
import 'error_screen.dart';

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
    // TODO: Localize terms here on this screen

    var provider = Provider.of<MatchesProvider>(context);
    var currentMatch = provider.selectedOrganisationMatch;
    var currentOrganisation = provider.selectedOrganisationMatch.organisation;
    var tagScores = [UserOrganisationTagMatchListModel(score: 90, tag: 'animals', organisationId: "1")];

    var itlProvider = S.of(context);

    final Widget backArrow = SvgPicture.asset('assets/svg/back-arrow.svg');

    final _tags = currentMatch.organisation.metaTags["sectors"]!.split(",").map((e) => itlProvider.getSector(e));
    return TrackedScreen(
      screenName: 'OrganisationScreen',
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: backArrow,
            onPressed: () {
              print("ah yeet, kerre ki were");
              // fyi: het lijkt erop dat de leading element in de appBar een maximum breedte maar mag hebben
              // de positie lijkt ook vast te staan tot op eem maximum van X -> aan de rechter kant.
              // vanaf dan begint alles te shrinken... Wrap de IconButton maar eens in padding :see-no-evil:
            },
            iconSize: 25,
            splashRadius: 25, // put this on 25 because default (35) overlaps the app bar
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          shadowColor: Color.fromRGBO(0, 0, 0, 0),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: AutoSizeText(currentOrganisation.name, style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24)),
                            ),
                          ),
                          MatchPercentageCircle(currentMatch.score.round()),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
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
                          child: AccentRoundedButton('bezoek de website', () async {
                            if (await canLaunch(currentOrganisation.websiteUrl)) {
                              await launch(currentOrganisation.websiteUrl);
                            }
                            else {
                              Navigator.of(context).pushNamed(ErrorScreen.routeName);
                            }
                          }),
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
                                    value: tagScores.elementAt(idx).score.toDouble() / 100,
                                    color: getColorForIndicator(idx, context),
                                    backgroundColor: getColorForIndicator(idx, context).withOpacity(0.15),
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
                                label: "geven", //todo
                                tapped: () async {
                                  MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "SUPPORT_ORGANISATION"});
                                  var url = currentOrganisation.metaTags["donationUrl"]!;
                                  if (await canLaunch(url))
                                    await launch(url);
                                  else
                                    throw "Could not launch $url";
                                }),
                          )
                      ],
                    ),
                  ),
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

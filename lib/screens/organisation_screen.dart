import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/widgets/accent_rounded_button.dart';
import 'package:flutter_app/widgets/background_widget.dart';
import 'package:flutter_app/widgets/custom_linear_progress_indicator.dart';
import 'package:flutter_app/widgets/feedback_widget.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:flutter_app/widgets/match_percentage_circle.dart';
import 'package:flutter_app/widgets/organisation_extra_description.dart';
import 'package:flutter_app/widgets/organisation_tag.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/js.dart' as js;

import '../extensions/intl_extension.dart';
import '../givt_icons.dart';
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
    var provider = Provider.of<MatchesProvider>(context);
    var currentMatch = provider.selectedOrganisationMatch;
    var currentOrganisation = provider.selectedOrganisationMatch.organisation;
    var currentTags = provider.currentMatchingTags;
    var currentOrganisationTags = provider.currentOrganisationTags;
    var itlProvider = S.of(context);

    final Widget backArrow = SvgPicture.asset('assets/svg/back-arrow.svg');

    final _tags = currentMatch.organisation.metaTags["sectors"]!.split(",").map((e) => itlProvider.getSector(e));

    final Widget fab = FloatingActionButton.large(
      onPressed: () async {
        MixpanelManager.mixpanel.track("CLICKED", properties: {
          "BUTTON_NAME": "SUPPORT_ORGANISATION"
        });
        var url = currentOrganisation.metaTags["donationUrl"]!;
        if (await canLaunch(url))
          await launch(url);
        else
          throw "Could not launch $url";
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Givt.org_icon,
            size: !kIsWeb ? 42 : 38,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            S.of(context).organisationDetailScreen_giveButton.toUpperCase(),
            style: Theme.of(context).textTheme.button!.copyWith(fontSize: 14),
          ),
        ]),
      ),
    );

    return TrackedScreen(
      screenName: 'OrganisationScreen',
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Stack(children: [
            BackgroundWidget(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Center(
                  child: Container(
                    width: kIsWeb && MediaQuery.of(context).size.width > 700 ? 700 : double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: IconButton(
                            icon: backArrow,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            iconSize: 15,
                            splashRadius: .1, // put this on 25 because default (35) overlaps the app bar
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
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
                              Align(
                                alignment: Alignment.topLeft,
                                child: Wrap(
                                  children: _tags.map((e) {
                                    return OrganisationTag(e, false);
                                  }).toList(),
                                  spacing: 10,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              OrganisationExtra(
                                S.of(context).organisationDetailScreen_mission,
                                currentOrganisation.mission,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              OrganisationExtra(
                                S.of(context).organisationDetailScreen_vision,
                                currentOrganisation.vision,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AccentRoundedButton(S.of(context).organisationDetailScreen_visitWebsite, () async {
                                  if (await canLaunch(currentOrganisation.websiteUrl)) {
                                    await launch(currentOrganisation.websiteUrl);
                                  } else {
                                    Navigator.of(context).pushNamed(ErrorScreen.routeName);
                                  }
                                }, Theme.of(context).buttonColor, true),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).organisationDetailScreen_youMatchTitle,
                                      style: Theme.of(context).textTheme.headline2,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      S.of(context).organisationDetailScreen_youMatchSubTitle,
                                      style: Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
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
                                          currentTags.elementAt(idx).tag.toUpperCase(),
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context).textTheme.bodyText2,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          //USER
                                          children: [
                                            Icon(
                                              Givt.user_icon,
                                              size: 20,
                                              color: Theme.of(context).primaryColor,
                                              semanticLabel: "Jouw score op tag " + currentOrganisationTags[idx].tag,
                                            ),
                                            SizedBox(width: 10),
                                            CustomLinearProgressIndicator(
                                              height: 20,
                                              borderRadius: 20,
                                              value: currentTags.elementAt(idx).score.toDouble() / 100,
                                              color: getColorForIndicator(idx, context),
                                              backgroundColor: getColorForIndicator(idx, context).withOpacity(0.15),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          //Organisation
                                          children: [
                                            Icon(
                                              Givt.org_icon,
                                              size: 20,
                                              color: Theme.of(context).primaryColor,
                                              semanticLabel: "Score organisatie " + currentOrganisationTags[idx].tag,
                                            ),
                                            SizedBox(width: 10),
                                            CustomLinearProgressIndicator(
                                              height: 20,
                                              borderRadius: 20,
                                              value: provider.getOrganisationTagScore(currentOrganisationTags[idx].tag).toDouble() / 100,
                                              color: getColorForIndicator(idx, context),
                                              backgroundColor: getColorForIndicator(idx, context).withOpacity(0.15),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 20,
                                    );
                                  },
                                  itemCount: currentTags.length),
                              if (currentOrganisation.metaTags.containsKey("donationUrl") && MediaQuery.of(context).size.height >= 900)
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: MainButton(
                                    label: S.of(context).organisationDetailScreen_giveButton,
                                    tapped: () async {
                                      MixpanelManager.mixpanel.track("CLICKED", properties: {
                                        "BUTTON_NAME": "SUPPORT_ORGANISATION"
                                      });
                                      var url = currentOrganisation.metaTags["donationUrl"]!;
                                      if (kIsWeb) {
                                        js.context.callMethod('open', [
                                          url
                                        ]);
                                      } else {
                                        if (await canLaunch(url))
                                          await launch(url);
                                        else
                                          throw "Could not launch $url";
                                      }
                                    },
                                    fontSize: 16,
                                    height: 45,
                                  ),
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
          ]),
        ),
        floatingActionButton: (currentOrganisation.metaTags.containsKey("donationUrl") && MediaQuery.of(context).size.height < 900)
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 65,
                  width: 65,
                  child: FittedBox(
                    child: fab,
                  ),
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

Color getColorForIndicator(int idx, BuildContext context) {
  int number = idx;
  switch (number % 3) {
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

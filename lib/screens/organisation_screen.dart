import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/providers/organisation_provider.dart';
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

  final matchingPercentage = 20;

  OrganisationScreen();

  @override
  Widget build(BuildContext context) {
    var org = Provider.of<MatchesProvider>(context).getOrganisationById(Provider.of<OrganisationProvider>(context).currentSelectedProposal);
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
                            child: BigText(org.name),
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "$matchingPercentage%",
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
                    org.description,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      org.websiteUrl,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  OrganisationExtra('Missie', org.mission),
                  SizedBox(
                    height: 10,
                  ),
                  OrganisationExtra('Visie', org.vision),
                  /*if (org.donationLink != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: BlueButton(
                          label: "Steun ${org.name}",
                          tapped: () async {
                            MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "SUPPORT_ORGANISATION"});
                            var url = org.donationLink!;
                            if (await canLaunch(url))
                              await launch(url);
                            else
                              throw "Could not launch $url";
                          }),
                    )*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/models/UserFeedback.dart';
import 'package:flutter_app/providers/feedback_provider.dart';
import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/widgets/background_widget.dart';
import 'package:flutter_app/widgets/feedback_email_widget.dart';
import 'package:flutter_app/widgets/feedback_widget.dart';
import 'package:flutter_app/widgets/matches/match_widget.dart';
import 'package:flutter_app/widgets/spinner_container.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';

class MatchesScreen extends StatefulWidget {
  static const routeName = "/suggestion";

  _MatchesScreen createState() => _MatchesScreen();
}

class _MatchesScreen extends State<MatchesScreen> {
  var showFeedbackModal = false;
  var initialLoad = true;

  var showFeedbackEmailModal = false;

  UserFeedback? feedback;

  Widget buildWidget(BuildContext context) {
    var provider = Provider.of<MatchesProvider>(context, listen: false);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var matches = provider.organisationMatches;

    return WillPopScope(
      onWillPop: () async {
        // this prevents the user of going back in the flow to the questionnaire
        setState(() {
          showFeedbackModal = true;
        });
        return false;
      },
      child: TrackedScreen(
        screenName: 'MatchesScreen',
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: Stack(
              children: [
                BackgroundWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: kIsWeb && MediaQuery.of(context).size.width > 700 ? 700 : MediaQuery.of(context).size.width,
                      child: Container(
                        alignment: kIsWeb ? Alignment.center : null,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 10),
                                child: Text(
                                  S.of(context).matchesScreen_yourPersonalSuggestions,
                                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                                child: Text(
                                  S.of(context).matchesScreen_subtitleText,
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                    children: matches
                                        .map((e) => Column(
                                              children: [
                                                MatchWidget(e),
                                                SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            ))
                                        .take(3)
                                        .toList()),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                showFeedbackModal
                    ? FeedbackWidget(() {
                        setState(() {
                          showFeedbackModal = false;
                          MixpanelManager.mixpanel.track("FEEDBACK_DISMISSED");
                        });
                      }, (feedback) {
                        setState(() {
                          this.feedback = feedback;
                          Provider.of<FeedbackProvider>(context, listen: false).sendFeedback(feedback, userProvider.userName);
                          MixpanelManager.mixpanel.track("FEEDBACK_GIVEN");
                          showFeedbackModal = false;
                          showFeedbackEmailModal = true;
                        });
                      })
                    : Container(),
                showFeedbackEmailModal
                    ? FeedbackEmailWidget((email) {
                        setState(() {
                          Provider.of<FeedbackProvider>(context, listen: false).sendFeedback(feedback!, userProvider.userName, email: email);
                          MixpanelManager.mixpanel.track("FEEDBACK_EMAIL_GIVEN");
                          showFeedbackEmailModal = false;
                        });
                      }, () {
                        setState(() {
                          showFeedbackEmailModal = false;
                          MixpanelManager.mixpanel.track("FEEDBACK_EMAIL_DISMISSED");
                        });
                      })
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MatchesProvider provider = Provider.of<MatchesProvider>(context, listen: false);
    final UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);

    if (initialLoad) {
      return new FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2), () => provider.loadMatches(userProvider.userName)),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                initialLoad = false;
                Future.delayed(
                  const Duration(seconds: 3),
                  () => {
                    setState(() {
                      showFeedbackModal = true;
                    })
                  },
                );
                return buildWidget(context);
              case ConnectionState.active:
              case ConnectionState.waiting:
                return SpinnerContainer(S.of(context).calculatingMatches);
              case ConnectionState.none:
                print("none");
                return Container();
                break;
            }
          });
    }

    return buildWidget(context);
  }
}

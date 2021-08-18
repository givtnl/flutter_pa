import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:flutter_app/widgets/tracked_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/generated/l10n.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/intro';

  @override
  Widget build(BuildContext context) {
    MixpanelManager.mixpanel.track("Intro screen showing");
    var questionnaireProvider = Provider.of<QuestionnaireProvider>(context, listen: false);
    var provider = Provider.of<QuestionsProvider>(context);
    return TrackedScreen(
      screenName: 'IntroScreen',
      child: Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: BigText(S.of(context).introText),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: BlueButton(
                    label: S.of(context).introButton,
                    tapped: () {
                      questionnaireProvider.showNextScreen(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

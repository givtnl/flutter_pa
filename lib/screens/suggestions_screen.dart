import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/models/organisation.dart';
import 'package:flutter_app/providers/categories_provider.dart';
import 'package:flutter_app/providers/organisation_provider.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/organisation_proposal_widget.dart';
import 'package:provider/provider.dart';

class SuggestionsScreen extends StatefulWidget {
  static const routeName = "/suggestion";

  @override
  _SuggestionsScreenState createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  late List<Organisation> _organisations;

  var _loading = false;
  var _init = true;

  @override
  void didChangeDependencies() {
    _loading = true;
    if (_init) {
      _init = false;
      var orgProvider = Provider.of<OrganisationProvider>(context);
      orgProvider.getAllOrganisations().then((value) {
        setState(() {
          _organisations = value;
          _loading = false;
        });
      });
    }
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var questionsProvider = Provider.of<QuestionsProvider>(context);
    var categories = categoryProvider.categories;
    var questions = questionsProvider.questions;
    for (var cat in categories) {
      print(cat.category + ' is clicked is: ' + cat.isClicked.toString());
    }
    for (var ques in questions) {
      if (ques.isSkipped) {
        print(ques.id.toString() + ': ' + ques.question + '  is skipped');
      } else {
        print(ques.id.toString() + ': ' + ques.question + 'has answer: ' + ques.answer.toString());
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    MixpanelManager.mixpanel.track("Suggestion screen showing");
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 233, 243, 1),
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(50),
                      child: BigText("Jouw persoonlijke voorstellen"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        "Dit zijn de organisaties die qua identiteit het beste bij jou passen.",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(36, 106, 177, 1),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(children: _organisations.map((e) => OrganisationProposal(e.id, e.name, e.explanation, 57)).toList()),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

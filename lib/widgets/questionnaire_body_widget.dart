import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/widgets/statement_container.dart';
import 'package:provider/provider.dart';

import 'categories_container.dart';

class QuestionnaireBody extends StatefulWidget {
  const QuestionnaireBody({Key? key}) : super(key: key);

  @override
  _QuestionnaireBodyState createState() => _QuestionnaireBodyState();
}

class _QuestionnaireBodyState extends State<QuestionnaireBody> {
  @override
  Widget build(BuildContext context) {
    var questionnaireProvider = Provider.of<QuestionnaireProvider>(
        context);
    Widget body = Container();
    if (!questionnaireProvider.isCompleted) {
      body = (questionnaireProvider.currentScreenType ==
          ChoiceScreenType.statement)
          ? StatementContainer()
          : CategoriesContainer();
    }

    return SizedBox(
      width: kIsWeb ? 700 : double.infinity,
      child: body
    );
  }
}

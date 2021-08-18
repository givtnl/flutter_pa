import 'package:flutter/material.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/models/question.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/providers/categories_provider.dart';
import 'package:flutter_app/screens/categories_screen.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';

class QuestionnaireScreen {
  Question? question;
  List<Category>? categories;
  QuestionnaireScreenType type;
  bool done = false;

  QuestionnaireScreen(this.type, {this.question, this.categories});
}

enum QuestionnaireScreenType { Question, Category }

class QuestionnaireProvider with ChangeNotifier {
  final totalNumberOfQuestionScreens = QuestionsProvider().questions.length;
  final totalNumberOfCategoryScreens =
      (CategoryProvider().categories.length / 4).ceil();

  var _screenNumber = 0;
  var numberOfQuestionScreensPerCategoryScreen = 0;
  var totalNumberOfScreens = 0;

  List<QuestionnaireScreen> questionnaireScreens = [];

  QuestionnaireProvider() {
    final questionsApiInstance = QuestionsApi();
    try {
      final result = questionsApiInstance.getQuestionsList();
      result.then((question) => question.result.forEach((element) {
        switch (element.type) {
          case QuestionType.number0:
            var question = Question(element.id, element.translations.values.first);
            questionnaireScreens.add(QuestionnaireScreen(QuestionnaireScreenType.Question, question: question));
            break;
          case QuestionType.number1:
            var categories = [Category(element.id, element.translations.values.first, element.translations.values.first)];
            questionnaireScreens.add(QuestionnaireScreen(QuestionnaireScreenType.Category, categories: categories));
            break;
          default:
            break;
        }
      }));
    } catch (e) {
      print('Exception when calling QuestionsApi->getQuestionsList: $e\n');
    }
  }

  void showNextScreen(ctx) {
    if (_screenNumber != 0) setPreviousScreenDone(ctx);
    incrementScreenNumber();
    var nextScreen = questionnaireScreens.firstWhereOrNull((element) => !element.done);
    if (nextScreen == null) {
      Navigator.pushNamed(ctx, SuggestionsScreen.routeName);
    } else {
      switch (nextScreen.type) {
        case QuestionnaireScreenType.Category:
          nextScreen.categories =
              Provider.of<CategoryProvider>(ctx, listen: false)
                  .nextFourCategories(
                      screenNumber, numberOfQuestionScreensPerCategoryScreen);
          Navigator.pushNamed(ctx, CategoriesScreen.routeName);
          break;
        case QuestionnaireScreenType.Question:
          nextScreen.question =
              Provider.of<QuestionsProvider>(ctx, listen: false).nextQuestion;
          Navigator.pushNamed(ctx, QuestionScreen.routeName);
          break;
      }
    }
  }

  void setPreviousScreenDone(ctx) {
    questionnaireScreens[_screenNumber-1].done = true;
  }

  int get screenNumber {
    return _screenNumber;
  }

  bool get isNextScreenACategoriesScreen {
    return _screenNumber % numberOfQuestionScreensPerCategoryScreen == 0;
  }

  double get currentProgress {
    return _screenNumber / totalNumberOfScreens;
  }

  void incrementScreenNumber() {
    _screenNumber++;
  }
}

extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

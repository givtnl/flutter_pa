import 'package:flutter/material.dart';
import 'package:flutter_app/screens/categories_screen.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:openapi/api.dart';

class QuestionnaireProvider with ChangeNotifier {
  var _screenNumber = 0;

  List<QuestionListModel> _questions = [];
  List<QuestionListModel> completedQuestions = [];
  List<QuestionListModel> skippedQuestions = [];

  QuestionnaireProvider();

  void loadQuestions() {
    final questionsApiInstance = QuestionsApi();
    try {
      final result = questionsApiInstance.getQuestionsList();
      result.then((response) {
        _questions = response.result;
        _questions.sort((a,b) => a.displayOrder - b.displayOrder);
      });
    } catch (e) {
      print('Exception when calling QuestionsApi->getQuestionsList: $e\n');
    }
  }

  void showNextScreen(ctx) {
    incrementScreenNumber();
    if (screenNumber!=0)setPreviousScreenDone();

    if (this.isCompleted) {
      Navigator.pushNamed(ctx, SuggestionsScreen.routeName);
    } else {
      Navigator.pushNamed(ctx, getNextRouteName);
    }
  }

  List<QuestionListModel> get questions {
    return _questions;
  }

  void setPreviousScreenDone() {
    QuestionListModel? qlm = questions.elementAt(_screenNumber -1);
    completedQuestions.add(qlm);
  }

  QuestionListModel? getNextQuestion() {
    return questions.elementAt(_screenNumber);
  }

  bool get isCompleted {
    return questions.length ==
        (completedQuestions.length + skippedQuestions.length);
  }

  String get getNextRouteName {
    return getCurrentQuestion!.type == QuestionType.number0 ? QuestionScreen
        .routeName : CategoriesScreen.routeName;
  }

  QuestionListModel? get getCurrentQuestion {
    return questions[screenNumber];
  }

  String get getCurrentQuestionTranslation {
    var currentLang = 'en';
    if (getCurrentQuestion == null) {
      return '';
    }
    if (getCurrentQuestion!.translations != null &&
        getCurrentQuestion!.translations.containsKey(currentLang)) {
      return getCurrentQuestion!.translations[currentLang]!;
    }
    return 'to translate';
  }

  double get currentProgress {
    return ((completedQuestions.length + skippedQuestions.length) /
        questions.length) * 100;
  }

  int get screenNumber {
    return _screenNumber;
  }

  void incrementScreenNumber() {
    _screenNumber++;
  }

  void skipCurrentQuestion() {
    skippedQuestions.add(getCurrentQuestion!);
  }

  void answerQuestion(String id, int score) {
    final answerApi = AnswersApi();
    answerApi.createAnswer(id, CreateAnswerRequest(questionId: id)).then((value) => print(value));
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

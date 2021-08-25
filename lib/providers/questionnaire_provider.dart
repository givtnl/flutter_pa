import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/categories_screen.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:openapi/api.dart';

class QuestionnaireProvider with ChangeNotifier {
  var _screenNumber = 0;

  late QuestionsApi questionsApi;
  late AnswersApi answerApi;

  List<QuestionListModel> _questions = [];
  List<QuestionListModel> completedQuestions = [];
  List<QuestionListModel> skippedQuestions = [];
  List<CreateAnswerDetailRequest> currentSelectedCategories = [];

  QuestionnaireProvider() {
    this.questionsApi = QuestionsApi();
    this.answerApi = AnswersApi();
  }

  QuestionnaireProvider.withDependencies(QuestionsApi questionsApi, AnswersApi answersApi) {
    this.questionsApi = questionsApi;
    this.answerApi = answersApi;
  }

  Future<void> loadQuestions() async {
      return await this.questionsApi.getQuestionsList().catchError((error) => Future.error(error))
      .then((response) {
        _questions = response.result;
        _questions.sort((a, b) => a.displayOrder - b.displayOrder);
      });
    }

  void prepareNextScreen() {
    _incrementScreenNumber();
    if (screenNumber != 0)
      _setPreviousScreenDone();
    this.currentSelectedCategories.clear();
  }

  List<QuestionListModel> get questions {
    return _questions;
  }

  void _setPreviousScreenDone() {
    if (questions.isNotEmpty) {
      QuestionListModel? qlm = questions.elementAt(_screenNumber - 1);
      completedQuestions.add(qlm);
    }
  }

  QuestionListModel? getNextQuestion() {
    return !isCompleted ? questions.elementAt(_screenNumber) : null;
  }

  bool get isCompleted {
    return questions.length ==
        (completedQuestions.length + skippedQuestions.length);
  }

  String get getNextRouteName {
    if (this.isCompleted) {
      return SuggestionsScreen.routeName;
    } else {
      return getCurrentQuestion!.type == QuestionType.number0
          ? QuestionScreen.routeName
          : CategoriesScreen.routeName;
    }
  }

  QuestionListModel? get getCurrentQuestion {
    return questions[screenNumber];
  }

  String get getCurrentQuestionTranslation {
    var currentLang = 'nl';
    if (getCurrentQuestion == null) {
      return '';
    }
    if (getCurrentQuestion!.translations != null &&
        getCurrentQuestion!.translations.containsKey(currentLang)) {
      return getCurrentQuestion!.translations[currentLang]!;
    }
    return 'to translate';
  }

  List<String> get getCurrentCategoriesTranslation {
    var currentLang = 'nl';
    if (getCurrentQuestion == null) {
      return List.empty();
    }
    List<String> list = [];
    if (getCurrentQuestion!.categoryOptions.isNotEmpty) {
      for (var i = 0; i < 4; i++) {
        if (getCurrentQuestion!.categoryOptions![i].translations
            .containsKey(currentLang)) {
          list.add(getCurrentQuestion!
              .categoryOptions![i].translations![currentLang]!);
        }
      }
    }
    return list;
  }

  double get currentProgress {
    return ((completedQuestions.length + skippedQuestions.length) /
            questions.length) *
        100;
  }

  int get screenNumber {
    return _screenNumber;
  }

  void _incrementScreenNumber() {
    _screenNumber++;
  }

  void skipCurrentQuestion() {
    skippedQuestions.add(getCurrentQuestion!);
  }

  Future<void> saveQuestion(int score, String user) async {
    double scoreDouble = score / 4;
    return await this.answerApi
        .createAnswer(
            getCurrentQuestion!.id,
            CreateAnswerRequest(
                questionId: getCurrentQuestion!.id,
                userId: user,
                answers: [
                  CreateAnswerDetailRequest(
                      tag: this
                          .getCurrentQuestion!
                          .statementOptions
                          .tagScores
                          .keys
                          .first,
                      score: scoreDouble)
                ]))
        .catchError((error) => Future(error))
        .then((value) => null/* todo THIS IS THE PLACE FOR MIXPANEL LOGGIGNG?*/);
  }

  void addCategoryAnswer(int selectedCategoryIndex) {
    QuestionListModel? question = getCurrentQuestion;
    if (question != null && question.type == QuestionType.number1) {
      var toSelectCategory = getCurrentQuestion!.categoryOptions!.elementAt(selectedCategoryIndex);
      toSelectCategory.tagScores.forEach((key, value) {
        CreateAnswerDetailRequest createAnswerDetailRequest = CreateAnswerDetailRequest(tag: key, score: 1);
        if (!currentSelectedCategories.contains(createAnswerDetailRequest)) {
          this.currentSelectedCategories.add(createAnswerDetailRequest);
        }
      });
    } else {
      return;
    }
  }

  Future<void> saveCategories(String user) async {
    return await answerApi
        .createAnswer(
            getCurrentQuestion!.id,
            CreateAnswerRequest(
                questionId: getCurrentQuestion!.id,
                userId: user,
                answers: currentSelectedCategories))
        .then((value) => null/* todo THIS IS THE PLACE FOR MIXPANEL LOGGIGNG?*/);
  }
}

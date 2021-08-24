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

  QuestionnaireProvider.withQuestionsAndAnswersApis(QuestionsApi questionsApi, AnswersApi answersApi) {
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

  void showNextScreen() {
    incrementScreenNumber();
    if (screenNumber != 0)
      setPreviousScreenDone();
    this.currentSelectedCategories.clear();
  }

  List<QuestionListModel> get questions {
    return _questions;
  }

  void setPreviousScreenDone() {
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

  void incrementScreenNumber() {
    _screenNumber++;
  }

  void skipCurrentQuestion() {
    skippedQuestions.add(getCurrentQuestion!);
  }

  void saveQuestion(int score) {
    double scoreDouble = score / 4;
    answerApi
        .createAnswer(
            getCurrentQuestion!.id,
            CreateAnswerRequest(
                questionId: getCurrentQuestion!.id,
                userId: 'Verkest',
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
        .then((value) => print(value));
  }

  void addCategoryAnswer(int selectedCategoryIndex) {
    // find the category option in the current question
    // todo check if its a category question
    var toSelectCategory =
        getCurrentQuestion!.categoryOptions!.elementAt(selectedCategoryIndex);
    //todo, check if the category isn't already selected somehow
    toSelectCategory.tagScores.forEach((key, value) {
      this
          .currentSelectedCategories
          .add(CreateAnswerDetailRequest(tag: key, score: 1));
    });
  }

  void saveCategories() {
    answerApi
        .createAnswer(
            getCurrentQuestion!.id,
            CreateAnswerRequest(
                questionId: getCurrentQuestion!.id,
                userId: 'Verkest',
                answers: currentSelectedCategories))
        .then((value) => print(value));
  }
}

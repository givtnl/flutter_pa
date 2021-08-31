import 'dart:async';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

enum ChoiceScreenType { statement, category }

class QuestionnaireProvider with ChangeNotifier {
  var _screenNumber = 0;

  late QuestionsApi questionsApi;
  late AnswersApi answerApi;

  List<QuestionListModel> _questions = [];
  List<QuestionListModel> completedQuestions = [];
  List<QuestionListModel> skippedQuestions = [];
  List<CreateAnswerDetailRequest> currentSelectedCategories = [];
  double currentSelectedStatementAnswer = 2;

  QuestionnaireProvider() {
    this.questionsApi = QuestionsApi();
    this.answerApi = AnswersApi();
  }

  QuestionnaireProvider.withDependencies(QuestionsApi questionsApi, AnswersApi answersApi) {
    this.questionsApi = questionsApi;
    this.answerApi = answersApi;
  }

  Future<void> loadQuestions() async {
    return await this.questionsApi.getQuestionsList().catchError((error) => Future.error(error)).then((response) {
      _questions = response.result;
      _questions.sort((a, b) => a.displayOrder - b.displayOrder);
    });
  }

  void setCurrentStatementValue(double score) {
    this.currentSelectedStatementAnswer = score;
  }

  void prepareNextScreen() {
    _incrementScreenNumber();
    if (screenNumber != 0) _setPreviousScreenDone();
    this.currentSelectedCategories.clear();
    this.currentSelectedStatementAnswer = 2;
    notifyListeners();
  }

  Future<bool> preparePreviousScreen() {
    var onFirstQuestion = screenNumber == 0;
    if (!onFirstQuestion) {
      _decrementScreenNumber();
      this.currentSelectedCategories.clear();
      completedQuestions.removeWhere((element) => element.id == getCurrentQuestion!.id);
      skippedQuestions.removeWhere((element) => element.id == getCurrentQuestion!.id);
      notifyListeners();
    }
    return Future.value(onFirstQuestion);
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
    return questions.length == (completedQuestions.length + skippedQuestions.length);
  }

  ChoiceScreenType get currentScreenType {
    return getCurrentQuestion!.type == QuestionType.number0 ? ChoiceScreenType.statement : ChoiceScreenType.category;
  }

  QuestionListModel? get getCurrentQuestion {
    return questions.length-1 >= screenNumber ? questions[screenNumber] : null;
  }

  String get getCurrentQuestionTranslation {
    var currentLang = 'nl';
    if (getCurrentQuestion == null) {
      return '';
    }
    if (getCurrentQuestion!.translations != null && getCurrentQuestion!.translations.containsKey(currentLang)) {
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
        if (getCurrentQuestion!.categoryOptions![i].translations.containsKey(currentLang)) {
          list.add(getCurrentQuestion!.categoryOptions![i].translations![currentLang]!);
        }
      }
    }
    return list;
  }

  double get currentProgress {
    return ((completedQuestions.length + skippedQuestions.length) / questions.length) * 100;
  }

  int get screenNumber {
    return _screenNumber;
  }

  void _incrementScreenNumber() {
    _screenNumber++;
  }

  void _decrementScreenNumber() {
    _screenNumber--;
  }

  void skipCurrentQuestion() {
    skippedQuestions.add(getCurrentQuestion!);
  }

  Future<void> saveQuestion(String user) async {
    if (getCurrentQuestion!.type == QuestionType.number0) {
      await this
          .answerApi
          .createAnswer(
              getCurrentQuestion!.id,
              CreateAnswerRequest(
                  questionId: getCurrentQuestion!.id,
                  userId: user,
                  answers: [CreateAnswerDetailRequest(tag: this.getCurrentQuestion!.statementOptions.tagScores.keys.first, score: this.currentSelectedStatementAnswer / 4)]))
          .catchError((error) => Future(error));
    } else {
      await answerApi
          .createAnswer(getCurrentQuestion!.id, CreateAnswerRequest(questionId: getCurrentQuestion!.id, userId: user, answers: currentSelectedCategories))
          .then((value) => null /* todo THIS IS THE PLACE FOR MIXPANEL LOGGIGNG?*/);
    }
  }

  void toggleCategoryAnswer(bool selected, int selectedCategoryIndex) {
    QuestionListModel? question = getCurrentQuestion;
    if (question != null && question.type == QuestionType.number1 && getCurrentQuestion!.categoryOptions!.length >= selectedCategoryIndex && selectedCategoryIndex >=0) {
      var toToggleCategory = getCurrentQuestion!.categoryOptions!.elementAt(selectedCategoryIndex);
      toToggleCategory.tagScores.forEach((key, value) {
        CreateAnswerDetailRequest createAnswerDetailRequest = CreateAnswerDetailRequest(tag: key, score: 1);
        if (!currentSelectedCategories.contains(createAnswerDetailRequest) && selected) {
          currentSelectedCategories.add(createAnswerDetailRequest);
        } else if (currentSelectedCategories.contains(createAnswerDetailRequest) && !selected) {
          currentSelectedCategories.remove(createAnswerDetailRequest);
        }
      });
    }
  }
}

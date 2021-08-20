import 'package:flutter/material.dart';
import 'package:flutter_app/screens/categories_screen.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:openapi/api.dart';

class QuestionnaireProvider with ChangeNotifier {
  var _screenNumber = 0;

  final answerApi = AnswersApi();

  List<QuestionListModel> _questions = [];
  List<QuestionListModel> completedQuestions = [];
  List<QuestionListModel> skippedQuestions = [];
  List<CreateAnswerDetailRequest> currentSelectedCategories = [];


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
    this.currentSelectedCategories.clear();
  }

  List<QuestionListModel> get questions {
    return _questions;
  }

  void setPreviousScreenDone() {
    if (!questions.isEmpty){
      QuestionListModel? qlm = questions.elementAt(_screenNumber -1);
      completedQuestions.add(qlm);
    }
  }

  QuestionListModel? getNextQuestion() {
    return !isCompleted? questions.elementAt(_screenNumber) : null;
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
      for (var i=0; i < 4; i++) {
        if (getCurrentQuestion!.categoryOptions![i].translations.containsKey(currentLang)) {
          list.add(getCurrentQuestion!.categoryOptions![i].translations![currentLang]!);
        }
      }
    }
    return list;
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

  void saveQuestion(int score) {
    double scoreDouble = score/4;
    answerApi.createAnswer(getCurrentQuestion!.id, CreateAnswerRequest(questionId: getCurrentQuestion!.id, userId: 'Verkest', answers: [CreateAnswerDetailRequest(tag: this.getCurrentQuestion!.statementOptions.tagScores.keys.first, score: scoreDouble)])).then((value) => print(value));
  }

  void addCategoryAnswer(int selectedCategoryIndex){
    // find the category option in the current question
    // todo check if its a category question
    var toSelectCategory = getCurrentQuestion!.categoryOptions!.elementAt(selectedCategoryIndex);
    //todo, check if the category isn't already selected somehow
    toSelectCategory.tagScores.forEach((key, value) {
      this.currentSelectedCategories.add(CreateAnswerDetailRequest(tag: key,score:1));
    });
  }

  void saveCategories() {
    answerApi.createAnswer(getCurrentQuestion!.id, CreateAnswerRequest(questionId: getCurrentQuestion!.id, userId: 'Verkest', answers: currentSelectedCategories)).then((value) => print(value));
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

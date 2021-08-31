import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:openapi/api.dart';
import 'questionnaire_provider_test.mocks.dart';

@GenerateMocks([QuestionsApi, AnswersApi])
void main() {
  GetQuestionsListResponse questionListResponse = GetQuestionsListResponse(result: [
    QuestionListModel(id: "ea63b0bb-38bb-443a-9c75-dfd3cd65356f", type: QuestionType.number1, displayOrder: 4, translations: {
      "nl": "Welke van deze thema’s vind jij belangrijk?"
    }, categoryOptions: [
      QuestionCategoryOptionModel(displayOrder: 1, translations: {"en": "animals", "nl": "dieren"}, tagScores: {"Animals": 100}),
      QuestionCategoryOptionModel(displayOrder: 2, translations: {"en": "health", "nl": "gezondheid"}, tagScores: {"Health": 100}),
      QuestionCategoryOptionModel(
          displayOrder: 3, translations: {"en": "international aid and human rights", "nl": "internationale hulp en mensenrechten"}, tagScores: {"International aid and human rights": 100}),
      QuestionCategoryOptionModel(displayOrder: 4, translations: {"en": "art en culture", "nl": "kunst en cultuur"}, tagScores: {"Art and culture": 100}),
    ]),
    QuestionListModel(
        id: "38390a35-6ce2-4778-bf73-be39dbfb323a",
        type: QuestionType.number0,
        displayOrder: 2,
        translations: {"nl": "Voordat ik geef, controleer ik of mijn donatie belastingaftrekbaar is."},
        statementOptions: QuestionStatementModel(tagScores: {"Tax relief": 100})),
    QuestionListModel(
        id: "b8e58fbe-a5a9-4685-9256-29a402b01139",
        type: QuestionType.number0,
        displayOrder: 1,
        translations: {"nl": "Ik wil geven aan doelen die een effect hebben in mijn directe omgeving."},
        statementOptions: QuestionStatementModel(tagScores: {"Tax relief": 100})),
    QuestionListModel(
        id: "d2ed67d8-5679-4ab5-b945-1d94e1289a85",
        type: QuestionType.number0,
        displayOrder: 3,
        translations: {"nl": "Een goed doel met keurmerk geeft mij meer vertrouwen in een juiste besteding van mijn donatie."},
        statementOptions: QuestionStatementModel(tagScores: {"Certification mark": 100})),
    QuestionListModel(
        id: "190063d2-a68d-4cff-a0fe-5dce7cbc869f",
        type: QuestionType.number0,
        displayOrder: 5,
        translations: {"nl": "Voordat ik geef, controleer ik of mijn donatie belastingaftrekbaar is."},
        statementOptions: QuestionStatementModel(tagScores: {"Tax relief": 100})),
  ]);

  group('QuestionnaireProvider tests', () {
    final questionsApi = MockQuestionsApi();
    final answersApi = MockAnswersApi();

    // manier zoeken om uit te vinden als een bepaalde methode op een mock is uitgevoerd @tony why?

    when(questionsApi.getQuestionsList()).thenAnswer((_) => Future.value(questionListResponse));

    test('Ensure Questions Are Assigned When Executing Http Call', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      expect(questionListResponse.result.length, equals(provider.questions.length));
    });

    test('Ensure Questions Are Sorted On DisplayOrder', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      expect(questionListResponse.result[0].displayOrder, equals(1));
      expect(questionListResponse.result[4].displayOrder, equals(5));
    });

    test('Ensure Next Question Has Correct DisplayOrder', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      expect(provider.getNextQuestion()!.displayOrder, equals(2));
    });

    test('Ensure answered question gets added to completed questions', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      expect(provider.completedQuestions.first, questionListResponse.result.first);
    });

    test('Ensure next ChoiceScreenType is /question', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      expect(provider.currentScreenType, equals(ChoiceScreenType.statement));
    });

    test('Ensure next ChoiceScreenType is /category', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      expect(provider.currentScreenType, equals(ChoiceScreenType.category));
    });

    test('Ensure next ChoiceScreenType is /suggestions', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      expect(provider.isCompleted, true);
    });

    test('Ensure that skipping a question adds it to the skipped questions array', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.skipCurrentQuestion();
      provider.prepareNextScreen();
      provider.skipCurrentQuestion();
      provider.prepareNextScreen();
      provider.skipCurrentQuestion();
      provider.prepareNextScreen();
      provider.skipCurrentQuestion();
      provider.prepareNextScreen();
      provider.skipCurrentQuestion();
      provider.prepareNextScreen();
      expect(provider.skippedQuestions.length, equals(5));
    });

    test('Ensure that a category is added correctly to the currentSelectedCategories list', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.toggleCategoryAnswer(true, 0);
      provider.toggleCategoryAnswer(true, 2);
      expect(provider.currentSelectedCategories.length, equals(2));
    });

    test('Ensure that preparing the next question on a category screen clears the currentSelectedCategories list', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.toggleCategoryAnswer(true, 0);
      provider.toggleCategoryAnswer(true, 2);
      provider.prepareNextScreen();
      expect(provider.currentSelectedCategories.length, equals(0));
    });

    test('Ensure answered Category gets added to completed questions', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      expect(provider.completedQuestions.where((element) => element.type == QuestionType.number1), questionListResponse.result.where((element) => element.type == QuestionType.number1));
    });

    test('Ensure toggle categories on statement does not add it to currentSelectedCategories', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      provider.toggleCategoryAnswer(true, 1);
      expect(provider.currentSelectedCategories.length, 0);
    });

    test('Ensure toggle categories adds and removes the categories correctly', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      expect(provider.currentSelectedCategories.length, 0);
      provider.toggleCategoryAnswer(true, 0);
      expect(provider.currentSelectedCategories.length, 1);
      provider.toggleCategoryAnswer(true, 1);
      expect(provider.currentSelectedCategories.length, 2);
      provider.toggleCategoryAnswer(false, 0);
      expect(provider.currentSelectedCategories.length, 1);
      provider.toggleCategoryAnswer(false, 1);
      expect(provider.currentSelectedCategories.length, 0);
    });

    test('Ensure toggle categories does not throw exception with wrong index', () async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.toggleCategoryAnswer(false, 10);
      expect(provider.currentSelectedCategories.length, 0);
    });
  });
}

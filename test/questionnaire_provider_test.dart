import 'package:flutter/cupertino.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/screens/categories_screen.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:openapi/api.dart';
import 'MockNavigatorObserver.dart';
import 'questionnaire_provider_test.mocks.dart';

@GenerateMocks([QuestionsApi, AnswersApi])
void main() {
  GetQuestionsListResponse questionListResponse = GetQuestionsListResponse(
      result: [
        QuestionListModel(
            id: "ea63b0bb-38bb-443a-9c75-dfd3cd65356f",
            type: QuestionType.number1,
            displayOrder: 4,
            translations: {
              "nl": "Welke van deze thema’s vind jij belangrijk?"
            },
            categoryOptions: [
              QuestionCategoryOptionModel(
                  displayOrder: 1,
                  translations: {"en": "animals", "nl": "dieren"},
                  tagScores: {"Animals": 100}),
              QuestionCategoryOptionModel(
                  displayOrder: 2,
                  translations: {"en": "health", "nl": "gezondheid"},
                  tagScores: {"Health": 100}),
              QuestionCategoryOptionModel(displayOrder: 3, translations: {
                "en": "international aid and human rights",
                "nl": "internationale hulp en mensenrechten"
              }, tagScores: {
                "International aid and human rights": 100
              }),
              QuestionCategoryOptionModel(
                  displayOrder: 4,
                  translations: {
                    "en": "art en culture",
                    "nl": "kunst en cultuur"
                  },
                  tagScores: {"Art and culture": 100}),
            ]),
        QuestionListModel(
            id: "38390a35-6ce2-4778-bf73-be39dbfb323a",
            type: QuestionType.number0,
            displayOrder: 2,
            translations: {
              "nl":
              "Voordat ik geef, controleer ik of mijn donatie belastingaftrekbaar is."
            },
            statementOptions:
            QuestionStatementModel(tagScores: {"Tax relief": 100})),
        QuestionListModel(
            id: "b8e58fbe-a5a9-4685-9256-29a402b01139",
            type: QuestionType.number0,
            displayOrder: 1,
            translations: {
              "nl":
              "Ik wil geven aan doelen die een effect hebben in mijn directe omgeving."
            },
            statementOptions:
            QuestionStatementModel(tagScores: {"Tax relief": 100})),
        QuestionListModel(
            id: "d2ed67d8-5679-4ab5-b945-1d94e1289a85",
            type: QuestionType.number0,
            displayOrder: 3,
            translations: {
              "nl":
              "Een goed doel met keurmerk geeft mij meer vertrouwen in een juiste besteding van mijn donatie."
            },
            statementOptions:
            QuestionStatementModel(tagScores: {"Certification mark": 100})),
        QuestionListModel(
            id: "190063d2-a68d-4cff-a0fe-5dce7cbc869f",
            type: QuestionType.number0,
            displayOrder: 5,
            translations: {
              "nl":
              "Voordat ik geef, controleer ik of mijn donatie belastingaftrekbaar is."
            },
            statementOptions:
            QuestionStatementModel(tagScores: {"Tax relief": 100})),
      ]);
  CreateAnswerRequest createAnswerRequest = CreateAnswerRequest(
      answers: [CreateAnswerDetailRequest(tag: 'Tax relief', score: 0.0)],
      questionId: 'b8e58fbe-a5a9-4685-9256-29a402b01139',
      userId: 'Verkest');
  CreateQuestionResponse createQuestionResponse = CreateQuestionResponse(id: 'b8e58fbe-a5a9-4685-9256-29a402b01139');

  group('QuestionnaireProvider tests', () {
    final questionsApi = MockQuestionsApi();
    final answersApi = MockAnswersApi();
    final mockObserver = MockNavigatorObserver();

    //manier zoeken om uit te vinden als een bepaalde methode op een mock is uitgevoerd

    // er voor zorgen dat de currentselectedcategories leeg zijn na uitvoeren flow

    // ervoor zorgen dat addcategory answer de item toevoegt in de lijst (tagscores)

    when(questionsApi.getQuestionsList())
        .thenAnswer((_) => Future.value(questionListResponse));
    when(answersApi.createAnswer('b8e58fbe-a5a9-4685-9256-29a402b01139', createAnswerRequest))
        .thenAnswer((_) => Future.value(createQuestionResponse));

    test('Ensure Questions Are Assigned When Executing Http Call', () async {
      var provider = QuestionnaireProvider
          .withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      expect(questionListResponse.result.length,
          equals(provider.questions.length));
    });

    test('Ensure Questions Are Sorted On DisplayOrder', () async {
      var provider = QuestionnaireProvider
          .withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      expect(questionListResponse.result[0].displayOrder, equals(1));
      expect(questionListResponse.result[4].displayOrder, equals(5));
    });

    test('Ensure Next Question Has Correct DisplayOrder', () async {
      var provider = QuestionnaireProvider
          .withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      expect(provider.getNextQuestion()!.displayOrder, equals(2));
    });

    test('Ensure answered question gets added to completed questions', () async {
      var provider = QuestionnaireProvider
          .withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      expect(provider.completedQuestions.first, questionListResponse.result.first);
    });
    
    test('Ensure next route name is /question', ()  async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      expect(provider.getNextRouteName, equals(QuestionScreen.routeName));
    });

    test('Ensure next route name is /category', ()  async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      expect(provider.getNextRouteName, equals(CategoriesScreen.routeName));
    });


    test('Ensure next route name is /suggestions', ()  async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      provider.prepareNextScreen();
      expect(provider.getNextRouteName, equals(SuggestionsScreen.routeName));
    });

    test('', ()  async {
      var provider = QuestionnaireProvider.withDependencies(questionsApi, answersApi);
      await provider.loadQuestions();
      provider.addCategoryAnswer(0);
      provider.addCategoryAnswer(1);
      expect
      provider.prepareNextScreen();
      expect();
    });


  });
}

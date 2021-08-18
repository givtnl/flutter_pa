import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/question.dart';

class QuestionsProvider with ChangeNotifier {
  List<Question> _questions = List.empty(growable: true);
  /*List<Question> _questions = [
    Question(1, "Een goed doel met keurmerk geeft mij meer vertrouwen in een juiste besteding van mijn donatie."),
    Question(2, "Goede doelen moeten al het geld besteden aan het doel en niet aan het werven van nieuwe fondsen."),
    Question(3, "Voordat ik geef, controleer ik of mijn donatie belastingaftrekbaar is."),
    Question(4, "Ik wil geven aan doelen die een effect hebben in mijn directe omgeving."),
    Question(5, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(6, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(7, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(8, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(9, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(10, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(11, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(12, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(13, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(14, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(15, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(16, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(17, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(18, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(19, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(20, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question(21, "Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
  ];*/

  List<Question> get questions => [..._questions];

  Question? get nextQuestion => _questions.firstWhereOrNull((element) => !element.isAnswered && !element.isSkipped);

  List<Question> get unansweredQuestions => _questions.where((element) => !element.isAnswered && !element.isSkipped).toList();

  Question getQuestionById(String id) => _questions.firstWhere((element) => element.id == id);

  void answerQuestion(String id, int answer) {
    var question = getQuestionById(id);
    question.isAnswered = true;
    question.answer = answer;
  }

  void skipQuestion(String id) {
    var question = getQuestionById(id);
    question.isSkipped = true;
  }

  void addQuestion(String id, String question) {
    _questions.add(Question(id, question));
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/question.dart';

class QuestionsProvider with ChangeNotifier {
  List<Question> _questions = [
    Question("Een goed doel met keurmerk geeft mij meer vertrouwen in een juiste besteding van mijn donatie."),
    Question("Goede doelen moeten al het geld besteden aan het doel en niet aan het werven van nieuwe fondsen."),
    Question("Voordat ik geef, controleer ik of mijn donatie belastingaftrekbaar is."),
    Question("Ik wil geven aan doelen die een effect hebben in mijn directe omgeving."),
    Question("Als goede doelen op vrijwilligers draaien, worden donaties het best besteed."),
    Question("Religieuze overtuiging mag geen rol spelen in de hulpverlening die een organisatie biedt."),
    Question("Ik geef niet aan doelen zonder keurmerk."),
  ];

  List<Question> get questions => [..._questions];
}
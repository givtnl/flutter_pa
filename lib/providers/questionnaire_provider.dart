import 'package:flutter/material.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/models/question.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/providers/categories_provider.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:provider/provider.dart';

class QuestionnaireScreen {
    Question? question;
    List<Category>? categories;
    QuestionnaireScreenType type;
    bool done = false;

    QuestionnaireScreen(this.type, {this.question, this.categories});
}

enum QuestionnaireScreenType {
    Question,
    Category
}

class QuestionnaireProvider with ChangeNotifier {
    final totalNumberOfQuestionScreens = QuestionsProvider().questions.length;
    final totalNumberOfCategoryScreens = (CategoryProvider().categories.length / 4).ceil();

    var _screenNumber = 0;
    var numberOfQuestionScreensPerCategoryScreen = 0;
    var totalNumberOfScreens = 0;

    List<QuestionnaireScreen> questionnaireScreens = [];

    QuestionnaireProvider() {
        for (var i = 0; i < (totalNumberOfCategoryScreens+totalNumberOfQuestionScreens); i++) {
            print(i);
        }
    }

    void showNextScreen(ctx) {
        var nextQuestion = questionnaireScreens.firstWhereOrNull((element) => element.done);
        if (nextQuestion == null) {
            Navigator.pushNamed(ctx, SuggestionsScreen.routeName);
        } else {
            switch(nextQuestion.type) {
                case QuestionnaireScreenType.Category:
                    Navigator.pushNamed(ctx, SuggestionsScreen.routeName);
                    break;
                case QuestionnaireScreenType.Question:
                    Navigator.pushNamed(ctx, SuggestionsScreen.routeName);
                    break;
            }
        }
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
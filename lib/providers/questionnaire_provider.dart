import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/providers/categories_provider.dart';

class QuestionnaireProvider with ChangeNotifier {
    final totalNumberOfQuestionScreens = QuestionsProvider().questions.length;
    final totalNumberOfCategoryScreens = (CategoryProvider().categories.length / 4).ceil();

    var _screenNumber = 0;
    var numberOfQuestionScreensPerCategoryScreen = 0;
    var totalNumberOfScreens = 0;

    QuestionnaireProvider() {
        totalNumberOfScreens = totalNumberOfQuestionScreens + totalNumberOfCategoryScreens;
        numberOfQuestionScreensPerCategoryScreen = (totalNumberOfScreens / (totalNumberOfCategoryScreens + 1)).ceil();
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
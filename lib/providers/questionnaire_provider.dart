import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questions_provider.dart';
import 'package:flutter_app/providers/categories_provider.dart';

class QuestionnaireProvider with ChangeNotifier {
    final totalNumberOfQuestionScreens = QuestionsProvider().questions.length;
    final totalNumberOFCategoryScreens = (CategoryProvider().categories.length / 4).ceil();

    var _screenNumber = 2; //because used the second time the next button is clicked
    var numberOfQuestionScreensPerCategoryScreen = 0;
    var totalNumberOfScreens = 0;

    QuestionnaireProvider() {
        totalNumberOfScreens = totalNumberOfQuestionScreens + totalNumberOFCategoryScreens;
        numberOfQuestionScreensPerCategoryScreen = (totalNumberOfScreens / (totalNumberOFCategoryScreens + 1)).ceil(); //show x numberOfQuestionScreens
        print('totalNumberOfScreens: ' + totalNumberOfScreens.toString());
        print('numberOfQuestionScreensPerCategoryScreen: ' + numberOfQuestionScreensPerCategoryScreen.toString());
    }

    int get screenNumber {
        return _screenNumber;
    }

    bool get isNextScreenACategoriesScreen {
        print('screenNumber: ' + _screenNumber.toString());
        print(_screenNumber % numberOfQuestionScreensPerCategoryScreen == 0);
        return _screenNumber % numberOfQuestionScreensPerCategoryScreen == 0;
    }

    double get currentProgress {
        return _screenNumber / totalNumberOfScreens;
    }

    void incrementScreenNumber() {
        _screenNumber++;
    }
}
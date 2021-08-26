import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/categories_screen.dart';
import 'package:flutter_app/screens/question_screen.dart';
import 'package:flutter_app/screens/suggestions_screen.dart';
import 'package:openapi/api.dart';

class AppRouting {
    static Route getNextScreen(bool isFlowCompleted, QuestionType questionType) {
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => isFlowCompleted ? SuggestionsScreen() : questionType == QuestionType.number0 ? QuestionScreen() : CategoriesScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: Duration(milliseconds: 500));
    }
}
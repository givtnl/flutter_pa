import 'dart:math';

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/services.dart';
import 'package:flutter_app/models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = List.empty(growable: true);
  /*List<Category> _categories = [
    Category(1,'dieren','dieren'),
    Category(2,'gezondheid','gezondheid'),
    Category(3,'internationale hulp en mensenrechten','hulp'),
    Category(4,'kunst','kunst'),
    Category(5,'kunst1','kunst'),
    Category(6,'kunst2','kunst'),
    Category(7,'kunst3','kunst'),
    Category(8,'kunst4','kunst'),
    Category(9,'kunst5','kunst'),
    Category(10,'kunst6','kunst'),
  ];*/

  List<Category> get categories => [..._categories];

  Category getCategoryById(String id) => [..._categories].firstWhere((element) => element.id == id);

  List<Category> nextFourCategories(int screenNumber, int numberOfQuestionScreensPerCategoryScreen) {
    var categoryScreenNumber = /*(screenNumber / (numberOfQuestionScreensPerCategoryScreen)).floor()-*/1;
    return  _categories.sublist(categoryScreenNumber*4, min(_categories.length, (categoryScreenNumber*4)+4));
  }

  void switchSelected(String id) {
    var category = _categories.firstWhere((element) => element.id == id);
    category.isClicked = !category.isClicked;
  }

  void addCategory(String id, String category, String icon) {
    _categories.add(Category(id, category, icon));
  }

}
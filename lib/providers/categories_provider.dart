import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_app/models/category.dart';
import 'package:collection/collection.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [
    Category(1,'dieren','dieren'),
    Category(2,'gezondheid','gezondheid'),
    Category(3,'internationale hulp en mensenrechten','hulp'),
    Category(4,'kunst','kunst'),
  ];

  List<Category> get categories => [..._categories];

  Category getCategoryById(int id) => [..._categories].firstWhere((element) => element.id == id);

  void switchSelected(int id) {
    var category = _categories.firstWhere((element) => element.id == id);
    category.isClicked = !category.isClicked;
  }
}
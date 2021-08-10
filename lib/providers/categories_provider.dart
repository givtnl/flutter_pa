import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_app/models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [
    Category(1,'dieren','dieren'),
    Category(2,'gezondheid','gezondheid'),
    Category(3,'internationale hulp en mensenrechten','hulp'),
    Category(4,'kunst','kunst'),
  ];

  List<Category> getAllCategories() {
    return [..._categories];
  }

  Category getCategoryById(int id) => _categories.firstWhere((element) => element.id == id);

  void setCategorySelected(int id) {
    var category = getCategoryById(id);
    category.isClicked = true;
  }
}
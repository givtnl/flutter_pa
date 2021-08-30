import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  late String userName = "";
  bool inputEmpty = true;
  bool initialEmpty = true;
  UserProvider();

  void setInitialEmptyFalse() {
    initialEmpty = false;
    notifyListeners();
  }
}
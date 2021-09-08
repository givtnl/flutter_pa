import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:provider/provider.dart';

import 'background_patterns/pattern1.dart';
import 'background_patterns/pattern2.dart';
import 'background_patterns/pattern3.dart';

class BackgroundWidget extends StatefulWidget {
  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> with SingleTickerProviderStateMixin {

  int _currentPattern = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_currentPattern < 2)
      _currentPattern++;
    else {
      _currentPattern = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuestionnaireProvider>(context);
    switch(_currentPattern) {
      case 0:
        return BackgroundPattern1();
      case 1:
        return BackgroundPattern2();
      case 2:
        return BackgroundPattern3();
      default:
        return BackgroundPattern1();
    };
  }
}

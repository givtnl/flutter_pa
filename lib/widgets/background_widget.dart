import 'package:flutter/material.dart';
import 'package:flutter_app/providers/questionnaire_provider.dart';
import 'package:flutter_app/widgets/slideable_container/slideable_container.dart';
import 'package:provider/provider.dart';

import 'background_patterns/pattern1.dart';
import 'background_patterns/pattern2.dart';
import 'background_patterns/pattern3.dart';

class BackgroundWidget extends StatefulWidget {
  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> with SingleTickerProviderStateMixin {
  final GlobalKey<SlideableContainerState> key = GlobalKey<SlideableContainerState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    key.currentState?.showNextWidget();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<QuestionnaireProvider>(context);
    return SlideableContainer(
      key: key,
      widgetsToShow: [
        BackgroundPattern1(),
        BackgroundPattern2(),
        BackgroundPattern3(),
      ],
    );
  }
}

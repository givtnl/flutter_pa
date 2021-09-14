import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/slideable_container/slideable_container_element.dart';

class SlideableContainer extends StatefulWidget {
  const SlideableContainer({Key? key, required this.widgetsToShow}) : super(key: key);

  final List<Widget> widgetsToShow;

  @override
  SlideableContainerState createState() => SlideableContainerState(widgetsToShow);
}

class SlideableContainerState extends State<SlideableContainer> {

  SlideableContainerState(List<Widget> widgets) {
    // map all incoming widgets to slider elements and set the initial element
    var sliderElements = widgets.map<SlideableContainerElement>((widget) {
      // if the item is in the first position then it is initial
      var initial = widgets.indexOf(widget) == 0;

      var currentWidget = SlideableContainerElement(
        widget,
        key: GlobalKey<SlideableContainerElementState>(),
        init: initial,
      );

      // set current widget to initial widget so it can slide away when clicking for the first time on the button
      if (initial) {
        _currentWidget = currentWidget;
      }

      return currentWidget;
    }).toList();
    _widgetsToShow = sliderElements;
  }

  SlideableContainerElement? _currentWidget;
  late List<SlideableContainerElement> _widgetsToShow;

  @override
  Widget build(BuildContext context) {
    // Use a stack so all elements can be on top of each other.
    return Stack(
      children: _widgetsToShow,
    );
  }

  showNextWidget() {
    try {
      var widgetToSlideIn = _widgetsToShow
          .firstWhere((element) => (element.key as GlobalKey<SlideableContainerElementState>).currentState?.isIn == false && (element.key as GlobalKey<SlideableContainerElementState>).currentState?.isShown == false);

      if (_currentWidget != null) {
        (_currentWidget!.key as GlobalKey<SlideableContainerElementState>).currentState?.slideOut();
      }

      _currentWidget = widgetToSlideIn;
      var widgetToSlideInKey = widgetToSlideIn.key as GlobalKey<SlideableContainerElementState>;
      widgetToSlideInKey.currentState?.slideIn();
    } on StateError catch (_) {
      // when a state error occurs then there is no element found that is not yet shown.
      // So we set all elements to not shown again
      _widgetsToShow.forEach((element) {
        (element.key as GlobalKey<SlideableContainerElementState>).currentState?.isShown = false;
      });
      // call to show next widget so we can start showing the first element again
      showNextWidget();
    }
  }
}

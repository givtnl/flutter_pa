import 'package:flutter/material.dart';

class SlideableContainerElement extends StatefulWidget {
  const SlideableContainerElement (this._child, {required Key key, bool this.init = false}) : super(key: key);

  final Widget _child;
  final init;

  @override
  SlideableContainerElementState createState() => SlideableContainerElementState(_child, init);
}


class SlideableContainerElementState extends State<SlideableContainerElement> with TickerProviderStateMixin {

  late Animation<Offset> _animationIn;
  late Animation<Offset> _animationOut;

  late AnimationController _controllerIn;
  late AnimationController _controllerOut;

  final Widget _child;

  bool isIn = false;
  bool isShown = false;

  SlideableContainerElementState(this._child, init) {
    // when it is the initial element set is in to true and is shown to true,
    // so this element is already displayed when building the widget!
    if (init) {
      this.isIn = true;
      this.isShown = true;
    }
  }

  void slideIn() {
    _controllerIn.forward();
    _controllerOut.reset();
  }

  void slideOut() {
    _controllerOut.forward();
    _controllerIn.reset();
  }

  @override
  void dispose() {
    _controllerOut.dispose();
    _controllerIn.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controllerIn = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationIn = Tween<Offset>(begin: Offset(1.0, 0), end: Offset.zero).animate(CurvedAnimation(parent: _controllerIn, curve: Curves.easeIn));

    _controllerOut = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationOut = Tween<Offset>(begin: Offset.zero, end: Offset(-1.0, 0)).animate(CurvedAnimation(parent: _controllerOut, curve: Curves.easeIn));

    _animationIn.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isShown = true;
          isIn = true;
        });
      }
    });

    _animationOut.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isIn = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    // add a container with max width and max height so we can use the whole screen when needed.
    // Or when positioned inside an element we can use all the available space
    return Container(
      child: SlideTransition(
        position: isIn ? _animationOut : _animationIn,
        child: _child,
      ),
    );
  }
}
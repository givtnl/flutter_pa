import 'package:flutter/cupertino.dart';

class MediaQueryService {
  late BuildContext _context;
  late Size _screenSize;
  late double _devicePixelRatio;

  MediaQueryService(BuildContext context) {
    _context = context;
    _screenSize = screenSize;
    _devicePixelRatio = devicePixelRatio;
  }

  static MediaQueryService getInstance(BuildContext context) {
    return MediaQueryService(context);
  }

  double getPercentageHeight(int percentage, String elementName) {
    var value = actualHeight * (percentage / 100);
    print("${elementName} position Y: ${value}");
    return value;
  }

  double getPercentageWidth(int percentage, String elementName) {
    var value = actualWidth * (percentage / 100);
    print("${elementName} position X: ${value}");
    return value;
  }

  double get actualHeight {
    var value = (_screenSize.height * _devicePixelRatio) - statusBarHeight;
    print("Screen height: " + value.toString());
    return value;
  }

  double get actualWidth {
    var value = _screenSize.width * _devicePixelRatio;
    print("Screen width: " + value.toString());
    return value;
  }

  double get statusBarHeight {
    return MediaQuery.of(_context).padding.top;
  }

  Size get screenSize {
    return MediaQuery.of(_context).size;
  }

  double get devicePixelRatio {
    return MediaQuery.of(_context).devicePixelRatio;
  }
}

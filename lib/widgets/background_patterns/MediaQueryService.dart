import 'package:flutter/cupertino.dart';

class MediaQueryService {
  late BuildContext _context;
  late Size _screenSize;

  MediaQueryService(BuildContext context) {
    _context = context;
    _screenSize = screenSize;
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
    var value = _screenSize.height;
    print("Screen height: " + value.toString());
    return value;
  }

  double get actualWidth {
    var value = _screenSize.width;
    print("Screen width: " + value.toString());
    return value;
  }

  double get statusBarHeight {
    return MediaQuery.of(_context).padding.top;
  }

  Size get screenSize {
    return MediaQuery.of(_context).size;
  }
}

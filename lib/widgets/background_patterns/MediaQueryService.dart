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
    return value;
  }

  double getPercentageWidth(int percentage, String elementName) {
    var value = actualWidth * (percentage / 100);
    return value;
  }

  double get actualHeight {
    var value = _screenSize.height;
    return value;
  }

  double get actualWidth {
    var value = _screenSize.width;
    return value;
  }

  double get statusBarHeight {
    return MediaQuery.of(_context).padding.top;
  }

  Size get screenSize {
    return MediaQuery.of(_context).size;
  }
}

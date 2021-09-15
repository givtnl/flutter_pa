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

  double getPercentageHeight(int percentage) {
    return actualHeight * (percentage / 100);
  }

  double getPercentageWidth(int percentage) {
    return actualWidth * (percentage / 100);
  }

  double get actualHeight {
    return (_screenSize.height * _devicePixelRatio) - statusBarHeight;
  }

  double get actualWidth {
    return _screenSize.width * _devicePixelRatio;
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

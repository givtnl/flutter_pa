import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/themes/shapes/customRectSliderShape.dart';
import 'package:flutter_app/themes/shapes/customRoundSliderThumbShape.dart';
import 'package:flutter_app/themes/shapes/customValueIndicatorShape.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: oldPrimaryColor,
        backgroundColor: Color.fromRGBO(222, 233, 243, 1),
        cardColor: Color.fromRGBO(239, 244, 249, 1),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Inter',
            color: oldPrimaryColor,
          ),
        ),
        sliderTheme: SliderThemeData(
          trackHeight: 1,
          trackShape: CustomRectSliderTrackShape(trackColor: purpleColor),
          thumbShape: CustomRoundSliderThumbShape(
            outerRadius: 22,
            innerRadius: 13,
            outerColor: lightPurpleColor,
            innerColor: purpleColor,
          ),
          overlayShape: SliderComponentShape.noOverlay,
          valueIndicatorShape: CustomValueIndicatorShape(),
          valueIndicatorColor: purpleColor,
          valueIndicatorTextStyle: TextStyle(
              // fontFamily: 'Montserrat', TODO: Get Montserrat fonts
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      );

  static Color get blueColor => Color.fromRGBO(36, 75, 129, 1);

  static Color get purpleColor => Color.fromRGBO(124, 96, 143, 1);

  static Color get lightPurpleColor => Color.fromRGBO(124, 96, 143, 0.25);

  static Color get appleBlueSeaGreen => Color.fromRGBO(159, 197, 194, 1);

  static Color get oldPrimaryColor => Color.fromRGBO(36, 106, 177, 1);
}

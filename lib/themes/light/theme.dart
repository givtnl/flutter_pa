import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/themes/shapes/customRectSliderShape.dart';
import 'package:flutter_app/themes/shapes/customRoundSliderThumbShape.dart';
import 'package:flutter_app/themes/shapes/customValueIndicatorShape.dart';

class LightTheme {
  static String _fontFamily = "Montserrat";

  static ThemeData get theme => ThemeData(
        primaryColor: blueColor,
        accentColor: purpleColor,
        buttonColor: appleBlueSeaGreen,
        backgroundColor: Color.fromRGBO(238, 237, 233, 1),
        cardColor: Color.fromRGBO(239, 244, 249, 1),
        textTheme: TextTheme(
          // Intro page headline
          headline1: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 26,
            color: blueColor,
          ),
          headline2: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: blueColor,
          ),
          // Totally agree and disagree stylings
          headline3: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: blueColor,
          ),
          headline4: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: blueColor,
          ),
          // Intro page subheadline
          subtitle1: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: blueColor,
          ),
          // Skip stylings
          subtitle2: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: blueColor,
            decoration: TextDecoration.underline,
          ),
          // Button on every page
          button: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
          // Old body text
          bodyText1: TextStyle(
            fontFamily: _fontFamily,
            color: oldPrimaryColor,
          ),
          bodyText2: TextStyle(
              fontFamily: _fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: blueColor,
            ),
        ),
        sliderTheme: SliderThemeData(
          trackHeight: 1,
          trackShape: CustomRectSliderTrackShape(
            trackColor: purpleColor,
          ),
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
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      );

  static Color get blueColor => Color.fromRGBO(36, 75, 129, 1);

  static Color get purpleColor => Color.fromRGBO(124, 96, 143, 1);

  static Color get lightPurpleColor => Color.fromRGBO(124, 96, 143, .25);

  static Color get appleBlueSeaGreen => Color.fromRGBO(159, 197, 194, 1);

  static Color get oldPrimaryColor => Color.fromRGBO(36, 106, 177, 1);
}

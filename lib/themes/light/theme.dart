import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/themes/shapes/customRectSliderShape.dart';
import 'package:flutter_app/themes/shapes/customRoundSliderThumbShape.dart';
import 'package:flutter_app/themes/shapes/customValueIndicatorShape.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static ThemeData get theme =>
      ThemeData(
        primaryColor: oldPrimaryColor,
        backgroundColor: Color.fromRGBO(238, 237, 233, 1),
        cardColor: Color.fromRGBO(239, 244, 249, 1),
        textTheme: TextTheme(

          // Intro page headline
          headline1: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26,
                color: blueColor
              )
          ),
          // Intro page subheadline
          subtitle1: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: blueColor
              )
          ),
          // Button on every page
          button: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.white
            )
          ),
          // Old body text
          bodyText1: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: oldPrimaryColor,
              )
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
          valueIndicatorTextStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )
          ),
        ),
      );

  static Color get blueColor => Color.fromRGBO(36, 75, 129, 1);

  static Color get purpleColor => Color.fromRGBO(124, 96, 143, 1);

  static Color get lightPurpleColor => Color.fromRGBO(124, 96, 143, 0.25);

  static Color get appleBlueSeaGreen => Color.fromRGBO(159, 197, 194, 1);

  static Color get oldPrimaryColor => Color.fromRGBO(36, 106, 177, 1);
}

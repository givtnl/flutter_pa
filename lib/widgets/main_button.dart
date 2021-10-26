import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/themes/light/theme.dart';

class MainButton extends StatefulWidget {
  final VoidCallback tapped;
  final String label;
  final double height;
  final double fontSize;
  var webWidth;

  MainButton({required this.label, required this.tapped, required this.height, required this.fontSize, this.webWidth = double.infinity});

  @override
  _MainButtonState createState() => _MainButtonState(label, tapped, height, fontSize, webWidth);
}

class _MainButtonState extends State<MainButton> {
  late VoidCallback tapped;
  late String label;
  late double height;
  late double webWidth;
  late double fontSize;

  _MainButtonState(String label, VoidCallback function, double height, double fontSize, double width) {
    this.tapped = function;
    this.label = label;
    this.height = height;
    this.fontSize = fontSize;
    this.webWidth = width;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb ? webWidth : double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              child: GestureDetector(
                  onTap: tapped,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      height: height,
                      decoration: BoxDecoration(
                        color: LightTheme.appleBlueSeaGreen,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
                      ),
                      child: Center(
                          child: Text(label,
                              style: Theme.of(context).textTheme.button!.merge(TextStyle(fontSize: fontSize)),
                              textAlign: TextAlign.center,
                          )
                      ),
                    ),
                  )
              )
          )
        ],
      ),
    );
  }
}

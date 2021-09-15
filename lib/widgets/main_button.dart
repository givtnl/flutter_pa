import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/themes/light/theme.dart';

class MainButton extends StatefulWidget {
  final VoidCallback tapped;
  final String label;

  MainButton({required this.label, required this.tapped});

  @override
  _MainButtonState createState() => _MainButtonState(label, tapped);
}

class _MainButtonState extends State<MainButton> {
  late VoidCallback tapped;
  late String label;

  _MainButtonState(String label, VoidCallback function) {
    this.tapped = function;
    this.label = label;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: GestureDetector(
                onTap: tapped,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: LightTheme.appleBlueSeaGreen,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
                  ),
                  child: Center(
                      child: Text(label,
                          style: Theme.of(context).textTheme.button,
                          textAlign: TextAlign.center,
                      )
                  ),
                )
            )
        )
      ],
    );
  }
}

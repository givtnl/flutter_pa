import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatefulWidget {
  final VoidCallback tapped;
  final String label;

  BlueButton({required this.label, required this.tapped});

  @override
  _BlueButtonState createState() => _BlueButtonState(label, tapped);
}

class _BlueButtonState extends State<BlueButton> {
  late VoidCallback tapped;
  late String label;

  _BlueButtonState(String label, VoidCallback function) {
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
                  height: MediaQuery.of(context).size.height * .05,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x11000000),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3), // changes position of shadow
                      )
                    ],
                  ),
                  child: Center(child: Text(label, style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                      color: Color(0xffffffff),
                      fontSize: 16)))),
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'big_text.dart';
import 'blue_rounded_button.dart';

class OrganisationProposal extends StatelessWidget {

  final String title;
  final String explanation;
  final int match;

  OrganisationProposal(this.title, this.explanation, this.match);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(title),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              explanation,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(36, 106, 177, 1),
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BlueRoundedButton("Ontdek meer"),
                Expanded(child: Container()),
                BigText("$match%"),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 3.0),
                  child: Text(
                    "match",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(36, 106, 177, 1),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

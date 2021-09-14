import 'package:flutter/material.dart';

class OrganisationExtra extends StatelessWidget {
  final String title;
  final String text;

  OrganisationExtra(this.title, this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title.toUpperCase(), style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w700, fontSize: 14),),
              SizedBox(height: 10,),
              Text(text, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500, fontSize: 12),),
            ],
          )
        ),
      ),
    );
  }
}

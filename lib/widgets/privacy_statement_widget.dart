import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrivacyStatementWidget extends StatelessWidget {
  final VoidCallback voidTapAction;

  PrivacyStatementWidget(this.voidTapAction);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var portrait = size.height > size.width;

    return GestureDetector(
      onTap: voidTapAction,
      child: Container(
        color: Color.fromRGBO(238, 237, 233, 0.75),
        height: double.infinity,
        width: double.infinity,
        child: GestureDetector(
          onTap: () {},
          child: Align(
            alignment: portrait ? Alignment.bottomCenter : Alignment.center,
            child: Column(
              mainAxisAlignment: portrait ? MainAxisAlignment.end : MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Container(
                          height: portrait ? size.height * 0.7 : size.height * 0.5,
                          width: portrait ? double.infinity : size.height * 0.5,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              spreadRadius: 8,
                              blurRadius: 15,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ], color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: Text("PRIVACY VERKLARING", style: Theme.of(context).textTheme.headline2),
                                  ),
                                  Text("""Wij zetten geen cookies op het apparaat waarmee je de Givt Wizard doorloopt. Wij verzamelen ook geen persoonsgegevens of IP-adressen.

De keuzes die je maakt worden zonder persoonlijke identificatie naar de server gestuurd en we registreren ook op welke knoppen je drukt. Op die manier komen wij te weten hoe de Givt Wizard wordt gebruikt. En dat is helemaal anoniem.

Aan het einde van de Givt Wizard krijg je een resultaat dat je later alleen maar nog een keer kunt opvragen als je je e-mailadres achterlaat. Waartoe je niet verplicht wordt.

Als je je e-mailadres achterlaat bestaat er de kans dat je een e-mailtje van ons krijgt met de vraag om ons te helpen de service van Givt te verbeteren.

Wil je meer weten wat die service inhoudt? Bezoek dan onze website: www.givtapp.net of stuur ons een mailtje op info@givtapp.net"""),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: voidTapAction,
                        child: SvgPicture.asset(
                          'assets/svg/close_in_circle.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

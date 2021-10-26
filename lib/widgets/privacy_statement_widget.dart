import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
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
                                    child: Text(S.of(context).privacyPolicyTitle, style: Theme.of(context).textTheme.headline2),
                                  ),
                                  Text(S.of(context).privacyPolicy),
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
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: SvgPicture.asset(
                            'assets/svg/close_in_circle.svg',
                          ),
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

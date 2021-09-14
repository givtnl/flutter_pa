import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:openapi/api.dart';

class MatchWidget extends StatelessWidget {
  final UserOrganisationMatchListModel match;

  MatchWidget(this.match);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50).copyWith(top: 20),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              match.organisation.name.toUpperCase(),
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 15,
                          ),
                          child: Text(match.organisation.mission,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.normal,
                                  )),
                        )
                      ],
                    ),
                  ),
                ),
                MainButton(
                  label: "ontdek meer",
                  tapped: () {},
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${match.score}%",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.button!.copyWith(
                                color: Colors.white,
                              ),
                        ),
                        Text(
                          "match",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white, fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/organisation_tag.dart';

class OrganisationScreen extends StatelessWidget {
  static const routeName = '/organisation-detail';

  final Map<String, bool> _tags = {
    "Internationale hulp en mensenrechten": false,
    "religie en levensbeschouwing": true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: BigText("Organsiatie A"),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "87%",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                "match",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  itemBuilder: (ctx, idx) {
                    return OrganisationTag(_tags.entries.elementAt(idx).key, _tags.entries.elementAt(idx).value);
                  },
                  itemCount: _tags.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Hier komt informatie over organsatie A. Phasellus rhoncus ligula nec venenatis sollicitudin. Morbi egestas lacinia felis, sed posuere mi facilisis at. Donec in egestas nunc. ",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "www.organisatieA.nl",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: <TextSpan>[
                            TextSpan(text: 'Missie: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'hier komt -in het kort- de missie van organsatie A.!'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: <TextSpan>[
                            TextSpan(text: 'Visie: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'hier komt -in het kort- de visie van organsatie A.!'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: <TextSpan>[
                            TextSpan(text: 'Kernwaarden: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'hier komen -in het kort- de kernwaarden van organsatie A.!'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/organisation_tag.dart';

class OrganisationScreen extends StatelessWidget {
  static const routeName = '/organisation-detail';

  final Map<String, bool> _tags = {
    "Internationale hulp en mensenrechten": true,
    "religie en levensbeschouwing": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                BigText("Organsiatie A"),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

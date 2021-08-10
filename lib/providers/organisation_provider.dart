import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/organisation.dart';

class OrganisationProvider with ChangeNotifier {
  List<Organisation> _organisations = [
    Organisation(1, "Organisatie A", "Een woordje uitleg over wat organisatie A precies doet."),
    Organisation(2, "Organisatie B", "Een woordje uitleg over wat organisatie B precies doet."),
  ];

  Future<List<Organisation>> getAllOrganisations() async {
    return [..._organisations];
  }

  Organisation getOrganisationById(int id) => _organisations.firstWhere((element) => element.id == id);
}

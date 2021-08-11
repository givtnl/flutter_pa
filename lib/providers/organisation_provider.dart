import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/organisation.dart';

class OrganisationProvider with ChangeNotifier {
  List<Organisation> _organisations = [
    Organisation(
      id: 1,
      explanation: "Een korte uitleg over wat organisatie A juist doet",
      name: "Organisatie A",
      orgMission: "hier komt -in het kort- de missie van organsatie A.",
      orgVision: "hier komt -in het kort- de visie van organsatie A.",
      orgKeyValues: "hier komt -in het kort- de kernwaarden van organsatie A.",
      orgWebsite: "www.organisatieA.nl",
    ),
    Organisation(
      id: 2,
      explanation: "Een korte uitleg over wat organisatie B juist doet",
      name: "Organisatie B",
      orgMission: "hier komt -in het kort- de missie van organsatie B.",
      orgVision: "hier komt -in het kort- de visie van organsatie B.",
      orgKeyValues: "hier komt -in het kort- de kernwaarden van organsatie B.",
      orgWebsite: "www.organisatieB.nl",
    ),
    Organisation(
      id: 3,
      explanation: "Een korte uitleg over wat organisatie C juist doet",
      name: "Organisatie C",
      orgMission: "hier komt -in het kort- de missie van organsatie C.",
      orgVision: "hier komt -in het kort- de visie van organsatie C.",
      orgKeyValues: "hier komt -in het kort- de kernwaarden van organsatie C.",
      orgWebsite: "www.organisatieC.nl",
    ),
  ];

  Future<List<Organisation>> getAllOrganisations() async {
    return [..._organisations];
  }

  late Organisation _currentSelectedProposal;

  Organisation get currentSelectedProposal {
    return _currentSelectedProposal;
  }

  set currentSelectedProposal(id) {
    _currentSelectedProposal = _organisations.firstWhere((element) => element.id == id);
  }

  Organisation getOrganisationById(int id) => _organisations.firstWhere((element) => element.id == id);
}

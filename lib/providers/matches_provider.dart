import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';

class MatchesProvider with ChangeNotifier {
  late MatchesApi matchesApi;

  List<UserOrganisationMatchListModel> organisationMatches = [];

  late UserOrganisationMatchListModel selectedOrganisationMatch;

  MatchesProvider() {
    this.matchesApi = MatchesApi();
  }

  MatchesProvider.withDependencies(MatchesApi matchesApi) {
    this.matchesApi = matchesApi;
  }

  Future<void> loadMatches(String userId) async {
    var response = await this.matchesApi.getMatchesList(userId: userId);
    organisationMatches = response.organisationMatches;
    organisationMatches.sort((a, b) => b.score - a.score);
    notifyListeners();
  }

  selectOrganisationMatch(UserOrganisationMatchListModel model) {
    this.selectedOrganisationMatch = model;
  }
}

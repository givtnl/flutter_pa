import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';

class MatchesProvider with ChangeNotifier {
  late MatchesApi matchesApi;

  List<UserOrganisationMatchListModel> organisationMatches = [];

  late UserOrganisationMatchListModel selectedOrganisationMatch = UserOrganisationMatchListModel(
      score: 90,
      organisation: OrganisationDetailModel()
  );

  MatchesProvider() {
    this.matchesApi = MatchesApi();
  }

  MatchesProvider.withDependencies(MatchesApi matchesApi) {
    this.matchesApi = matchesApi;
  }

  Future<void> loadMatches(String userId) async {
    var response = await this.matchesApi.getMatchesList(userId: userId);
    organisationMatches = response.result.toList();
    organisationMatches.sort((a, b) => b.score.toInt() - a.score.toInt());
    notifyListeners();
  }

  selectOrganisationMatch(UserOrganisationMatchListModel model) {
    this.selectedOrganisationMatch = model;
  }
}

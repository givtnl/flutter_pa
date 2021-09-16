import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';

class MatchesProvider with ChangeNotifier {
  late MatchesApi matchesApi;
  late OrganisationMatchesApi _organisationMatchesApi;

  List<UserOrganisationMatchListModel> organisationMatches = [];
  List<UserOrganisationTagMatchListModel> currentMatchingTags = [];

  String nextPageToken = "";

  late UserOrganisationMatchListModel selectedOrganisationMatch = UserOrganisationMatchListModel(
      score: 90,
      organisation: OrganisationDetailModel()
  );

  MatchesProvider() {
    this.matchesApi = MatchesApi();
    _organisationMatchesApi = OrganisationMatchesApi();
  }

  MatchesProvider.withDependencies(MatchesApi matchesApi) {
    this.matchesApi = matchesApi;
  }

  Future<void> loadMatches(String userId) async {
    var response = await this.matchesApi.getMatchesList(userId: userId);
    organisationMatches = response.result;
    nextPageToken = response.nextPageToken;
    organisationMatches.sort((a, b) => b.score.toInt() - a.score.toInt());
    notifyListeners();
  }

  selectOrganisationMatch(UserOrganisationMatchListModel model, String userId) async {
    this.selectedOrganisationMatch = model;
    currentMatchingTags = (await this._organisationMatchesApi.getUserOrganisationTagMatchesList(this.selectedOrganisationMatch.organisation.id, userId: userId)).result;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';

class MatchesProvider with ChangeNotifier {
  late MatchesApi matchesApi;

  List<UserOrganisationMatchListModel> organisationMatches = [];

  late UserOrganisationMatchListModel selectedOrganisationMatch = UserOrganisationMatchListModel(
      score: 90,
      organisation: OrganisationDetailModel(
          id: '1234',
          name: 'Steun mij!',
          description: 'lrem asd fjpaos djfasjd asdlfj laj pohsf pu i hpas d uof ih oiu oiuhiuho oiuho',
          mission: 'io iuhoiuho ih oiuh ou uf oy ouyg ouoguygo yg',
          vision: 'adgpp poihpoihp w a a sedfasdgf asd',
          websiteUrl: 'www.steunerdesteun.be',
          metaTags: {'sectors': 'animals',})
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

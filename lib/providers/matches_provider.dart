import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';

class MatchesProvider with ChangeNotifier {
  late MatchesApi matchesApi;

  List<UserOrganisationMatchListModel> organisations = [];

  MatchesProvider() {
    this.matchesApi = MatchesApi();
  }

  MatchesProvider.withDependencies(MatchesApi matchesApi) {
    this.matchesApi = matchesApi;
  }

  Future<GetMatchesListResponse> loadMatches(String userId) async {
    var response =
        await this.matchesApi.getMatchesList(userId: userId, minimumScore: 80);
    organisations = response.result;
    organisations.sort((a, b) => b.score - a.score);
    return response;
  }
}

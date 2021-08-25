import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';

class MatchesProvider with ChangeNotifier {
  late MatchesApi matchesApi;

  List<UserOrganisationMatchListModel> organisations = [];

  MatchesProvider() {
    this.matchesApi = MatchesApi();
  }

  Future<void> loadMatches(String userId) async {
    return await this.matchesApi.getMatchesList(userId: userId, minimumScore: 80).then((response) {
      organisations = response.result;
      organisations.sort((a, b) => b.score - a.score);
    });
  }
}
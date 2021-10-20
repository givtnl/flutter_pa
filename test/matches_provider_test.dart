import 'package:flutter_app/providers/matches_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:openapi/api.dart';
import 'matches_provider_test.mocks.dart';

@GenerateMocks([MatchesApi])
void main() {
  GetUserOrganisationMatchesListResponse userOrganisationMatchesListResponse = GetUserOrganisationMatchesListResponse(
      result: [
        UserOrganisationMatchListModel(
            score: 70,
            organisation: OrganisationDetailModel(
                id: '1b4ff54c-6d35-4c04-8ceb-2b18bdcd3573',
                name: 'Hartstichting',
            )
        ),
        UserOrganisationMatchListModel(
            score: 80,
            organisation: OrganisationDetailModel(
              id: '31a50347-4c25-45a4-bd68-04dcf964563f',
              name: 'Kinderboerderij Driebergen',
            )
        ),
        UserOrganisationMatchListModel(
            score: 90,
            organisation: OrganisationDetailModel(
              id: '333d864a-8bde-423a-902e-f45f14f9ea49',
              name: 'Brandwonden Stichting',
            )
        ),
      ]
  );


  group('MatchesProvider tests', () {
    final matchesApi = MockMatchesApi();

    when(matchesApi.getMatchesList(minimumScore: null, userId: 'Michiel', nextPageToken: null,limit: null)).thenAnswer((_) =>
        Future.value(userOrganisationMatchesListResponse));

    test('Ensure Matches Are Assigned When Executing Http Call', () async {
      var provider = MatchesProvider.withMockDependencies(matchesApi);
      await provider.loadMatches('Michiel');
      expect(userOrganisationMatchesListResponse.result.length,
          equals(provider.organisationMatches.length));
    });

    test('Ensure Matches Are Sorted On score', () async {
      var provider = MatchesProvider.withMockDependencies(matchesApi);
      await provider.loadMatches('Michiel');
      expect(userOrganisationMatchesListResponse.result[0].score, equals(90));
      expect(userOrganisationMatchesListResponse.result[2].score, equals(70));
    });

  });
}
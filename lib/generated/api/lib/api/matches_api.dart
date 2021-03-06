//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MatchesApi {
  MatchesApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Returns a list of matches
  ///
  /// Returns a list of matches to build a wall for the user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId:
  ///
  /// * [String] nextPageToken:
  ///
  /// * [int] minimumScore:
  ///
  /// * [int] limit:
  Future<Response> getMatchesListWithHttpInfo({ String userId, String nextPageToken, int minimumScore, int limit }) async {
    // Verify required params are set.

    final path = r'/matches';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (userId != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'UserId', userId));
    }
    if (nextPageToken != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'NextPageToken', nextPageToken));
    }
    if (minimumScore != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'MinimumScore', minimumScore));
    }
    if (limit != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'Limit', limit));
    }

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Returns a list of matches
  ///
  /// Returns a list of matches to build a wall for the user
  ///
  /// Parameters:
  ///
  /// * [String] userId:
  ///
  /// * [String] nextPageToken:
  ///
  /// * [int] minimumScore:
  ///
  /// * [int] limit:
  Future<GetUserOrganisationMatchesListResponse> getMatchesList({ String userId, String nextPageToken, int minimumScore, int limit }) async {
    final response = await getMatchesListWithHttpInfo( userId: userId, nextPageToken: nextPageToken, minimumScore: minimumScore, limit: limit );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetUserOrganisationMatchesListResponse',) as GetUserOrganisationMatchesListResponse;
        }
    return Future<GetUserOrganisationMatchesListResponse>.value(null);
  }
}

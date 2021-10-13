//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class OrganisationTagsApi {
  OrganisationTagsApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Retrieves tags from the given organisation
  ///
  /// Retrieves all the tags and the scores for a given organisation
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organisationId (required):
  Future<Response> getOrganisationTagsWithHttpInfo(String organisationId) async {
    // Verify required params are set.
    if (organisationId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: organisationId');
    }

    final path = r'/organisations/{organisationId}/tags'
      .replaceAll('{' + 'organisationId' + '}', organisationId.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Retrieves tags from the given organisation
  ///
  /// Retrieves all the tags and the scores for a given organisation
  ///
  /// Parameters:
  ///
  /// * [String] organisationId (required):
  Future<GetOrganisationTagsResponse> getOrganisationTags(String organisationId) async {
    final response = await getOrganisationTagsWithHttpInfo(organisationId);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetOrganisationTagsResponse',) as GetOrganisationTagsResponse;
        }
    return Future<GetOrganisationTagsResponse>.value(null);
  }
}

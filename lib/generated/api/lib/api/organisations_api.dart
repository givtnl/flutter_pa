//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class OrganisationsApi {
  OrganisationsApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Creates an organisation
  ///
  /// Creates a organisation for the user to donate to
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateOrganisationRequest] createOrganisationRequest (required):
  Future<Response> createOrganisationWithHttpInfo(CreateOrganisationRequest createOrganisationRequest) async {
    // Verify required params are set.
    if (createOrganisationRequest == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: createOrganisationRequest');
    }

    final path = r'/organisations';

    Object postBody = createOrganisationRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Creates an organisation
  ///
  /// Creates a organisation for the user to donate to
  ///
  /// Parameters:
  ///
  /// * [CreateOrganisationRequest] createOrganisationRequest (required):
  Future<CreateOrganisationResponse> createOrganisation(CreateOrganisationRequest createOrganisationRequest) async {
    final response = await createOrganisationWithHttpInfo(createOrganisationRequest);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateOrganisationResponse',) as CreateOrganisationResponse;
        }
    return Future<CreateOrganisationResponse>.value(null);
  }
}

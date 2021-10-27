//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class FeedbackApi {
  FeedbackApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Give feedback
  ///
  /// Registers feedback and the email from a specific user linked to an userid.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///
  /// * [CreateUserFeedbackRequest] createUserFeedbackRequest (required):
  Future<Response> createFeedbackWithHttpInfo(String userId, CreateUserFeedbackRequest createUserFeedbackRequest) async {
    // Verify required params are set.
    if (userId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: userId');
    }
    if (createUserFeedbackRequest == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: createUserFeedbackRequest');
    }

    final path = r'/users/{userId}/feedback'
      .replaceAll('{' + 'userId' + '}', userId.toString());

    Object postBody = createUserFeedbackRequest;

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

  /// Give feedback
  ///
  /// Registers feedback and the email from a specific user linked to an userid.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///
  /// * [CreateUserFeedbackRequest] createUserFeedbackRequest (required):
  Future<void> createFeedback(String userId, CreateUserFeedbackRequest createUserFeedbackRequest) async {
    final response = await createFeedbackWithHttpInfo(userId, createUserFeedbackRequest);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}

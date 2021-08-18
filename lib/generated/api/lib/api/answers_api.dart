//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AnswersApi {
  AnswersApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Answers a question
  ///
  /// Registers an answer for a given question for a particular user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] questionId (required):
  ///
  /// * [CreateAnswerRequest] createAnswerRequest (required):
  Future<Response> createAnswerWithHttpInfo(String questionId, CreateAnswerRequest createAnswerRequest) async {
    // Verify required params are set.
    if (questionId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: questionId');
    }
    if (createAnswerRequest == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: createAnswerRequest');
    }

    final path = r'/questions/{questionId}/answers'
      .replaceAll('{' + 'questionId' + '}', questionId.toString());

    Object postBody = createAnswerRequest;

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

  /// Answers a question
  ///
  /// Registers an answer for a given question for a particular user
  ///
  /// Parameters:
  ///
  /// * [String] questionId (required):
  ///
  /// * [CreateAnswerRequest] createAnswerRequest (required):
  Future<CreateQuestionResponse> createAnswer(String questionId, CreateAnswerRequest createAnswerRequest) async {
    final response = await createAnswerWithHttpInfo(questionId, createAnswerRequest);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateQuestionResponse',) as CreateQuestionResponse;
        }
    return Future<CreateQuestionResponse>.value(null);
  }
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class QuestionsApi {
  QuestionsApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Creates a question
  ///
  /// Creates a question for the user to answer
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateQuestionRequest] createQuestionRequest (required):
  Future<Response> createQuestionWithHttpInfo(CreateQuestionRequest createQuestionRequest) async {
    // Verify required params are set.
    if (createQuestionRequest == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: createQuestionRequest');
    }

    final path = r'/Questions';

    Object postBody = createQuestionRequest;

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

  /// Creates a question
  ///
  /// Creates a question for the user to answer
  ///
  /// Parameters:
  ///
  /// * [CreateQuestionRequest] createQuestionRequest (required):
  Future<CreateQuestionResponse> createQuestion(CreateQuestionRequest createQuestionRequest) async {
    final response = await createQuestionWithHttpInfo(createQuestionRequest);
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

  /// Returns a list of questions
  ///
  /// Returns a list of question to build a profile for the user by answering them
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [object] request:
  Future<Response> getQuestionsListWithHttpInfo({ object request }) async {
    // Verify required params are set.

    final path = r'/Questions';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (request != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'request', request));
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

  /// Returns a list of questions
  ///
  /// Returns a list of question to build a profile for the user by answering them
  ///
  /// Parameters:
  ///
  /// * [object] request:
  Future<GetQuestionsListResponse> getQuestionsList({ object request }) async {
    final response = await getQuestionsListWithHttpInfo( request: request );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetQuestionsListResponse',) as GetQuestionsListResponse;
        }
    return Future<GetQuestionsListResponse>.value(null);
  }
}

# openapi.api.AnswersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://0v9xof580f.execute-api.eu-west-3.amazonaws.com/prod*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createAnswer**](AnswersApi.md#createanswer) | **POST** /questions/{questionId}/answers | Answers a question


# **createAnswer**
> CreateQuestionResponse createAnswer(questionId, createAnswerRequest)

Answers a question

Registers an answer for a given question for a particular user

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AnswersApi();
final questionId = questionId_example; // String | 
final createAnswerRequest = CreateAnswerRequest(); // CreateAnswerRequest | 

try {
    final result = api_instance.createAnswer(questionId, createAnswerRequest);
    print(result);
} catch (e) {
    print('Exception when calling AnswersApi->createAnswer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionId** | **String**|  | 
 **createAnswerRequest** | [**CreateAnswerRequest**](CreateAnswerRequest.md)|  | 

### Return type

[**CreateQuestionResponse**](CreateQuestionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


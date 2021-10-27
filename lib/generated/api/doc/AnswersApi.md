# openapi.api.AnswersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://poxv71al5m.execute-api.eu-west-3.amazonaws.com/prod*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createAnswer**](AnswersApi.md#createanswer) | **POST** /questions/{questionId}/answers | Answers a question


# **createAnswer**
> createAnswer(questionId, createAnswerRequest)

Answers a question

Registers an answer for a given question for a particular user

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AnswersApi();
final questionId = questionId_example; // String | 
final createAnswerRequest = CreateAnswerRequest(); // CreateAnswerRequest | 

try {
    api_instance.createAnswer(questionId, createAnswerRequest);
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

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


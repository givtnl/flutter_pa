# openapi.api.QuestionsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://0v9xof580f.execute-api.eu-west-3.amazonaws.com/prod*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createQuestion**](QuestionsApi.md#createquestion) | **POST** /Questions | Creates a question
[**getQuestionsList**](QuestionsApi.md#getquestionslist) | **GET** /Questions | Returns a list of questions


# **createQuestion**
> CreateQuestionResponse createQuestion(createQuestionRequest)

Creates a question

Creates a question for the user to answer

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = QuestionsApi();
final createQuestionRequest = CreateQuestionRequest(); // CreateQuestionRequest | 

try {
    final result = api_instance.createQuestion(createQuestionRequest);
    print(result);
} catch (e) {
    print('Exception when calling QuestionsApi->createQuestion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createQuestionRequest** | [**CreateQuestionRequest**](CreateQuestionRequest.md)|  | 

### Return type

[**CreateQuestionResponse**](CreateQuestionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getQuestionsList**
> GetQuestionsListResponse getQuestionsList(request)

Returns a list of questions

Returns a list of question to build a profile for the user by answering them

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = QuestionsApi();
final request = ; // OneOfobject | 

try {
    final result = api_instance.getQuestionsList(request);
    print(result);
} catch (e) {
    print('Exception when calling QuestionsApi->getQuestionsList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**OneOfobject**](.md)|  | [optional] 

### Return type

[**GetQuestionsListResponse**](GetQuestionsListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


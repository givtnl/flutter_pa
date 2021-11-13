# openapi.api.FeedbackApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://poxv71al5m.execute-api.eu-west-3.amazonaws.com/prod*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFeedback**](FeedbackApi.md#createfeedback) | **POST** /users/{userId}/feedback | Give feedback


# **createFeedback**
> createFeedback(userId, createUserFeedbackRequest)

Give feedback

Registers feedback and the email from a specific user linked to an userid.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = FeedbackApi();
final userId = userId_example; // String | 
final createUserFeedbackRequest = CreateUserFeedbackRequest(); // CreateUserFeedbackRequest | 

try {
    api_instance.createFeedback(userId, createUserFeedbackRequest);
} catch (e) {
    print('Exception when calling FeedbackApi->createFeedback: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **createUserFeedbackRequest** | [**CreateUserFeedbackRequest**](CreateUserFeedbackRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


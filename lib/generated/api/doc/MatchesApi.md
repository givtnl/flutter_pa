# openapi.api.MatchesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://0v9xof580f.execute-api.eu-west-3.amazonaws.com/prod*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMatchesList**](MatchesApi.md#getmatcheslist) | **GET** /Matches | Returns a list of matches


# **getMatchesList**
> GetMatchesListResponse getMatchesList(userId, minimumScore)

Returns a list of matches

Returns a list of matches to build a wall for the user

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MatchesApi();
final userId = userId_example; // String | 
final minimumScore = 56; // int | 

try {
    final result = api_instance.getMatchesList(userId, minimumScore);
    print(result);
} catch (e) {
    print('Exception when calling MatchesApi->getMatchesList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [optional] 
 **minimumScore** | **int**|  | [optional] 

### Return type

[**GetMatchesListResponse**](GetMatchesListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


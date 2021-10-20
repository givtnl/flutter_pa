# openapi.api.OrganisationMatchesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://poxv71al5m.execute-api.eu-west-3.amazonaws.com/prod*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUserOrganisationTagMatchesList**](OrganisationMatchesApi.md#getuserorganisationtagmatcheslist) | **GET** /organisations/{organisationId}/matches | Returns a list of matches for the combination between an user and an organisation


# **getUserOrganisationTagMatchesList**
> GetUserOrganisationTagMatchesListResponse getUserOrganisationTagMatchesList(organisationId, userId)

Returns a list of matches for the combination between an user and an organisation

Returns a list of calculated matches between the profile of the user and the profile of the organisation

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = OrganisationMatchesApi();
final organisationId = organisationId_example; // String | 
final userId = userId_example; // String | 

try {
    final result = api_instance.getUserOrganisationTagMatchesList(organisationId, userId);
    print(result);
} catch (e) {
    print('Exception when calling OrganisationMatchesApi->getUserOrganisationTagMatchesList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organisationId** | **String**|  | 
 **userId** | **String**|  | [optional] 

### Return type

[**GetUserOrganisationTagMatchesListResponse**](GetUserOrganisationTagMatchesListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# openapi.api.OrganisationTagsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://0v9xof580f.execute-api.eu-west-3.amazonaws.com/prod*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getOrganisationTags**](OrganisationTagsApi.md#getorganisationtags) | **GET** /organisations/{organisationId}/tags | Retrieves tags from the given organisation


# **getOrganisationTags**
> GetOrganisationTagsResponse getOrganisationTags(organisationId)

Retrieves tags from the given organisation

Retrieves all the tags and the scores for a given organisation

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = OrganisationTagsApi();
final organisationId = organisationId_example; // String | 

try {
    final result = api_instance.getOrganisationTags(organisationId);
    print(result);
} catch (e) {
    print('Exception when calling OrganisationTagsApi->getOrganisationTags: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organisationId** | **String**|  | 

### Return type

[**GetOrganisationTagsResponse**](GetOrganisationTagsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


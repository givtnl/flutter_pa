# openapi.api.OrganisationsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://0v9xof580f.execute-api.eu-west-3.amazonaws.com/prod*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrganisation**](OrganisationsApi.md#createorganisation) | **POST** /organisations | Creates an organisation


# **createOrganisation**
> CreateOrganisationResponse createOrganisation(createOrganisationRequest)

Creates an organisation

Creates a organisation for the user to donate to

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = OrganisationsApi();
final createOrganisationRequest = CreateOrganisationRequest(); // CreateOrganisationRequest | 

try {
    final result = api_instance.createOrganisation(createOrganisationRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganisationsApi->createOrganisation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createOrganisationRequest** | [**CreateOrganisationRequest**](CreateOrganisationRequest.md)|  | 

### Return type

[**CreateOrganisationResponse**](CreateOrganisationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


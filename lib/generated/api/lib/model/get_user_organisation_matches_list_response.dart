//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetUserOrganisationMatchesListResponse {
  /// Returns a new [GetUserOrganisationMatchesListResponse] instance.
  GetUserOrganisationMatchesListResponse({
    this.nextPageToken,
    this.result,
  });

  String nextPageToken;

  List<UserOrganisationMatchListModel> result;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetUserOrganisationMatchesListResponse &&
     other.nextPageToken == nextPageToken &&
     other.result == result;

  @override
  int get hashCode =>
    (nextPageToken == null ? 0 : nextPageToken.hashCode) +
    (result == null ? 0 : result.hashCode);

  @override
  String toString() => 'GetUserOrganisationMatchesListResponse[nextPageToken=$nextPageToken, result=$result]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (nextPageToken != null) {
      json[r'nextPageToken'] = nextPageToken;
    }
    if (result != null) {
      json[r'result'] = result;
    }
    return json;
  }

  /// Returns a new [GetUserOrganisationMatchesListResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GetUserOrganisationMatchesListResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GetUserOrganisationMatchesListResponse(
        nextPageToken: json[r'nextPageToken'],
        result: UserOrganisationMatchListModel.listFromJson(json[r'result']),
    );

  static List<GetUserOrganisationMatchesListResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GetUserOrganisationMatchesListResponse>[]
      : json.map((dynamic value) => GetUserOrganisationMatchesListResponse.fromJson(value)).toList(growable: true == growable);

  static Map<String, GetUserOrganisationMatchesListResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GetUserOrganisationMatchesListResponse>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = GetUserOrganisationMatchesListResponse.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of GetUserOrganisationMatchesListResponse-objects as value to a dart map
  static Map<String, List<GetUserOrganisationMatchesListResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GetUserOrganisationMatchesListResponse>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = GetUserOrganisationMatchesListResponse.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


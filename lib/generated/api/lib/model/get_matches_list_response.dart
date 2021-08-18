//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetMatchesListResponse {
  /// Returns a new [GetMatchesListResponse] instance.
  GetMatchesListResponse({
    this.result,
  });

  List<UserOrganisationMatchListModel> result;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetMatchesListResponse &&
     other.result == result;

  @override
  int get hashCode =>
    (result == null ? 0 : result.hashCode);

  @override
  String toString() => 'GetMatchesListResponse[result=$result]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (result != null) {
      json[r'result'] = result;
    }
    return json;
  }

  /// Returns a new [GetMatchesListResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GetMatchesListResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GetMatchesListResponse(
        result: UserOrganisationMatchListModel.listFromJson(json[r'result']),
    );

  static List<GetMatchesListResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GetMatchesListResponse>[]
      : json.map((dynamic value) => GetMatchesListResponse.fromJson(value)).toList(growable: true == growable);

  static Map<String, GetMatchesListResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GetMatchesListResponse>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = GetMatchesListResponse.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of GetMatchesListResponse-objects as value to a dart map
  static Map<String, List<GetMatchesListResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GetMatchesListResponse>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = GetMatchesListResponse.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


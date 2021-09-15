//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetUserOrganisationTagMatchesListResponse {
  /// Returns a new [GetUserOrganisationTagMatchesListResponse] instance.
  GetUserOrganisationTagMatchesListResponse({
    this.result,
  });

  List<UserOrganisationTagMatchListModel> result;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetUserOrganisationTagMatchesListResponse &&
     other.result == result;

  @override
  int get hashCode =>
    (result == null ? 0 : result.hashCode);

  @override
  String toString() => 'GetUserOrganisationTagMatchesListResponse[result=$result]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (result != null) {
      json[r'result'] = result;
    }
    return json;
  }

  /// Returns a new [GetUserOrganisationTagMatchesListResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GetUserOrganisationTagMatchesListResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GetUserOrganisationTagMatchesListResponse(
        result: UserOrganisationTagMatchListModel.listFromJson(json[r'result']),
    );

  static List<GetUserOrganisationTagMatchesListResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GetUserOrganisationTagMatchesListResponse>[]
      : json.map((dynamic value) => GetUserOrganisationTagMatchesListResponse.fromJson(value)).toList(growable: true == growable);

  static Map<String, GetUserOrganisationTagMatchesListResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GetUserOrganisationTagMatchesListResponse>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = GetUserOrganisationTagMatchesListResponse.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of GetUserOrganisationTagMatchesListResponse-objects as value to a dart map
  static Map<String, List<GetUserOrganisationTagMatchesListResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GetUserOrganisationTagMatchesListResponse>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = GetUserOrganisationTagMatchesListResponse.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


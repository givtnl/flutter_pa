//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetOrganisationTagsResponse {
  /// Returns a new [GetOrganisationTagsResponse] instance.
  GetOrganisationTagsResponse({
    this.results,
  });

  List<OrganisationTagMatchListModel> results;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetOrganisationTagsResponse &&
     other.results == results;

  @override
  int get hashCode =>
    (results == null ? 0 : results.hashCode);

  @override
  String toString() => 'GetOrganisationTagsResponse[results=$results]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (results != null) {
      json[r'results'] = results;
    }
    return json;
  }

  /// Returns a new [GetOrganisationTagsResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GetOrganisationTagsResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GetOrganisationTagsResponse(
        results: OrganisationTagMatchListModel.listFromJson(json[r'results']),
    );

  static List<GetOrganisationTagsResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GetOrganisationTagsResponse>[]
      : json.map((dynamic value) => GetOrganisationTagsResponse.fromJson(value)).toList(growable: true == growable);

  static Map<String, GetOrganisationTagsResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GetOrganisationTagsResponse>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = GetOrganisationTagsResponse.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of GetOrganisationTagsResponse-objects as value to a dart map
  static Map<String, List<GetOrganisationTagsResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GetOrganisationTagsResponse>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = GetOrganisationTagsResponse.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


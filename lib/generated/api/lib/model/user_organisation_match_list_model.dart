//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserOrganisationMatchListModel {
  /// Returns a new [UserOrganisationMatchListModel] instance.
  UserOrganisationMatchListModel({
    this.tag,
    this.organisation,
    this.score,
  });

  String tag;

  OrganisationDetailModel organisation;

  int score;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserOrganisationMatchListModel &&
     other.tag == tag &&
     other.organisation == organisation &&
     other.score == score;

  @override
  int get hashCode =>
    (tag == null ? 0 : tag.hashCode) +
    (organisation == null ? 0 : organisation.hashCode) +
    (score == null ? 0 : score.hashCode);

  @override
  String toString() => 'UserOrganisationMatchListModel[tag=$tag, organisation=$organisation, score=$score]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (tag != null) {
      json[r'tag'] = tag;
    }
    if (organisation != null) {
      json[r'organisation'] = organisation;
    }
    if (score != null) {
      json[r'score'] = score;
    }
    return json;
  }

  /// Returns a new [UserOrganisationMatchListModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static UserOrganisationMatchListModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : UserOrganisationMatchListModel(
        tag: json[r'tag'],
        organisation: OrganisationDetailModel.fromJson(json[r'organisation']),
        score: json[r'score'],
    );

  static List<UserOrganisationMatchListModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <UserOrganisationMatchListModel>[]
      : json.map((dynamic value) => UserOrganisationMatchListModel.fromJson(value)).toList(growable: true == growable);

  static Map<String, UserOrganisationMatchListModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, UserOrganisationMatchListModel>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = UserOrganisationMatchListModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UserOrganisationMatchListModel-objects as value to a dart map
  static Map<String, List<UserOrganisationMatchListModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<UserOrganisationMatchListModel>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = UserOrganisationMatchListModel.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


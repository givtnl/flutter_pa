//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserOrganisationTagMatchListModel {
  /// Returns a new [UserOrganisationTagMatchListModel] instance.
  UserOrganisationTagMatchListModel({
    this.organisationId,
    this.tag,
    this.score,
  });

  String organisationId;

  String tag;

  num score;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserOrganisationTagMatchListModel &&
     other.organisationId == organisationId &&
     other.tag == tag &&
     other.score == score;

  @override
  int get hashCode =>
    (organisationId == null ? 0 : organisationId.hashCode) +
    (tag == null ? 0 : tag.hashCode) +
    (score == null ? 0 : score.hashCode);

  @override
  String toString() => 'UserOrganisationTagMatchListModel[organisationId=$organisationId, tag=$tag, score=$score]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (organisationId != null) {
      json[r'organisationId'] = organisationId;
    }
    if (tag != null) {
      json[r'tag'] = tag;
    }
    if (score != null) {
      json[r'score'] = score;
    }
    return json;
  }

  /// Returns a new [UserOrganisationTagMatchListModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static UserOrganisationTagMatchListModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : UserOrganisationTagMatchListModel(
        organisationId: json[r'organisationId'],
        tag: json[r'tag'],
        score: json[r'score'] == null ?
          null :
          json[r'score'].toDouble(),
    );

  static List<UserOrganisationTagMatchListModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <UserOrganisationTagMatchListModel>[]
      : json.map((dynamic value) => UserOrganisationTagMatchListModel.fromJson(value)).toList(growable: true == growable);

  static Map<String, UserOrganisationTagMatchListModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, UserOrganisationTagMatchListModel>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = UserOrganisationTagMatchListModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UserOrganisationTagMatchListModel-objects as value to a dart map
  static Map<String, List<UserOrganisationTagMatchListModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<UserOrganisationTagMatchListModel>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = UserOrganisationTagMatchListModel.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


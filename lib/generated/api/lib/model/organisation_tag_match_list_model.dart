//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganisationTagMatchListModel {
  /// Returns a new [OrganisationTagMatchListModel] instance.
  OrganisationTagMatchListModel({
    this.organisationId,
    this.tag,
    this.score,
    this.organisation,
  });

  String organisationId;

  String tag;

  int score;

  OrganisationDetailModel organisation;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrganisationTagMatchListModel &&
     other.organisationId == organisationId &&
     other.tag == tag &&
     other.score == score &&
     other.organisation == organisation;

  @override
  int get hashCode =>
    (organisationId == null ? 0 : organisationId.hashCode) +
    (tag == null ? 0 : tag.hashCode) +
    (score == null ? 0 : score.hashCode) +
    (organisation == null ? 0 : organisation.hashCode);

  @override
  String toString() => 'OrganisationTagMatchListModel[organisationId=$organisationId, tag=$tag, score=$score, organisation=$organisation]';

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
    if (organisation != null) {
      json[r'organisation'] = organisation;
    }
    return json;
  }

  /// Returns a new [OrganisationTagMatchListModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static OrganisationTagMatchListModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : OrganisationTagMatchListModel(
        organisationId: json[r'organisationId'],
        tag: json[r'tag'],
        score: json[r'score'],
        organisation: OrganisationDetailModel.fromJson(json[r'organisation']),
    );

  static List<OrganisationTagMatchListModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <OrganisationTagMatchListModel>[]
      : json.map((dynamic value) => OrganisationTagMatchListModel.fromJson(value)).toList(growable: true == growable);

  static Map<String, OrganisationTagMatchListModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, OrganisationTagMatchListModel>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = OrganisationTagMatchListModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of OrganisationTagMatchListModel-objects as value to a dart map
  static Map<String, List<OrganisationTagMatchListModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<OrganisationTagMatchListModel>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = OrganisationTagMatchListModel.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


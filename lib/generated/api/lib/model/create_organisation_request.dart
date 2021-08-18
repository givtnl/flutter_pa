//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateOrganisationRequest {
  /// Returns a new [CreateOrganisationRequest] instance.
  CreateOrganisationRequest({
    this.name,
    this.description,
    this.websiteUrl,
    this.imageUrl,
    this.mission,
    this.vision,
    this.metaTags,
    this.tagScores = const {},
  });

  String name;

  String description;

  String websiteUrl;

  String imageUrl;

  String mission;

  String vision;

  Map<String, String> metaTags;

  Map<String, int> tagScores;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateOrganisationRequest &&
     other.name == name &&
     other.description == description &&
     other.websiteUrl == websiteUrl &&
     other.imageUrl == imageUrl &&
     other.mission == mission &&
     other.vision == vision &&
     other.metaTags == metaTags &&
     other.tagScores == tagScores;

  @override
  int get hashCode =>
    (name == null ? 0 : name.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (websiteUrl == null ? 0 : websiteUrl.hashCode) +
    (imageUrl == null ? 0 : imageUrl.hashCode) +
    (mission == null ? 0 : mission.hashCode) +
    (vision == null ? 0 : vision.hashCode) +
    (metaTags == null ? 0 : metaTags.hashCode) +
    (tagScores == null ? 0 : tagScores.hashCode);

  @override
  String toString() => 'CreateOrganisationRequest[name=$name, description=$description, websiteUrl=$websiteUrl, imageUrl=$imageUrl, mission=$mission, vision=$vision, metaTags=$metaTags, tagScores=$tagScores]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (name != null) {
      json[r'name'] = name;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (websiteUrl != null) {
      json[r'websiteUrl'] = websiteUrl;
    }
    if (imageUrl != null) {
      json[r'imageUrl'] = imageUrl;
    }
    if (mission != null) {
      json[r'mission'] = mission;
    }
    if (vision != null) {
      json[r'vision'] = vision;
    }
    if (metaTags != null) {
      json[r'metaTags'] = metaTags;
    }
    if (tagScores != null) {
      json[r'tagScores'] = tagScores;
    }
    return json;
  }

  /// Returns a new [CreateOrganisationRequest] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static CreateOrganisationRequest fromJson(Map<String, dynamic> json) => json == null
    ? null
    : CreateOrganisationRequest(
        name: json[r'name'],
        description: json[r'description'],
        websiteUrl: json[r'websiteUrl'],
        imageUrl: json[r'imageUrl'],
        mission: json[r'mission'],
        vision: json[r'vision'],
        metaTags: json[r'metaTags'] == null ?
          null :
          (json[r'metaTags'] as Map).cast<String, String>(),
        tagScores: json[r'tagScores'] == null ?
          null :
          (json[r'tagScores'] as Map).cast<String, int>(),
    );

  static List<CreateOrganisationRequest> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateOrganisationRequest>[]
      : json.map((dynamic value) => CreateOrganisationRequest.fromJson(value)).toList(growable: true == growable);

  static Map<String, CreateOrganisationRequest> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateOrganisationRequest>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = CreateOrganisationRequest.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CreateOrganisationRequest-objects as value to a dart map
  static Map<String, List<CreateOrganisationRequest>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateOrganisationRequest>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = CreateOrganisationRequest.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class String {
  /// Returns a new [String] instance.
  String({
    this.id,
    this.name,
    this.description,
    this.websiteUrl,
    this.imageUrl,
    this.mission,
    this.vision,
    this.metaTags,
  });

  String id;

  String name;

  String description;

  String websiteUrl;

  String imageUrl;

  String mission;

  String vision;

  Map<String, String> metaTags;

  @override
  bool operator ==(Object other) => identical(this, other) || other is String &&
     other.id == id &&
     other.name == name &&
     other.description == description &&
     other.websiteUrl == websiteUrl &&
     other.imageUrl == imageUrl &&
     other.mission == mission &&
     other.vision == vision &&
     other.metaTags == metaTags;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (websiteUrl == null ? 0 : websiteUrl.hashCode) +
    (imageUrl == null ? 0 : imageUrl.hashCode) +
    (mission == null ? 0 : mission.hashCode) +
    (vision == null ? 0 : vision.hashCode) +
    (metaTags == null ? 0 : metaTags.hashCode);

  @override
  String toString() => 'OrganisationDetailModel[id=$id, name=$name, description=$description, websiteUrl=$websiteUrl, imageUrl=$imageUrl, mission=$mission, vision=$vision, metaTags=$metaTags]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
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
    return json;
  }

  /// Returns a new [String] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static String fromJson(Map<String, dynamic> json) => json == null
    ? null
    : String(
        id: json[r'id'],
        name: json[r'name'],
        description: json[r'description'],
        websiteUrl: json[r'websiteUrl'],
        imageUrl: json[r'imageUrl'],
        mission: json[r'mission'],
        vision: json[r'vision'],
        metaTags: json[r'metaTags'] == null ?
          null :
          (json[r'metaTags'] as Map).cast<String, String>(),
    );

  static List<String> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <String>[]
      : json.map((dynamic value) => String.fromJson(value)).toList(growable: true == growable);

  static Map<String, String> mapFromJson(Map<String, dynamic> json) {
    final map = <String, String>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = String.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of OrganisationDetailModel-objects as value to a dart map
  static Map<String, List<String>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<String>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = String.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


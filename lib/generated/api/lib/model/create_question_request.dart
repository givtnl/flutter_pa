//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateQuestionRequest {
  /// Returns a new [CreateQuestionRequest] instance.
  CreateQuestionRequest({
    this.displayOrder,
    this.type,
    this.translations = const {},
    this.tagScores = const {},
  });

  int displayOrder;

  QuestionType type;

  Map<String, String> translations;

  Map<String, int> tagScores;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateQuestionRequest &&
     other.displayOrder == displayOrder &&
     other.type == type &&
     other.translations == translations &&
     other.tagScores == tagScores;

  @override
  int get hashCode =>
    (displayOrder == null ? 0 : displayOrder.hashCode) +
    (type == null ? 0 : type.hashCode) +
    (translations == null ? 0 : translations.hashCode) +
    (tagScores == null ? 0 : tagScores.hashCode);

  @override
  String toString() => 'CreateQuestionRequest[displayOrder=$displayOrder, type=$type, translations=$translations, tagScores=$tagScores]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (displayOrder != null) {
      json[r'displayOrder'] = displayOrder;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    if (translations != null) {
      json[r'translations'] = translations;
    }
    if (tagScores != null) {
      json[r'tagScores'] = tagScores;
    }
    return json;
  }

  /// Returns a new [CreateQuestionRequest] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static CreateQuestionRequest fromJson(Map<String, dynamic> json) => json == null
    ? null
    : CreateQuestionRequest(
        displayOrder: json[r'displayOrder'],
        type: QuestionType.fromJson(json[r'type']),
        translations: json[r'translations'] == null ?
          null :
          (json[r'translations'] as Map).cast<String, String>(),
        tagScores: json[r'tagScores'] == null ?
          null :
          (json[r'tagScores'] as Map).cast<String, int>(),
    );

  static List<CreateQuestionRequest> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateQuestionRequest>[]
      : json.map((dynamic value) => CreateQuestionRequest.fromJson(value)).toList(growable: true == growable);

  static Map<String, CreateQuestionRequest> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateQuestionRequest>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = CreateQuestionRequest.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CreateQuestionRequest-objects as value to a dart map
  static Map<String, List<CreateQuestionRequest>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateQuestionRequest>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = CreateQuestionRequest.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


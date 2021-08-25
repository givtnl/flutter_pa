//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class QuestionCategoryOptionModel {
  /// Returns a new [QuestionCategoryOptionModel] instance.
  QuestionCategoryOptionModel({
    this.displayOrder,
    this.translations,
    this.tagScores,
  });

  int displayOrder;

  Map<String, String> translations;

  Map<String, int> tagScores;

  @override
  bool operator ==(Object other) => identical(this, other) || other is QuestionCategoryOptionModel &&
     other.displayOrder == displayOrder &&
     other.translations == translations &&
     other.tagScores == tagScores;

  @override
  int get hashCode =>
    (displayOrder == null ? 0 : displayOrder.hashCode) +
    (translations == null ? 0 : translations.hashCode) +
    (tagScores == null ? 0 : tagScores.hashCode);

  @override
  String toString() => 'QuestionCategoryOptionModel[displayOrder=$displayOrder, translations=$translations, tagScores=$tagScores]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (displayOrder != null) {
      json[r'displayOrder'] = displayOrder;
    }
    if (translations != null) {
      json[r'translations'] = translations;
    }
    if (tagScores != null) {
      json[r'tagScores'] = tagScores;
    }
    return json;
  }

  /// Returns a new [QuestionCategoryOptionModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static QuestionCategoryOptionModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : QuestionCategoryOptionModel(
        displayOrder: json[r'displayOrder'],
        translations: json[r'translations'] == null ?
          null :
          (json[r'translations'] as Map).cast<String, String>(),
        tagScores: json[r'tagScores'] == null ?
          null :
          (json[r'tagScores'] as Map).cast<String, int>(),
    );

  static List<QuestionCategoryOptionModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <QuestionCategoryOptionModel>[]
      : json.map((dynamic value) => QuestionCategoryOptionModel.fromJson(value)).toList(growable: true == growable);

  static Map<String, QuestionCategoryOptionModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, QuestionCategoryOptionModel>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = QuestionCategoryOptionModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of QuestionCategoryOptionModel-objects as value to a dart map
  static Map<String, List<QuestionCategoryOptionModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<QuestionCategoryOptionModel>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = QuestionCategoryOptionModel.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


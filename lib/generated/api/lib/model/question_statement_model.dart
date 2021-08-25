//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class QuestionStatementModel {
  /// Returns a new [QuestionStatementModel] instance.
  QuestionStatementModel({
    this.tagScores,
  });

  Map<String, int> tagScores;

  @override
  bool operator ==(Object other) => identical(this, other) || other is QuestionStatementModel &&
     other.tagScores == tagScores;

  @override
  int get hashCode =>
    (tagScores == null ? 0 : tagScores.hashCode);

  @override
  String toString() => 'QuestionStatementModel[tagScores=$tagScores]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (tagScores != null) {
      json[r'tagScores'] = tagScores;
    }
    return json;
  }

  /// Returns a new [QuestionStatementModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static QuestionStatementModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : QuestionStatementModel(
        tagScores: json[r'tagScores'] == null ?
          null :
          (json[r'tagScores'] as Map).cast<String, int>(),
    );

  static List<QuestionStatementModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <QuestionStatementModel>[]
      : json.map((dynamic value) => QuestionStatementModel.fromJson(value)).toList(growable: true == growable);

  static Map<String, QuestionStatementModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, QuestionStatementModel>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = QuestionStatementModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of QuestionStatementModel-objects as value to a dart map
  static Map<String, List<QuestionStatementModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<QuestionStatementModel>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = QuestionStatementModel.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


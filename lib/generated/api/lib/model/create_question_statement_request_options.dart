//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateQuestionStatementRequestOptions {
  /// Returns a new [CreateQuestionStatementRequestOptions] instance.
  CreateQuestionStatementRequestOptions({
    this.tagScores,
  });

  Map<String, int> tagScores;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateQuestionStatementRequestOptions &&
     other.tagScores == tagScores;

  @override
  int get hashCode =>
    (tagScores == null ? 0 : tagScores.hashCode);

  @override
  String toString() => 'CreateQuestionStatementRequestOptions[tagScores=$tagScores]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (tagScores != null) {
      json[r'tagScores'] = tagScores;
    }
    return json;
  }

  /// Returns a new [CreateQuestionStatementRequestOptions] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static CreateQuestionStatementRequestOptions fromJson(Map<String, dynamic> json) => json == null
    ? null
    : CreateQuestionStatementRequestOptions(
        tagScores: json[r'tagScores'] == null ?
          null :
          (json[r'tagScores'] as Map).cast<String, int>(),
    );

  static List<CreateQuestionStatementRequestOptions> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateQuestionStatementRequestOptions>[]
      : json.map((dynamic value) => CreateQuestionStatementRequestOptions.fromJson(value)).toList(growable: true == growable);

  static Map<String, CreateQuestionStatementRequestOptions> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateQuestionStatementRequestOptions>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = CreateQuestionStatementRequestOptions.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CreateQuestionStatementRequestOptions-objects as value to a dart map
  static Map<String, List<CreateQuestionStatementRequestOptions>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateQuestionStatementRequestOptions>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = CreateQuestionStatementRequestOptions.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


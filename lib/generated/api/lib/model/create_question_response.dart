//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateQuestionResponse {
  /// Returns a new [CreateQuestionResponse] instance.
  CreateQuestionResponse({
    this.id,
  });

  String id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateQuestionResponse &&
     other.id == id;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode);

  @override
  String toString() => 'CreateQuestionResponse[id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    return json;
  }

  /// Returns a new [CreateQuestionResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static CreateQuestionResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : CreateQuestionResponse(
        id: json[r'id'],
    );

  static List<CreateQuestionResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateQuestionResponse>[]
      : json.map((dynamic value) => CreateQuestionResponse.fromJson(value)).toList(growable: true == growable);

  static Map<String, CreateQuestionResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateQuestionResponse>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = CreateQuestionResponse.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CreateQuestionResponse-objects as value to a dart map
  static Map<String, List<CreateQuestionResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateQuestionResponse>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = CreateQuestionResponse.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


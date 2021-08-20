//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateAnswerDetailRequest {
  /// Returns a new [CreateAnswerDetailRequest] instance.
  CreateAnswerDetailRequest({
    this.tag,
    this.score,
  });

  String tag;

  num score;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateAnswerDetailRequest &&
     other.tag == tag &&
     other.score == score;

  @override
  int get hashCode =>
    (tag == null ? 0 : tag.hashCode) +
    (score == null ? 0 : score.hashCode);

  @override
  String toString() => 'CreateAnswerDetailRequest[tag=$tag, score=$score]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (tag != null) {
      json[r'tag'] = tag;
    }
    if (score != null) {
      json[r'score'] = score;
    }
    return json;
  }

  /// Returns a new [CreateAnswerDetailRequest] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static CreateAnswerDetailRequest fromJson(Map<String, dynamic> json) => json == null
    ? null
    : CreateAnswerDetailRequest(
        tag: json[r'tag'],
        score: json[r'score'] == null ?
          null :
          json[r'score'].toDouble(),
    );

  static List<CreateAnswerDetailRequest> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateAnswerDetailRequest>[]
      : json.map((dynamic value) => CreateAnswerDetailRequest.fromJson(value)).toList(growable: true == growable);

  static Map<String, CreateAnswerDetailRequest> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateAnswerDetailRequest>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = CreateAnswerDetailRequest.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CreateAnswerDetailRequest-objects as value to a dart map
  static Map<String, List<CreateAnswerDetailRequest>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateAnswerDetailRequest>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = CreateAnswerDetailRequest.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


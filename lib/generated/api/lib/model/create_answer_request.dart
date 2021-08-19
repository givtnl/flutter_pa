//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateAnswerRequest {
  /// Returns a new [CreateAnswerRequest] instance.
  CreateAnswerRequest({
    this.userId,
    this.questionId,
    this.answer,
  });

  String userId;

  String questionId;

  String answer;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateAnswerRequest &&
     other.userId == userId &&
     other.questionId == questionId &&
     other.answer == answer;

  @override
  int get hashCode =>
    (userId == null ? 0 : userId.hashCode) +
    (questionId == null ? 0 : questionId.hashCode) +
    (answer == null ? 0 : answer.hashCode);

  @override
  String toString() => 'CreateAnswerRequest[userId=$userId, questionId=$questionId, answer=$answer]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (userId != null) {
      json[r'userId'] = userId;
    }
    if (questionId != null) {
      json[r'questionId'] = questionId;
    }
    if (answer != null) {
      json[r'answer'] = answer;
    }
    return json;
  }

  /// Returns a new [CreateAnswerRequest] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static CreateAnswerRequest fromJson(Map<String, dynamic> json) => json == null
    ? null
    : CreateAnswerRequest(
        userId: json[r'userId'],
        questionId: json[r'questionId'],
        answer: json[r'answer'],
    );

  static List<CreateAnswerRequest> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateAnswerRequest>[]
      : json.map((dynamic value) => CreateAnswerRequest.fromJson(value)).toList(growable: true == growable);

  static Map<String, CreateAnswerRequest> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateAnswerRequest>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = CreateAnswerRequest.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CreateAnswerRequest-objects as value to a dart map
  static Map<String, List<CreateAnswerRequest>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateAnswerRequest>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = CreateAnswerRequest.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


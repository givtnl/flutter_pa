//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateUserFeedbackRequest {
  /// Returns a new [CreateUserFeedbackRequest] instance.
  CreateUserFeedbackRequest({
    this.userId,
    this.email,
    this.userFeedback,
  });

  String userId;

  String email;

  UserFeedback userFeedback;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateUserFeedbackRequest &&
     other.userId == userId &&
     other.email == email &&
     other.userFeedback == userFeedback;

  @override
  int get hashCode =>
    (userId == null ? 0 : userId.hashCode) +
    (email == null ? 0 : email.hashCode) +
    (userFeedback == null ? 0 : userFeedback.hashCode);

  @override
  String toString() => 'CreateUserFeedbackRequest[userId=$userId, email=$email, userFeedback=$userFeedback]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (userId != null) {
      json[r'userId'] = userId;
    }
    if (email != null) {
      json[r'email'] = email;
    }
    if (userFeedback != null) {
      json[r'userFeedback'] = userFeedback;
    }
    return json;
  }

  /// Returns a new [CreateUserFeedbackRequest] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static CreateUserFeedbackRequest fromJson(Map<String, dynamic> json) => json == null
    ? null
    : CreateUserFeedbackRequest(
        userId: json[r'userId'],
        email: json[r'email'],
        userFeedback: UserFeedback.fromJson(json[r'userFeedback']),
    );

  static List<CreateUserFeedbackRequest> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateUserFeedbackRequest>[]
      : json.map((dynamic value) => CreateUserFeedbackRequest.fromJson(value)).toList(growable: true == growable);

  static Map<String, CreateUserFeedbackRequest> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateUserFeedbackRequest>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = CreateUserFeedbackRequest.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CreateUserFeedbackRequest-objects as value to a dart map
  static Map<String, List<CreateUserFeedbackRequest>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateUserFeedbackRequest>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = CreateUserFeedbackRequest.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


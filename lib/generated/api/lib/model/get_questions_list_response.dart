//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetQuestionsListResponse {
  /// Returns a new [GetQuestionsListResponse] instance.
  GetQuestionsListResponse({
    this.result = const [],
  });

  List<QuestionListModel> result;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetQuestionsListResponse &&
     other.result == result;

  @override
  int get hashCode =>
    (result == null ? 0 : result.hashCode);

  @override
  String toString() => 'GetQuestionsListResponse[result=$result]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (result != null) {
      json[r'result'] = result;
    }
    return json;
  }

  /// Returns a new [GetQuestionsListResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GetQuestionsListResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GetQuestionsListResponse(
        result: QuestionListModel.listFromJson(json[r'result']),
    );

  static List<GetQuestionsListResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GetQuestionsListResponse>[]
      : json.map((dynamic value) => GetQuestionsListResponse.fromJson(value)).toList(growable: true == growable);

  static Map<String, GetQuestionsListResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GetQuestionsListResponse>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = GetQuestionsListResponse.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of GetQuestionsListResponse-objects as value to a dart map
  static Map<String, List<GetQuestionsListResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GetQuestionsListResponse>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = GetQuestionsListResponse.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


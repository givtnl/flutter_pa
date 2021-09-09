//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserTagMatchListModel {
  /// Returns a new [UserTagMatchListModel] instance.
  UserTagMatchListModel({
    this.user,
    this.tag,
    this.maximumScore,
    this.currentScore,
    this.percentage,
  });

  String user;

  String tag;

  int maximumScore;

  int currentScore;

  num percentage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserTagMatchListModel &&
     other.user == user &&
     other.tag == tag &&
     other.maximumScore == maximumScore &&
     other.currentScore == currentScore &&
     other.percentage == percentage;

  @override
  int get hashCode =>
    (user == null ? 0 : user.hashCode) +
    (tag == null ? 0 : tag.hashCode) +
    (maximumScore == null ? 0 : maximumScore.hashCode) +
    (currentScore == null ? 0 : currentScore.hashCode) +
    (percentage == null ? 0 : percentage.hashCode);

  @override
  String toString() => 'UserTagMatchListModel[user=$user, tag=$tag, maximumScore=$maximumScore, currentScore=$currentScore, percentage=$percentage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (user != null) {
      json[r'user'] = user;
    }
    if (tag != null) {
      json[r'tag'] = tag;
    }
    if (maximumScore != null) {
      json[r'maximumScore'] = maximumScore;
    }
    if (currentScore != null) {
      json[r'currentScore'] = currentScore;
    }
    if (percentage != null) {
      json[r'percentage'] = percentage;
    }
    return json;
  }

  /// Returns a new [UserTagMatchListModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static UserTagMatchListModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : UserTagMatchListModel(
        user: json[r'user'],
        tag: json[r'tag'],
        maximumScore: json[r'maximumScore'],
        currentScore: json[r'currentScore'],
        percentage: json[r'percentage'] == null ?
          null :
          json[r'percentage'].toDouble(),
    );

  static List<UserTagMatchListModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <UserTagMatchListModel>[]
      : json.map((dynamic value) => UserTagMatchListModel.fromJson(value)).toList(growable: true == growable);

  static Map<String, UserTagMatchListModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, UserTagMatchListModel>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = UserTagMatchListModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UserTagMatchListModel-objects as value to a dart map
  static Map<String, List<UserTagMatchListModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<UserTagMatchListModel>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = UserTagMatchListModel.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}


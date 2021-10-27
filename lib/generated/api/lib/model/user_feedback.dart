//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// 0 = VerySad 1 = Sad 2 = Neutral 3 = Happy 4 = VeryHappy
class UserFeedback {
  /// Instantiate a new enum with the provided [value].
  const UserFeedback._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = UserFeedback._(0);
  static const number1 = UserFeedback._(1);
  static const number2 = UserFeedback._(2);
  static const number3 = UserFeedback._(3);
  static const number4 = UserFeedback._(4);

  /// List of all possible values in this [enum][UserFeedback].
  static const values = <UserFeedback>[
    number0,
    number1,
    number2,
    number3,
    number4,
  ];

  static UserFeedback fromJson(dynamic value) =>
    UserFeedbackTypeTransformer().decode(value);

  static List<UserFeedback> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <UserFeedback>[]
      : json
          .map((value) => UserFeedback.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [UserFeedback] to int,
/// and [decode] dynamic data back to [UserFeedback].
class UserFeedbackTypeTransformer {
  const UserFeedbackTypeTransformer._();

  factory UserFeedbackTypeTransformer() => _instance ??= UserFeedbackTypeTransformer._();

  int encode(UserFeedback data) => data.value;

  /// Decodes a [dynamic value][data] to a UserFeedback.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserFeedback decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return UserFeedback.number0;
      case 1: return UserFeedback.number1;
      case 2: return UserFeedback.number2;
      case 3: return UserFeedback.number3;
      case 4: return UserFeedback.number4;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [UserFeedbackTypeTransformer] instance.
  static UserFeedbackTypeTransformer _instance;
}

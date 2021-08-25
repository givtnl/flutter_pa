//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// 0 = Statement 1 = Category
class QuestionType {
  /// Instantiate a new enum with the provided [value].
  const QuestionType._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = QuestionType._(0);
  static const number1 = QuestionType._(1);

  /// List of all possible values in this [enum][QuestionType].
  static const values = <QuestionType>[
    number0,
    number1,
  ];

  static QuestionType fromJson(dynamic value) =>
    QuestionTypeTypeTransformer().decode(value);

  static List<QuestionType> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <QuestionType>[]
      : json
          .map((value) => QuestionType.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [QuestionType] to int,
/// and [decode] dynamic data back to [QuestionType].
class QuestionTypeTypeTransformer {
  const QuestionTypeTypeTransformer._();

  factory QuestionTypeTypeTransformer() => _instance ??= QuestionTypeTypeTransformer._();

  int encode(QuestionType data) => data.value;

  /// Decodes a [dynamic value][data] to a QuestionType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  QuestionType decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return QuestionType.number0;
      case 1: return QuestionType.number1;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [QuestionTypeTypeTransformer] instance.
  static QuestionTypeTypeTransformer _instance;
}

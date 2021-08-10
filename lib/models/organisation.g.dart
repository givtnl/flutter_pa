// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organisation _$OrganisationFromJson(Map<String, dynamic> json) {
  return Organisation(
    json['matchingPercentage'] as int,
    json['orgName'] as String,
    json['orgDescription'] as String,
  );
}

Map<String, dynamic> _$OrganisationToJson(Organisation instance) =>
    <String, dynamic>{
      'orgName': instance.name,
      'orgDescription': instance.explanation,
      'matchingPercentage': instance.id,
    };

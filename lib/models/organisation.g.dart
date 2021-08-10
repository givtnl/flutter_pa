// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organisation _$OrganisationFromJson(Map<String, dynamic> json) {
  return Organisation(
    id: json['id'] as int,
    name: json['orgName'] as String,
    explanation: json['orgDescription'] as String,
    orgKeyValues: json['orgKeyValues'] as String,
    orgMission: json['orgMission'] as String,
    orgVision: json['orgVision'] as String,
    orgWebsite: json['orgWebsite'] as String,
  );
}

Map<String, dynamic> _$OrganisationToJson(Organisation instance) =>
    <String, dynamic>{
      'orgName': instance.name,
      'orgDescription': instance.explanation,
      'id': instance.id,
      'orgKeyValues': instance.orgKeyValues,
      'orgMission': instance.orgMission,
      'orgVision': instance.orgVision,
      'orgWebsite': instance.orgWebsite,
    };

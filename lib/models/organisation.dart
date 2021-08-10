
import 'package:json_annotation/json_annotation.dart';

part 'organisation.g.dart';

@JsonSerializable()
class Organisation {

  @JsonKey(name: "orgName")
  String name;
  @JsonKey(name: "orgDescription")
  String explanation;
  @JsonKey(name: "id")
  int id;
  String orgKeyValues;
  String orgMission;
  String orgVision;
  String orgWebsite;

  Organisation({required this.id, required this.name, required this.explanation, required this.orgKeyValues, required this.orgMission, required this.orgVision, required this.orgWebsite});

  factory Organisation.fromJson(Map<String, dynamic> json) => _$OrganisationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganisationToJson(this);
}
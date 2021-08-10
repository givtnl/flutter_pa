
import 'package:json_annotation/json_annotation.dart';

part 'organisation.g.dart';

@JsonSerializable()
class Organisation {

  @JsonKey(name: "orgName")
  String name;
  @JsonKey(name: "orgDescription")
  String explanation;
  @JsonKey(name: "matchingPercentage")
  int id;

  Organisation(this.id, this.name, this.explanation);

  factory Organisation.fromJson(Map<String, dynamic> json) => _$OrganisationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganisationToJson(this);
}
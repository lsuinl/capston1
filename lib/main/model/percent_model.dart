import 'package:json_annotation/json_annotation.dart';

part 'percent_model.g.dart';

@JsonSerializable()
class PercentModel {
  final int total_score;

  PercentModel({
    required this.total_score,
  });

  factory PercentModel.fromJson(Map<String, dynamic> json) =>
      _$PercentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PercentModelToJson(this);
}

@JsonSerializable()
class PercentRequest {
  final String userId;
  final String question;

  PercentRequest({
    required this.userId,
    required this.question,
  });

  factory PercentRequest.fromJson(Map<String, dynamic> json) =>
      _$PercentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PercentRequestToJson(this);
}

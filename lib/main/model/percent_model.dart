import 'package:json_annotation/json_annotation.dart';

part 'percent_model.g.dart';

@JsonSerializable()
class PercentModel {
  final int standard_1;
  final int standard_2;
  final int standard_3;
  final int standard_4;
  final int standard_5;
  final int standard_6;
  final int standard_7;
  final int standard_8;
  final int standard_9;
  final int standard_10;
  final int total_score;

  PercentModel({
    required this.standard_1,
    required this.standard_2,
    required this.standard_3,
    required this.standard_4,
    required this.standard_5,
    required this.standard_6,
    required this.standard_7,
    required this.standard_8,
    required this.standard_9,
    required this.standard_10,
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

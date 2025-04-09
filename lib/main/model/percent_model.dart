import 'package:json_annotation/json_annotation.dart';

import 'percent_model.g.dart';

@JsonSerializable()
class PercentModel {
  final int Percent;

  PercentModel({
    required this.Percent,
});

  factory PercentModel.fromJson(Map<String,dynamic> json)
  =>_$PercentModelFromJson(json);


}
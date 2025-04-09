import 'package:json_annotation/json_annotation.dart';

import 'answer_model.g.dart';

@JsonSerializable()
class AnswerModel {
  final String context;

  AnswerModel({
    required this.context,
});

  factory AnswerModel.fromJson(Map<String,dynamic> json)
  =>_$AnswerModelFromJson(json);
}
import 'package:json_annotation/json_annotation.dart';

part 'answer_model.g.dart';


@JsonSerializable()
class AnswerModel {
  final bool isMe;
  final String text;

  AnswerModel({
    required this.isMe,
    required this.text,
});

  factory AnswerModel.fromJson(Map<String,dynamic> json)
  =>_$AnswerModelFromJson(json);
}
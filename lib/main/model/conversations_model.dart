import 'package:json_annotation/json_annotation.dart';

part 'conversations_model.g.dart';


@JsonSerializable()
class ConversationsModel {
  final int id;
  final String title;
  final String date;

  ConversationsModel({
    required this.id,
    required this.title,
    required this.date,
  });

  factory ConversationsModel.fromJson(Map<String,dynamic> json)
  =>_$ConversationsModelFromJson(json);
}
import 'package:json_annotation/json_annotation.dart';

part 'conversations_model.g.dart';


@JsonSerializable()
class ConversationsModel {
  final int conversationId;
  final String title;
  final String createdAt;

  ConversationsModel({
    required this.conversationId,
    required this.title,
    required this.createdAt,
  });

  factory ConversationsModel.fromJson(Map<String,dynamic> json)
  =>_$ConversationsModelFromJson(json);
}
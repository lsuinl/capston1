import 'package:json_annotation/json_annotation.dart';

import 'chat_model.dart';

part 'conversation_model.g.dart';


@JsonSerializable()
class ConversationModel {
  final int conversationId;
  final String title;
  final List<ChatMessage> messages;

  ConversationModel({
    required this.conversationId,
    required this.title,
    required this.messages
  });

  factory ConversationModel.fromJson(Map<String,dynamic> json)
  =>_$ConversationModelFromJson(json);
}
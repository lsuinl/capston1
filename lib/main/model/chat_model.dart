import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatRequest {
  final String question;
  final int conversationId;

  ChatRequest({
    required this.question,
    required this.conversationId,
  });

  factory ChatRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestFromJson(json);
  
  Map<String, dynamic> toJson() => _$ChatRequestToJson(this);
}

@JsonSerializable()
class ChatData {
  final String message;
  final String content;
  final String timestamp;

  ChatData({
    required this.message,
    required this.content,
    required this.timestamp,
  });

  factory ChatData.fromJson(Map<String, dynamic> json) =>
      _$ChatDataFromJson(json);
}

@JsonSerializable()
class ChatMessage {
  final String content;
  final bool isMe;
  final String timestamp;

  ChatMessage({
    required this.content,
    required this.isMe,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
  
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
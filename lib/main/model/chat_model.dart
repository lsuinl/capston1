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

@JsonEnum(fieldRename: FieldRename.none)
enum Sender {
  user,
  ai,
}

@JsonSerializable()
class ChatMessage {
  final String content;
  final Sender sender;
  final String timestamp;

  ChatMessage({
    required this.content,
    required this.sender,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
  
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
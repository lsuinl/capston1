// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRequest _$ChatRequestFromJson(Map<String, dynamic> json) => ChatRequest(
      question: json['question'] as String,
      conversationId: (json['conversationId'] as num).toInt(),
    );

Map<String, dynamic> _$ChatRequestToJson(ChatRequest instance) =>
    <String, dynamic>{
      'question': instance.question,
      'conversationId': instance.conversationId,
    };

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      content: json['content'] as String,
      sender: $enumDecode(_$SenderEnumMap, json['sender']),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'sender': _$SenderEnumMap[instance.sender]!,
      'timestamp': instance.timestamp,
    };

const _$SenderEnumMap = {
  Sender.user: 'user',
  Sender.ai: 'ai',
};

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

ChatData _$ChatDataFromJson(Map<String, dynamic> json) => ChatData(
      message: json['message'] as String,
      content: json['content'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$ChatDataToJson(ChatData instance) => <String, dynamic>{
      'message': instance.message,
      'content': instance.content,
      'timestamp': instance.timestamp,
    };

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      content: json['content'] as String,
      isMe: json['isMe'] as bool,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'isMe': instance.isMe,
      'timestamp': instance.timestamp,
    };

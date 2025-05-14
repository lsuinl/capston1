// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationsModel _$ConversationsModelFromJson(Map<String, dynamic> json) =>
    ConversationsModel(
      conversationId: int.tryParse(json['conversationId'].toString()) ?? 0,
      title: json['title'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ConversationsModelToJson(ConversationsModel instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'title': instance.title,
      'createdAt': instance.createdAt,
    };

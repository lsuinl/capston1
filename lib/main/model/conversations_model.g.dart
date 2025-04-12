// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationsModel _$ConversationsModelFromJson(Map<String, dynamic> json) =>
    ConversationsModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$ConversationsModelToJson(ConversationsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
    };

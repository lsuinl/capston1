// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PercentModel _$PercentModelFromJson(Map<String, dynamic> json) => PercentModel(
      total_score: (json['total_score'] as num).toInt(),
    );

Map<String, dynamic> _$PercentModelToJson(PercentModel instance) =>
    <String, dynamic>{
      'total_score': instance.total_score,
    };

PercentRequest _$PercentRequestFromJson(Map<String, dynamic> json) =>
    PercentRequest(
      userId: json['userId'] as String,
      question: json['question'] as String,
    );

Map<String, dynamic> _$PercentRequestToJson(PercentRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'question': instance.question,
    };

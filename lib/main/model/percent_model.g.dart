// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PercentModel _$PercentModelFromJson(Map<String, dynamic> json) => PercentModel(
      standard_1: (json['standard_1'] as num).toInt(),
      standard_2: (json['standard_2'] as num).toInt(),
      standard_3: (json['standard_3'] as num).toInt(),
      standard_4: (json['standard_4'] as num).toInt(),
      standard_5: (json['standard_5'] as num).toInt(),
      standard_6: (json['standard_6'] as num).toInt(),
      standard_7: (json['standard_7'] as num).toInt(),
      standard_8: (json['standard_8'] as num).toInt(),
      standard_9: (json['standard_9'] as num).toInt(),
      standard_10: (json['standard_10'] as num).toInt(),
      total_score: (json['total_score'] as num).toInt(),
    );

Map<String, dynamic> _$PercentModelToJson(PercentModel instance) =>
    <String, dynamic>{
      'standard_1': instance.standard_1,
      'standard_2': instance.standard_2,
      'standard_3': instance.standard_3,
      'standard_4': instance.standard_4,
      'standard_5': instance.standard_5,
      'standard_6': instance.standard_6,
      'standard_7': instance.standard_7,
      'standard_8': instance.standard_8,
      'standard_9': instance.standard_9,
      'standard_10': instance.standard_10,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      data: AuthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
      message: json['message'] as String,
      accessToken: json['accessToken'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'message': instance.message,
      'accessToken': instance.accessToken,
      'userId': instance.userId,
    };

AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) => AuthRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthRequestToJson(AuthRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

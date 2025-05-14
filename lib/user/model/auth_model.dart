import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthResponse {
  final int statusCode;
  final AuthData data;

  AuthResponse({
    required this.statusCode,
    required this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@JsonSerializable()
class AuthData {
  final String message;
  final String? accessToken;
  final String? userId;

  AuthData({
    required this.message,
    this.accessToken,
    this.userId,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
}

@JsonSerializable()
class AuthRequest {
  final String email;
  final String password;

  AuthRequest({
    required this.email,
    required this.password,
  });

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
  
  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
} 
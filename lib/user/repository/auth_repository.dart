import 'package:capstone/component/response_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../component/const.dart';
import '../../component/dio.dart';
import '../model/auth_model.dart';

part 'auth_repository.g.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio, baseUrl: 'http://$ip/api/auth');
});

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;

  @POST('/login')
  Future<ResponseModel> login(@Body() AuthRequest request);

  @POST('/signup')
  Future<ResponseModel> signup(@Body() AuthRequest request);
} 
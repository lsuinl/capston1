import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:capstone/main/model/chat_model.dart';
import 'package:capstone/component/dio.dart';
import 'package:capstone/component/const.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../component/response_model.dart';

part 'chat_repository.g.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ChatRepository(dio,baseUrl: 'http://$ip/api');
});

@RestApi()
abstract class ChatRepository {
  factory ChatRepository(Dio dio, {String baseUrl}) = _ChatRepository;

  @POST('/conversations')
  @Headers({'accessToken': 'true'})
  Future<ResponseModel> createConversation();

  @POST('/chat/answer')
  @Headers({'accessToken': 'true'})
  Future<ChatResponse> sendMessage(@Body() ChatRequest request);
} 
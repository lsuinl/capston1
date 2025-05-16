import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:capstone/main/model/chat_model.dart';
import 'package:capstone/component/dio.dart';
import 'package:capstone/component/const.dart';

import '../../component/response_model.dart';

part 'chat_repository.g.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ChatRepository(dio,baseUrl: 'http://$ip/api');
});

@RestApi()
abstract class ChatRepository {
  factory ChatRepository(Dio dio, {String baseUrl}) = _ChatRepository;

  //대화 목록 조회
  @GET('/conversations')
  @Headers({'accessToken': 'true'})
  Future<ResponseModel> getConversations();

  //특정 대화 조회
  @GET('/conversations/{conversationId}')
  @Headers({'accessToken': 'true'})
  Future<ResponseModel> getConversation(@Path('conversationId') int conversationId);
  //대화 생성
  @POST('/conversations')
  @Headers({'accessToken': 'true'})
  Future<ResponseModel> createConversation();

  //대화 삭제
  @DELETE('/conversations/{conversationId}')
  @Headers({'accessToken': 'true'})
  Future<ResponseModel> deleteConversations(@Path('conversationId') int conversationId);

  //대화하기
  @POST('/chat/answer')
  @Headers({'accessToken': 'true'})
  Future<ResponseModel> sendMessage(@Body() ChatRequest request);
} 
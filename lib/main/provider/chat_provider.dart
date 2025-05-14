import 'package:capstone/component/response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/answer_model.dart';
import '../model/chat_model.dart';
import '../model/conversations_model.dart';
import '../repository/chat_repository.dart';

class ChatNotifier extends StateNotifier<List<AnswerModel>>{
  ChatNotifier() : super([]);

  void addMessage(AnswerModel message){
    state = [...state, message];
  }

  Future<void> fetchFromServer() async{
    //서버에서 메세지 받아오기
  }
}

final chatProvider = StateNotifierProvider<ChatStateNotifier, List<ChatMessage>>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ChatStateNotifier(repository: repository);
});

class ChatStateNotifier extends StateNotifier<List<ChatMessage>> {
  final ChatRepository repository;

  int conversationId = -1;

  ChatStateNotifier({
    required this.repository,
  }) : super([]);

  Future<void> sendMessage(String message) async {
    //첫 대화인 경우, 새로운 대화창 생성하기
    if(conversationId == -1) {
      try {
        final response = await repository.createConversation();
        if(response.statusCode == 201) {
          conversationId = int.parse(response.data['conversationId']);
        } else {
          throw Exception('대화방 생성에 실패했습니다.');
        }
      } catch(e) {
        print('대화방 생성에 실패했습니다. : $e');
        rethrow;
      }
    }

    try {
      // 사용자 메시지 추가
      final userMessage = ChatMessage(
        content: message,
        isMe: true,
        timestamp: DateTime.now().toIso8601String(),
      );
      state = [...state, userMessage];

      // 서버에 메시지 전송
      final response = await repository.sendMessage(
        ChatRequest(
          question: message,
          conversationId: conversationId,
        ),
      );

      // AI 응답 메시지 추가
      if (response.statusCode == 201) {

        final aiMessage = ChatMessage(
          content: response.data.content,
          isMe: false,
          timestamp: response.data.timestamp,
        );
        state = [...state, aiMessage];
      }
    } catch (e) {
      print('Error sending message: $e');
      // 에러 메시지 추가
      final errorMessage = ChatMessage(
        content: '메시지 전송 중 오류가 발생했습니다.',
        isMe: false,
        timestamp: DateTime.now().toIso8601String(),
      );
      state = [...state, errorMessage];
    }
  }
}
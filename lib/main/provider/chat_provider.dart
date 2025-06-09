import 'package:capstone/component/response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/chat_model.dart';
import '../model/conversation_model.dart';
import '../model/conversations_model.dart';
import '../repository/chat_repository.dart';

final chatProvider =
    StateNotifierProvider<ChatStateNotifier, List<ChatMessage>>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ChatStateNotifier(repository: repository);
});

class ChatStateNotifier extends StateNotifier<List<ChatMessage>> {
  final ChatRepository repository;

  int conversationId = -1;

  ChatStateNotifier({
    required this.repository,
  }) : super([]);
  bool isLoading = false;


  Future<void> getConversation(int conversationId) async {
    final response = await repository.getConversation(conversationId);
    if (response.statusCode == 201|| response.statusCode==200) {
      if(response.data!=null) {
        ConversationModel data = ConversationModel.fromJson(response.data!);
        conversationId = data.conversationId;
        state = data.messages;
      }
    }
  }

  Future<void> sendMessage(String message) async {
    //첫 대화인 경우, 새로운 대화창 생성하기
    if (conversationId == -1) {
     // try {
        final response = await repository.createConversation();
        if (response.statusCode == 201|| response.statusCode==200) {
          if(response.data!=null)
          conversationId = int.parse(response.data!['conversationId']);
        } else {
          throw Exception('대화방 생성에 실패했습니다.');
        }
    //  } catch (e) {
    //    print('대화방 생성에 실패했습니다. : $e');
    //    rethrow;
    //  }
    }

   // try {
      // 사용자 메시지 추가
      final userMessage = ChatMessage(
        content: message,
        sender: Sender.user,
        timestamp: DateTime.now().toIso8601String(),
      );
      state = [...state, userMessage];
      isLoading = true;
      state = [...state];
      // 서버에 메시지 전송
      final response = await repository.sendMessage(
        ChatRequest(
          question: message,
          conversationId: conversationId,
        ),
      );

      // AI 응답 메시지 추가
      if (response.statusCode == 201|| response.statusCode==200) {
        isLoading = false;
        if(response.data!=null){
        ChatMessage data = ChatMessage.fromJson(response.data!);
        state = [...state, data];
        }
      }
    // } catch (e) {
    //   isLoading = false;
    //   print('Error sending message: $e');
    //   // 에러 메시지 추가
    //   final errorMessage = ChatMessage(
    //     content: '메시지 전송 중 오류가 발생했습니다.',
    //     sender: Sender.user,
    //     timestamp: DateTime.now().toIso8601String(),
    //   );
    //   state = [...state, errorMessage];
    // }
  }
}

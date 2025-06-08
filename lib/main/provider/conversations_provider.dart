import 'package:capstone/component/response_model.dart';
import 'package:capstone/main/model/conversation_model.dart';
import 'package:capstone/main/model/conversations_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/chat_repository.dart';
import 'chat_provider.dart';


final ConversationProvider = StateNotifierProvider<ConversationNotifier, List<ConversationsModel>>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ConversationNotifier(repository: repository, ref: ref);
});


class ConversationNotifier extends StateNotifier<List<ConversationsModel>>{
  final ChatRepository repository;
  final Ref ref;

  ConversationNotifier({
    required this.repository,
    required this.ref,
  }) : super([
  ]);

  void addConversation() async {
    ResponseModel response = await repository.createConversation();
    if(response.statusCode == 201|| response.statusCode==200) {
      ConversationsModel conversation = ConversationsModel.fromJson(response.data);
      state = [conversation, ...state];
      await ref.read(chatProvider.notifier).getConversation(conversation.conversationId);
    }
  }

  void removeConversation(int id) async {
    ResponseModel response = await repository.deleteConversations(id);
    if(response.statusCode ==200|| response.statusCode==201)
      state = state.where((item) => item.conversationId != id).toList();
  }

  Future<void> fetchFromServer() async{
    ResponseModel response= await repository.getConversations();
    if(response.statusCode == 201|| response.statusCode==200) {
      List<ConversationsModel> datas = (response.data['conversations'] as List)
          .map((json) => ConversationsModel.fromJson(json))
          .toList();
      state=datas;
    }
  }
}
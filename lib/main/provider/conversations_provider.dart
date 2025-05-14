import 'package:capstone/component/response_model.dart';
import 'package:capstone/main/model/conversations_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/answer_model.dart';
import '../repository/chat_repository.dart';


final ConversationProvider = StateNotifierProvider<ConversationNotifier, List<ConversationsModel>>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ConversationNotifier(repository: repository);
});


class ConversationNotifier extends StateNotifier<List<ConversationsModel>>{
  final ChatRepository repository;

  ConversationNotifier({
    required this.repository,
  }) : super([
  ]);

  void addMessage(ConversationsModel message){
    state = [...state, message];
  }

  Future<void> fetchFromServer() async{
    ResponseModel response= await repository.getConversations();
    if(response.statusCode == 201) {
      List<ConversationsModel> datas = (response.data['conversations'] as List)
          .map((json) => ConversationsModel.fromJson(json))
          .toList();
      state.addAll(datas);
    }
  }
}
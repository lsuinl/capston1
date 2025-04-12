import 'package:capstone/main/model/conversations_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/answer_model.dart';

class ConversationNotifier extends StateNotifier<List<ConversationsModel>>{
  ConversationNotifier() : super([
    ConversationsModel(id: 1, title: 'gdgd', date: '20020504')
  ]);

  void addMessage(ConversationsModel message){
    state = [...state, message];
  }

  Future<void> fetchFromServer() async{
    //서버에서 메세지 받아오기
  }
}

final conversationsProvider = StateNotifierProvider<ConversationNotifier,List<ConversationsModel>>((ref){
  return ConversationNotifier();
});
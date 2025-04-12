import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/answer_model.dart';

class ChatNotifier extends StateNotifier<List<AnswerModel>>{
  ChatNotifier() : super([]);

  void addMessage(AnswerModel message){
    state = [...state, message];
  }

  Future<void> fetchFromServer() async{
    //서버에서 메세지 받아오기
  }
}

final chatProvider = StateNotifierProvider<ChatNotifier,List<AnswerModel>>((ref){
  return ChatNotifier();
});
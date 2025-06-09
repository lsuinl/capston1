import 'package:capstone/component/const.dart';
import 'package:capstone/main/model/percent_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';

import '../../component/response_model.dart';
import '../../component/secure_storage.dart';
import '../repository/chat_repository.dart';

final PercentProvider = StateNotifierProvider<PercentStateNotifier, int>((ref){
  final repository = ref.watch(chatRepositoryProvider);
  final storage = ref.read(secureStorageProvider);
  return PercentStateNotifier(repository: repository, storage: storage);
});

class PercentStateNotifier extends StateNotifier<int>{
  final ChatRepository repository;
  final FlutterSecureStorage storage;

  PercentStateNotifier({required this.repository, required this.storage}):super(0);
  void updateNumber(String question) async {
    final userId = await storage.read(key: USER_ID);
    PercentRequest quest = PercentRequest(userId: userId!, question: question);

    ResponseModel response = await repository.checkprobability(quest);
    if(response.statusCode == 201&& response.data!=null) {
      PercentModel conversation = PercentModel.fromJson(response.data!);
      state = conversation.total_score;
    }
  }
}


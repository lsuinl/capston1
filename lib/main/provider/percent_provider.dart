import 'package:riverpod/riverpod.dart';

class PercentStateNotifier extends StateNotifier<int>{
  PercentStateNotifier():super(0);

  void updateNumber(int percent){
    state = percent;
  }
}

final PercentProvider = StateNotifierProvider<PercentStateNotifier, int>((ref){
  return PercentStateNotifier();
});

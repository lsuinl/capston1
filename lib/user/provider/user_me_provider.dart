import 'package:capstone/user/provider/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:capstone/user/model/auth_model.dart';
import 'package:capstone/user/repository/auth_repository.dart';

import '../../component/const.dart';
import '../../component/response_model.dart';
import '../../component/secure_storage.dart';
import '../repository/user_me_repository.dart';


final userMeProvider = StateNotifierProvider<UserMeStateNotifier, UserMeState>((ref) {
  return UserMeStateNotifier(ref.watch(authRepositoryProvider));
});

class UserMeState {
  final bool isLoading;
  final String? error;
  final String? email;

  UserMeState({
    this.isLoading = false,
    this.error,
    this.email,
  });

  UserMeState copyWith({
    bool? isLoading,
    String? error,
    String? email,
  }) {
    return UserMeState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      email: email ?? this.email,
    );
  }
}

class UserMeStateNotifier extends StateNotifier<UserMeState> {
  final AuthRepository _authRepository;

  UserMeStateNotifier(this._authRepository) : super(UserMeState());

  Future<ResponseModel> login(AuthRequest request) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _authRepository.login(request);
      state = state.copyWith(
        isLoading: false,
        email: request.email,
      );
      return response;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<ResponseModel> signup(AuthRequest request) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _authRepository.signup(request);
      state = state.copyWith(
        isLoading: false,
        email: request.email,
      );
      return response;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> getMe() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
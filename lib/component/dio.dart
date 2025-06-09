import 'package:capstone/component/const.dart';
import 'package:capstone/component/secure_storage.dart';
import 'package:capstone/user/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';

//dio가 항상 provider을 통해 데이터를 가져옴
final dioProvider = Provider(( ref) {
  final dio = Dio();

  final storage = ref.watch(secureStorageProvider); //하나의 인스턴스의 스토리지(저장소)를 가져옴

  dio.interceptors.add(
    CustomInterceptor(storage: storage, ref:ref),
  );

  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final ProviderRef ref;

  CustomInterceptor({
    required this.ref,
    required this.storage});

  //1. 요청을 보낼 때
  //요청을 보낼때마다 요청의 헤더에 엑세스토큰이 true인경우 실제 엑세스 토큰을 storage에서 가져와
  //authorization: bearer $token으로 헤더 변경한다.
  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    print("[REQ] [${options.method}] ${options.uri}");
    print("[REQ] Headers: ${options.headers}");
    print("[REQ] Body: ${options.data}");

    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');

      final token = await storage.read(key: ACCESS_TOKEN_KEY);

      options.headers.addAll(({
        'authorization': 'Bearer $token',
      }));
    }
    return super.onRequest(options, handler);
  }

  //2. 응답을 받을 때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("[RES] [${response.requestOptions.method}] ${response.requestOptions
        .uri}");
    print("[RES] Status Code: ${response.statusCode}");
    print("[RES] Headers: ${response.headers}");
    print("[RES] Body: ${response.data}");
    return super.onResponse(response, handler);
  }

  //3. 에러 났을 때
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print("[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}");
    print("[ERR] Status Code: ${err.response?.statusCode}");
    print("[ERR] Headers: ${err.response?.headers}");
    print("[ERR] Body: ${err.response?.data}");

    final isStatus403 = err.response?.statusCode == 403;
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    if (isStatus403 && !isPathRefresh) {
      await storage.delete(key: ACCESS_TOKEN_KEY);

      if (navigatorKey.currentContext != null) {
        Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false,
        );
      }
    }

    // 반드시 호출: 에러를 다음으로 넘기기
    handler.next(err);
  }
}

  final navigatorKey = GlobalKey<NavigatorState>();

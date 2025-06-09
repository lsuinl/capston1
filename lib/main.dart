import 'package:capstone/component/const.dart';
import 'package:capstone/main/main_screen.dart';
import 'package:capstone/user/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/component/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:capstone/component/dio.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.read(key: ACCESS_TOKEN_KEY);
    
    if (token == null) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1440, 1024),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            theme: ThemeData(
              scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(MAIN_COLOR), // 스크롤 바 색상 변경// 스크롤 바 트랙 색상
                radius: Radius.circular(10), // 스크롤 바 모서리 둥글게
                thickness: MaterialStateProperty.all(12), // 스크롤 바 두께
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: MainScreen(),
            ),
          );
        });
  }
}

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
   // final storage = ref.read(secureStorageProvider);
    final token =ACCESS_TOKEN_KEY;
    //await storage.read(key: ACCESS_TOKEN_KEY);


    // 로그인 여부에 따라 라우팅
    if (!mounted) return;
    if (token == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()), // 로딩 화면
    );
  }
}
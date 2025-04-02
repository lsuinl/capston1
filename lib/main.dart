import 'package:capstone/component/const.dart';
import 'package:capstone/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1440, 1024),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
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

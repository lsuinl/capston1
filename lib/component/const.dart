import 'package:flutter/material.dart';

Color MAIN_COLOR = Color(0xFF49454f);
Color BLACK_COLOR = Color(0xFF1E1E1E);
Color SIDE_COLOR = Color(0xFFECE6F0);

// 토큰 관련 상수
const String ACCESS_TOKEN_KEY = 'access_token';
const String REFRESH_TOKEN_KEY = 'refresh_token';

//localhost
final emulatorIp='10.0.2.2:3000';
final simulatorIp='127.0.0.1:3000';

String ip = "localhost:3000";

List<String> answer = [
  '~20퍼센트\n구려용',
  '~40퍼센트\n흠,,',
  '~60퍼센트\n봐줄만해요',
  '~80퍼센트\n좋아요',
  '~100퍼센트\n최고에요',
];
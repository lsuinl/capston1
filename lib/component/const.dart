import 'package:flutter/material.dart';

Color MAIN_COLOR = Color(0xFF49454f);
Color BLACK_COLOR = Color(0xFF1E1E1E);
Color SIDE_COLOR = Color(0xFFECE6F0);

// 토큰 관련 상수
const String ACCESS_TOKEN_KEY = 'access_token';
const String USER_ID = 'refresh_token';

String ip = "52.79.81.133:80";

List<String> answer = [
  '자유롭게 질문해보세요!\n여러분의 주체성 향상을 위한 코멘트를 드릴게요!',
  '질문이 너무 막연해요! \n조금 더 본인의 의도를 표현해보면 좋을 것 같아요 :)',
  '조금 아쉬워요! \n어떤 점이 궁금한지 좀 더 구체적으로 말씀해주시면 좋을 것 같아요.',
  '좋아요, 어느 정도 방향성이 보여요! \n조금만 더 명확히 해주시면 더 정확한 답을 드릴 수 있어요.',
  '좋은 질문이에요! 주체성이 잘 드러나고 있어요. 거의 완성형이에요!',
  '완벽해요! \n스스로 잘 고민하셨고, AI가 도와드리기에 가장 이상적인 질문이에요',
];
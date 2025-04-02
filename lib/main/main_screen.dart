import 'package:capstone/component/const.dart';
import 'package:capstone/component/default_layout.dart';
import 'package:capstone/main/component/ai_profile.dart';
import 'package:capstone/main/component/chatting.dart';
import 'package:capstone/main/component/input_field.dart';
import 'package:capstone/main/component/side_tab.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        backgroundColor: MAIN_COLOR,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SideTab(),
          Flexible(child:
          Column(
            children: [
              AiProfile(),
              Expanded(child:
              Chatting()),
            ],
          ))
        ]));
  }
}

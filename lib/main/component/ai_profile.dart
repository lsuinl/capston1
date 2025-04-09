import 'package:capstone/main/component/setting_menu.dart';
import 'package:flutter/material.dart';

//설정 버튼
class AiProfile extends StatelessWidget {
  const AiProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 30,
          ),
        ),
        Text(
          "AI",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        )
      ]),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SettingMenu())
    ]);
  }
}

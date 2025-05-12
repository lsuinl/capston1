import 'package:capstone/main/component/input_field.dart';
import 'package:capstone/user/component/user_button.dart';
import 'package:capstone/user/component/user_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/const.dart';
import '../component/default_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController id=TextEditingController();
    TextEditingController passward=TextEditingController();
    return DefaultLayout(
        backgroundColor: MAIN_COLOR,
        child: Container(
            child: Row(children: [
          Image.asset(
            "asset/login.jpg",
            height: 1024.h,
            width: 900.w,
            fit: BoxFit.cover,
          ),
           Expanded(child:
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Text(
                  "로그인하세요.",
                  style: TextStyle(color: Colors.white,fontSize: 25),
                ),
                const SizedBox(height: 20,),
                UserInputField(content: "아이디",controller: id,),
                UserInputField(content: "비밀번호",controller: passward,),
                UserButton(title: "로그인", onPressed: () {
                  print(id.text);
                  print(passward.text);
                }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("아이디가 존재하지 않나요?"),
                    TextButton(child: Text("회원가입하기",style: TextStyle(color: Colors.white),), onPressed: () {
                      
                    })
                  ],
                )
              ])
           ) ])));
  }
}

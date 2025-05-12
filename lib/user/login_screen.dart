import 'package:capstone/main/component/input_field.dart';
import 'package:capstone/user/component/user_button.dart';
import 'package:capstone/user/component/user_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/const.dart';
import '../component/default_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin=true;
  @override
  Widget build(BuildContext context) {
    TextEditingController id=TextEditingController();
    TextEditingController passward=TextEditingController();
    return DefaultLayout(
        backgroundColor: Colors.white,
        child: Container(
            child: Row(children: [
          Image.asset(
            "asset/login.jpg",
            height: 1024.h,
            width: 800.w,
            fit: BoxFit.cover,
          ),
           Expanded(child:
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Text(
                isLogin? "로그인":"회원가입",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20,),
                UserInputField(content: "이메일",controller: id,),
                UserInputField(content: "비밀번호",controller: passward,isSecure: true,),
                UserButton(title: isLogin?"로그인":"회원가입",
                    onPressed: () {
                  if(isLogin){
                    //로그인요청
                  }
                  else{
                    //회원가입요청
                  }
                  print(id.text);
                  print(passward.text);
                }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(isLogin?"아이디가 존재하지 않나요?":"아이디가 이미 존재하나요?") ,
                    TextButton(child: Text(isLogin?"회원가입하기":"로그인하기",style: TextStyle(color: Colors.blue),), onPressed: () {
                      setState(() {
                        isLogin=!isLogin;
                        print(isLogin);
                      });
                    })
                  ],
                )
              ])
           ) ])));
  }
}

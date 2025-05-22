import 'package:capstone/main/main_screen.dart';
import 'package:capstone/user/component/user_button.dart';
import 'package:capstone/user/component/user_input_field.dart';
import 'package:capstone/user/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/const.dart';
import '../component/default_layout.dart';
import 'model/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:capstone/component/secure_storage.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool isLogin = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                isLogin ? "로그인" : "회원가입",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              UserInputField(
                content: "이메일",
                controller: emailController,
              ),
              UserInputField(
                content: "비밀번호",
                controller: passwordController,
                isSecure: true,
              ),
              UserButton(
                title: isLogin ? "로그인" : "회원가입",
                onPressed: handleAuth,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isLogin ? "아이디가 존재하지 않나요?" : "아이디가 이미 존재하나요?"),
                  TextButton(
                    child: Text(
                      isLogin ? "회원가입하기" : "로그인하기",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                  )
                ],
              )
            ],
          ))
        ])));

        
  }
  Future<void> handleAuth() async {
    final authRepository = ref.read(authRepositoryProvider);
    final storage = ref.read(secureStorageProvider);
    try {
      final response = isLogin
          ? await authRepository.login(
              AuthRequest(
                email: emailController.text,
                password: passwordController.text,
              ),
            )
          : await authRepository.signup(
              AuthRequest(
                email: emailController.text,
                password: passwordController.text,
              ),
            );
      AuthData authData = AuthData.fromJson(response.data);
        if (response.statusCode == 201 && response.data != authData) {
          await storage.write(key: ACCESS_TOKEN_KEY, value: authData.accessToken);
          
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(response.message)),
            );
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const MainScreen(),
              ),
              (route) => false,
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('오류가 발생했습니다: $e')),
          );
        }
      }
    }
  
}

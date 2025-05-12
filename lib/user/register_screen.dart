import 'package:flutter/material.dart';

import '../component/const.dart';
import '../component/default_layout.dart';
import 'component/user_input_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        backgroundColor: MAIN_COLOR,
        child:   Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           //   UserInputField(content: "아이디",controller: id,),
            //  UserInputField(content: "비밀번호"),
            ]));
  }
}

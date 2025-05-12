import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInputField extends StatelessWidget {
  final TextEditingController controller;
  final String content;

  const UserInputField({
    required this.content,
    required this.controller,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
        padding: EdgeInsets.only(left: 10),
        child:
        Text(
            content,
            style: TextStyle(color: Colors.white),
          )),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child:
          Container(
            width: 400.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "$content를 입력하세요.",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
        )]));
  }
}

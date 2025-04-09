import 'package:capstone/component/const.dart';
import 'package:capstone/main/component/input_field.dart';
import 'package:capstone/main/component/input_result.dart';
import 'package:flutter/material.dart';

//
class Chatting extends StatefulWidget {
  const Chatting({super.key});

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            color: BLACK_COLOR,
            child: Column(children: [
              Expanded(
                  child: Scrollbar(
                    controller: _scrollController,
            thumbVisibility: true, // 항상 보이게 설정
                child:  ListView(
                    controller: _scrollController,
                    children: [
                MyChat(isMe: true, text: "안녕"),
                MyChat(isMe: false, text: "dkfjdkfjdkfjdkfj"),
                MyChat(isMe: false, text: "dkfjdkfjdkfjdkfj"),
              ]))),
              InputResult(),
              InputField(),
            ])));
  }
}

class MyChat extends StatelessWidget {
  final bool isMe;
  final String text;

  const MyChat({required this.isMe, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        // 왼쪽 정렬
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Container(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    text,
                    style: TextStyle(color: isMe ? Colors.white : Colors.black),
                  )),
              decoration: BoxDecoration(
                color: isMe ? MAIN_COLOR : SIDE_COLOR,
                borderRadius: BorderRadius.only(
                  bottomLeft: isMe ? Radius.circular(20) : Radius.circular(5),
                  bottomRight: isMe ? Radius.circular(5) : Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            )));
  }
}

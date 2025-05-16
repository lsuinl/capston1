import 'package:capstone/component/const.dart';
import 'package:capstone/main/component/input_field.dart';
import 'package:capstone/main/component/input_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/chat_model.dart';
import '../provider/chat_provider.dart';

class Chatting extends ConsumerStatefulWidget {
  const Chatting({super.key});

  @override
  ConsumerState<Chatting> createState() => _ChattingState();
}

class _ChattingState extends ConsumerState<Chatting> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final chat = ref.watch(chatProvider);

    // 채팅이 추가될 때마다 스크롤을 아래로 이동
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: BLACK_COLOR,
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: chat.length,
                  itemBuilder: (context, index) {
                    final message = chat[index];
                    return MyChat(
                      isMe: message.sender==Sender.user  ? true:false,
                      text: message.content,
                    );
                  },
                ),
              ),
            ),
            InputResult(),
            InputField(),
          ],
        ),
      ),
    );
  }
}

class MyChat extends StatelessWidget {
  final bool isMe;
  final String text;

  const MyChat({
    required this.isMe,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              text,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),
          ),
          decoration: BoxDecoration(
            color: isMe ? MAIN_COLOR : SIDE_COLOR,
            borderRadius: BorderRadius.only(
              bottomLeft: isMe ? Radius.circular(20) : Radius.circular(5),
              bottomRight: isMe ? Radius.circular(5) : Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

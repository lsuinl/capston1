import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/answer_model.dart';
import '../provider/chat_provider.dart';

//메세지 입력, 전송기능, 수시로,
class InputField extends ConsumerStatefulWidget {
  const InputField({super.key});

  @override
  ConsumerState<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends ConsumerState<InputField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatNotifier = ref.read(chatProvider.notifier);

    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
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
              hintText: "메시지를 입력하세요...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              suffixIcon: IconButton(
                icon: Icon(Icons.send, color: Colors.black),
                onPressed: () {
                  // 메시지 전송 기능 추가
                  if (controller.text.isNotEmpty) {
                    chatNotifier.addMessage(AnswerModel(isMe: true, text: controller.text));
                    chatNotifier.fetchFromServer(); // 서버 응답 시뮬레이션
                    controller.clear();
                  }
                },
              ),
            ),
          ),
        ));
  }
}

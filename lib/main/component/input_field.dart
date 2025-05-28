import 'package:capstone/main/provider/percent_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (controller.text.isNotEmpty) {
      ref.read(chatProvider.notifier).sendMessage(controller.text);
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            suffixIcon: IconButton(
              icon: Icon(Icons.send, color: Colors.black),
              onPressed: _handleSubmit,
            ),
            icon: IconButton(onPressed: (){
              ref.read(PercentProvider.notifier).updateNumber(controller.text);
            }, icon: Icon(Icons.ac_unit,))
          ),
          onSubmitted: (_) => _handleSubmit(),
        ),
      ),
    );
  }
}

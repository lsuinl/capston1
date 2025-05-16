import 'package:capstone/main/model/conversations_model.dart';
import 'package:capstone/main/provider/conversations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:capstone/component/const.dart';

import '../main/provider/chat_provider.dart';

class SideTab extends ConsumerStatefulWidget {
  final SidebarXController controller;
  final VoidCallback onPressed;
  final VoidCallback onStateChanged;

  const SideTab({
    required this.controller, 
    required this.onPressed, 
    required this.onStateChanged,
    super.key
  });

  @override
  ConsumerState<SideTab> createState() => _SideTabState();
}

class _SideTabState extends ConsumerState<SideTab> {
  @override
  Widget build(BuildContext context) {
    final converstionsNotifier = ref.watch(ConversationProvider.notifier);
    final converstions = ref.watch(ConversationProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SidebarX(
          showToggleButton: false,
          controller: widget.controller,
          theme: SidebarXTheme(
            decoration: BoxDecoration(
              color: MAIN_COLOR,
            ),
            textStyle: TextStyle(color: SIDE_COLOR),
            selectedTextStyle: TextStyle(color: Colors.white),
            itemTextPadding: EdgeInsets.zero,
            itemPadding: EdgeInsets.symmetric(horizontal: 0),
            selectedItemDecoration: BoxDecoration(
              color: SIDE_COLOR.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
              size: 20,
            ),
            selectedIconTheme: IconThemeData(
              color: Colors.white,
              size: 20,
            ),
          ),
          extendedTheme: SidebarXTheme(
            width: 400.w,
          ),
          footerBuilder: (context, extended) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: IconButton(
                    onPressed: () {
                      converstionsNotifier.addConversation();
                      widget.controller.toggleExtended();
                      widget.onStateChanged();
                    },
                    color: Colors.white,
                    icon: Icon(
                      Icons.add,
                      size: 30,
                    )));
          },
          headerBuilder: (context, extended) {
            return Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.controller.extended
                      ? Expanded(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Conversations",
                                style:
                                    TextStyle(color: SIDE_COLOR, fontSize: 18),
                              )))
                      : Container(),
                  IconButton(
                      onPressed: widget.onPressed,
                      color: Colors.white,
                      icon: Icon(
                        widget.controller.extended ? Icons.close : Icons.menu,
                        size: 30,
                      )),
                ],
              ),
              const SizedBox(height: 30)
            ]);
          },
          items: List.generate(converstions.length, (index) {
            return SidebarXItem(
              icon: Icons.chat_bubble_outline,
              label: converstions[index].title,
              onTap: (){
                ref.read(chatProvider.notifier).getConversation(converstions[index].conversationId);
                widget.controller.toggleExtended();
                widget.onStateChanged();
              },
              onLongPress: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('삭제 확인'),
                        content: Text('해당 항목을 삭제하시겠습니까?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // 아니오 눌렀을 때 닫기
                            },
                            child: Text('아니오'),
                          ),
                          TextButton(
                            onPressed: () {
                              converstionsNotifier.removeConversation(converstions[index].conversationId);
                              // 예: converstions.removeAt(index);
                              Navigator.of(context).pop(); // 다이얼로그 닫기
                            },
                            child: Text('예'),
                          ),
                        ],
                      );
                    },
                  );
              },

            );
          }),
        ),
      ],
    );
  }
}

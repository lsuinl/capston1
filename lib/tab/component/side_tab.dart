import 'package:capstone/main/model/conversations_model.dart';
import 'package:capstone/main/provider/conversations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:capstone/component/const.dart';

class SideTab extends ConsumerStatefulWidget {
  final SidebarXController controller;
  final VoidCallback onPressed;

  const SideTab({required this.controller, required this.onPressed, super.key});

  @override
  ConsumerState<SideTab> createState() => _SideTabState();
}

class _SideTabState extends ConsumerState<SideTab> {
  final List<String> tabTitles = [
    "탭 1",
    "탭 2",
    "탭 3",
    "탭 4",
  ];

  @override
  Widget build(BuildContext context) {
    final converstionsNotifier = ref.watch(conversationsProvider.notifier);
    final converstions = ref.watch(conversationsProvider);
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
          ),
          extendedTheme: SidebarXTheme(
            width: 400.w,
          ),
          footerBuilder: (context, extended) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: IconButton(
                    onPressed: () => converstionsNotifier.addMessage(
                        ConversationsModel(
                            id: 2,
                            title: 'gd',
                            date: DateTime.now().toString())),
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
              icon: Icons.chat,
              label: converstions[index].title,
            );
          }),
        ),
      ],
    );
  }
}

import 'package:capstone/component/const.dart';
import 'package:capstone/component/default_layout.dart';
import 'package:capstone/main/component/ai_profile.dart';
import 'package:capstone/main/component/chatting.dart';
import 'package:capstone/main/component/input_field.dart';
import 'package:capstone/tab/component/side_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final SidebarXController _controller =
      SidebarXController(selectedIndex: 0, extended: false);

  bool _isExtended = false;

  final Duration _animationDuration = Duration(milliseconds: 300);

  void _handleSidebarToggle() async {
    _controller.setExtended(!_controller.extended);
    if (_isExtended) await Future.delayed(_animationDuration);
    if (mounted) {
      setState(() {
        _isExtended = _controller.extended;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _isExtended = _controller.extended;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        backgroundColor: MAIN_COLOR,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AnimatedContainer(
            duration: _animationDuration,
            width: _isExtended ? 400.w : 80,
            child: SideTab(
              controller: _controller,
              onPressed: _handleSidebarToggle,
            ),
          ),
          Flexible(
              child: Column(
            children: [
              AiProfile(),
              Expanded(child: Chatting()),
            ],
          ))
        ]));
  }
}

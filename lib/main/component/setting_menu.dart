import 'package:capstone/component/const.dart';
import 'package:flutter/material.dart';

class SettingMenu extends StatefulWidget {
  const SettingMenu({super.key});

  @override
  State<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends State<SettingMenu> {
  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton<String>(
      shadowColor: SIDE_COLOR,
      color: SIDE_COLOR,
      position: PopupMenuPosition.under,
      initialValue: "팝업메뉴 2입니다",

      /// 펼쳤을 때 나오는 항목들 List<PopupMenuItem>
      itemBuilder: (context) {
        return [
          _menuItem("로그아웃"),
          _menuItem("메뉴2"),
          _menuItem("메뉴3"),
        ];
      },
      onSelected: (value) {},
      constraints: const BoxConstraints(minWidth: 50, maxWidth: 150),
      offset: const Offset(-20, 20),
      icon: const Icon(Icons.settings,color: Colors.white,),
      iconSize: 30,
      enabled: true,
    );
  }

  PopupMenuItem<String> _menuItem(String text) {
    return PopupMenuItem<String>(
      enabled: true,
      onTap: () {},
      value: text,
      height: 50,
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

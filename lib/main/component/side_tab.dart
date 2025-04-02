import 'package:capstone/component/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideTab extends StatefulWidget {
  const SideTab({super.key});

  @override
  State<SideTab> createState() => _SideTabState();
}

class _SideTabState extends State<SideTab> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5, top: 10),
        child: Container(
            width: 300,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "Conversations",
                        style: TextStyle(color: SIDE_COLOR),
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () {},
                        color: Colors.white,
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        )),
                  )
                ],
              ),
              TitleButton(),
              TitleButton(),
              TitleButton(),
              TitleButton(),
            ])));
  }
}

class TitleButton extends StatelessWidget {
  const TitleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 18),
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(MAIN_COLOR),
              foregroundColor: WidgetStatePropertyAll(SIDE_COLOR),
              elevation: WidgetStatePropertyAll(0),
            ),
            child: Row(children: [
              SizedBox(
                  width: 200, // 최대 너비 설정
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("제목"),
                      Text(
                        "내용입니다내용입니다co내용입니다내용입니다contextntext",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(
                "10 min",
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ])));
  }
}

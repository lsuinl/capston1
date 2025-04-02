import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../component/const.dart';

class InputResult extends StatefulWidget {
  const InputResult({super.key});

  @override
  State<InputResult> createState() => _InputResultState();
}

class _InputResultState extends State<InputResult> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 700,
            maxHeight: 150,
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
                  child:
                  LinearPercentIndicator(
                    lineHeight: 8.0,
                    percent: 0.8,
                    progressColor: Colors.green,
                    barRadius: Radius.circular(20),
                  )),
                  Text(
                    "주체성 80%",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                  ),
            Align( // ← 텍스트만 왼쪽 정렬
              alignment: Alignment.centerLeft,
              child:
              Text(
                    "아주 좋은 질문이에요!\n사용자의 주체성이 높을 수록 AI는 더욱 만족스러운 답변을 해줍니다.",
                    style: TextStyle(color: Colors.black),
                  ))
                ],
              )),
          decoration: BoxDecoration(
            color: SIDE_COLOR,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20) ,
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),

        ));
  }
}

import 'package:capstone/component/data_utils.dart';
import 'package:capstone/main/provider/percent_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../component/const.dart';

class InputResult extends ConsumerWidget {
  const InputResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final percent = ref.watch(PercentProvider);

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
                    percent: percent/100,
                    progressColor: DataUtils.getColorFromPercentageHSV(percent.toDouble()),
                    barRadius: Radius.circular(20),
                  )),
                  Text(
                    "주체성: ${percent}%",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                  ),
            Align( // ← 텍스트만 왼쪽 정렬
              alignment: Alignment.centerLeft,
              child:
              Text(
                  answer[percent==0?0: (percent/20+1).toInt()],
                    style: TextStyle(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.w700),
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

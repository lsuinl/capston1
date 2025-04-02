import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiProfile extends StatelessWidget {
  const AiProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 30,
          ),
        ),
        Text(
          "AI",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        )
      ]),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              )))
    ]);
  }
}

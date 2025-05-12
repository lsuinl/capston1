import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const UserButton({
    required this.title,
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40), // 양쪽 패딩 10
      child:   SizedBox(
     width: 400.w,
    height: 50.h,
    child:ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16), // 위아래 여백 적당히
          ),
          child: Text(title),
        ),
    ));

  }
}

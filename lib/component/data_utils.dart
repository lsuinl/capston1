import 'dart:convert' as convert;
import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'const.dart';


class DataUtils{

  static pathToUrl(String value){
    return "http://$ip$value}";
  }

  static listPathsToUrls(List paths){
    return paths.map((e)=>pathToUrl(e)).toList();
  }

  static String plainToBase64(String plain) {
    convert.Codec<String, String> stringToBase64 = convert.utf8.fuse(convert.base64);
    return stringToBase64.encode(plain);
  }

  static Color getColorFromPercentageHSV(double percent) {
    // 0.0 ~ 1.0 범위로 보정
    final t = (percent / 100).clamp(0.0, 1.0);

    // 빨강(Hue: 0) ~ 초록(Hue: 120)
    final hue = 120.0 * t;
    final hsvColor = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0);
    return hsvColor.toColor();
  }

}
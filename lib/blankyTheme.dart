import 'package:flutter/material.dart';

/// 블랭키 색상 정의 파일
///
final ThemeData blankyTheme = ThemeData(
  ///기본 폰트 : 노토산즈
  fontFamily: 'NotoSans',
  primaryColor: BlankyColor.primaryColor[100],
  primaryColorLight:  BlankyColor.primaryColor[70],
);

class BlankyColor {
  BlankyColor._();

  static const Map<int, Color> primaryColor = const <int, Color> {
    50: Color(0x807a63ff),
    70: Color(0xb37a63ff),
    100: Color(0xff7A63FF),
  };
  //TODO Accent Color

  //TODO

}
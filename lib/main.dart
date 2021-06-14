import 'package:blanky/keys.dart';
import 'package:blanky/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';

void main() {
  runApp(Blanky());
}

class Blanky extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    KakaoContext.clientId = Keys().clientKey;
    return MaterialApp(
      title: 'Blanky',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Color(0xff7A63FF),
        primaryColorLight: Color(0xffB1A4FF),
      ),
      home: SplashPage(),
    );
  }
}
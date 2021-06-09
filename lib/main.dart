import 'package:blanky/page/auth/splash.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';

void main() {
  runApp(Blanky());
}

class Blanky extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    KakaoContext.clientId = "d5c17ab349cf211f9b2dd0cf150ee456";
    return MaterialApp(
      title: 'Blanky',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Color(0xff7A63FF),
      ),
      home: SplashPage(),
    );
  }
}
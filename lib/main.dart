import 'package:blanky/blankyTheme.dart';
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
    KakaoContext.javascriptClientId = Keys().jsKey;
    return MaterialApp(
      title: 'Blanky',
      theme: blankyTheme,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
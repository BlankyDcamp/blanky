import 'dart:async';

import 'package:blanky/page/auth/login/loginDialog.dart';
import 'package:blanky/page/auth/register/registerDialog.dart';
import 'package:blanky/page/auth/auth.dart';
import 'package:blanky/page/core.dart';
import 'package:flutter/material.dart';

import 'package:blanky/API/API.dart';
import 'package:kakao_flutter_sdk/all.dart';

/// 스플래시 페이지


class SplashPage extends StatefulWidget {
  _SplashPageState createState()=> _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  API api = API();

  @override
  void initState() {
    ///userPref 확인
    api.checkTokenValid().then((v) {
      if(v) {
        ///토큰 정상 확인됨
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context)=>CorePage())
        );
      } else {
        ///토큰이 없거나 유효하지 않음, 인증페이지 열림 
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context)=>AuthPage())
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash")
      ),
    );
  }
}
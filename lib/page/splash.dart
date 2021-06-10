import 'dart:async';

import 'package:blanky/page/auth/login/login.dart';
import 'package:blanky/page/auth/register/register.dart';
import 'package:blanky/page/core.dart';
import 'package:blanky/page/home/home.dart';
import 'package:flutter/material.dart';

import 'package:blanky/API/API.dart';
import 'package:kakao_flutter_sdk/all.dart';

/// 스플래시 페이지
///

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
        showLoginDialog();
      }
    });

    super.initState();
  }

  void login() async {
    try {
      String authCode = await AuthCodeClient.instance.request();
      AccessTokenResponse token = await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);
      int result = await api.getLoginResult(token.accessToken);
      if(result==200){
        ///정상진입
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage()
          )
        );
      } else {
        ///회원가입
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => RegisterPage()
            )
        );
      }
    } on KakaoAuthException catch (e) {
      print(e);
    } on KakaoClientException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  showLoginDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return LoginDialog((){login();});
        }
    );
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
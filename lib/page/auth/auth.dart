import 'dart:async';

import 'package:blanky/page/auth/login/loginDialog.dart';
import 'package:blanky/page/auth/register/registerDialog.dart';
import 'package:blanky/page/core.dart';
import 'package:flutter/material.dart';

import 'package:blanky/API/API.dart';
import 'package:kakao_flutter_sdk/all.dart';

/// 스플래시 페이지


class AuthPage extends StatefulWidget {
  _AuthPageState createState()=> _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  API api = API();

  @override
  void initState() {
    Timer(
      Duration(seconds: 1),
      (){
        showLoginDialog();
      }
    );
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
              builder: (context) => CorePage()
          )
        );
      } else {
        showRegisterDialog();
      }
    } on KakaoAuthException catch (e) {
      print(e);
    } on KakaoClientException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  void register() async {
    ///2차 진행 전까지는 SCHOOL로 통일
    int result = await api.signUp("SCHOOL");
    if(result != 404) {
      ///성공
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CorePage()
          )
      );
    } else {
      ///토큰없음
    }
  }

  showLoginDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return LoginDialog(()=>login());
        }
    );
  }

  showRegisterDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return RegisterDialog(()=>register());
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("auth")
      ),
    );
  }
}
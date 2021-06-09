
import 'package:blanky/API/API.dart';
import 'package:flutter/material.dart';

/// 회원가입 페이지 (상세정보 입력)

class RegisterPage extends StatefulWidget {
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  void initState() {
    //TODO Login Logic
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("asd"),
          onPressed: (){
            API().signUp("TEST SCHOOL");
          },
        ),
      ),
    );
  }
}
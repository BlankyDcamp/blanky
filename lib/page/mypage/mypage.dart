
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  _MyPageState createState() => _MyPageState();
}

///마이 페이지
class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("myPage"),
      ),
    );
  }
}
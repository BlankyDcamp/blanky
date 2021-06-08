import 'package:blanky/page/auth/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Blanky());
}

class Blanky extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
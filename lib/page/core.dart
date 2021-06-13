

import 'package:blanky/page/home/home.dart';
import 'package:blanky/page/mypage/mypage.dart';
import 'package:blanky/page/ranking/ranking.dart';
import 'package:blanky/page/coreNavigationWidget.dart';
import 'package:flutter/material.dart';

class CorePage extends StatefulWidget {
  _CorePageState createState() => _CorePageState();

}

class _CorePageState extends State<CorePage> {
  int currentPage = 1;

  Widget? coreWidget() {
    Size screenSize = MediaQuery.of(context).size;
    switch(currentPage) {
      case 0:
        return RankingPage();
      case 1:
        return HomePage();
      case 2:
        return MyPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          coreWidget()!,
          Align(
            alignment: Alignment.bottomCenter,
            child: CoreNavigationWidget(
                margin : EdgeInsets.symmetric(vertical: 30, horizontal: 46),
                initialValue: 1,
                onButtonPressed: (int value){
                  setState(() {
                    currentPage = value;
                  });
                },
            ),
          ),
        ],
      ),
    );
  }

}
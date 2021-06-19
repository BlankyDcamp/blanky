

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

  final rankingPage = RankingPage();
  final homePage = HomePage();
  final myPage = MyPage();

  Widget? coreWidget() {
    switch(currentPage) {
      case 0:
        return rankingPage;
      case 1:
        return homePage;
      case 2:
        return myPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          coreWidget()!, /// Navigation Widget 터치 시 바뀜
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
import 'package:blanky/page/commonWidget/chapterItem.dart';
import 'package:blanky/page/dual/dualDifficultySelectPage.dart';
import 'package:blanky/page/solo/soloDifficultySelectPage.dart';
import 'package:flutter/material.dart';
import 'package:blanky/API/API.dart';
import 'package:blanky/model/User.dart';
import 'package:blanky/page/home/homeSelectGameModeButton.dart';
import 'package:blanky/page/home/homeUserCardWidget.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User? currentUser;

  @override
  void initState() {
    API().getCurrentUserInfo().then((v) {
      setState(() {
        currentUser = v;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double backgroundObjectWidth = screenSize.width*2;
    final double backgroundObjectHeight = screenSize.height/2;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: OverflowBox(
                    minHeight: 0,
                    maxHeight: backgroundObjectHeight,
                    minWidth: 0,
                    maxWidth: backgroundObjectWidth,
                    child: Container(
                      decoration: BoxDecoration(
                        color: appTheme.primaryColorLight,
                        borderRadius: BorderRadius.all(Radius.elliptical(backgroundObjectWidth, backgroundObjectHeight)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 31+statusBarHeight),
                  child: HomeUserCard(userinfo: currentUser),
                ),
              ],
            ),
            Container(
              width: screenSize.width,
              margin: EdgeInsets.symmetric(horizontal: 19,vertical: 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex:5,
                    child: HomeSelectGameModeButton(
                        "솔로모드",
                        "솔로모드에서 다양한 퀴즈를 풀어보세요!",
                        LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [Color(0xff7A63FF),Color(0xff63C7FF),],
                        ),
                        (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>SoloDifficultySelectPage())
                          );
                        }
                    ),
                  ),
                  SizedBox(width: 9,),
                  Expanded(
                    flex:5,
                    child: HomeSelectGameModeButton(
                        "듀얼모드",
                        "듀얼모드에서 상대를 만나 단어배틀을 해보세요!",
                        LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Color(0xff7A63FF),Color(0xffD663FF)],
                        ),
                        (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>DualDifficultySelectPage())
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 19),
                child: Text(
                  "인기있는 챕터",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff585858)
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 19),
              child: Column(
                children: [
                  ChapterItem("title","description","3314",(){}),
                  ChapterItem("title","description","3314",(){}),
                  ChapterItem("title","description","3314",(){}),
                  ChapterItem("title","description","3314",(){}),
                  ChapterItem("title","description","3314",(){}),

                ],
              ),
            ),
            Container(
              height: 100,
            ),
          ],
        ),
      )
    );
  }

}
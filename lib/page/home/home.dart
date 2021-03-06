import 'package:blanky/model/Chapter.dart';
import 'package:blanky/page/commonWidget/chapterItem.dart';
import 'package:blanky/page/dual/dualDifficultySelectPage.dart';
import 'package:blanky/page/home/homeBackgroundShape.dart';
import 'package:blanky/page/solo/soloDifficultySelectPage.dart';
import 'package:flutter/material.dart';
import 'package:blanky/API/API.dart';
import 'package:blanky/model/User.dart';
import 'package:blanky/page/home/homeSelectGameModeButton.dart';
import 'package:blanky/page/home/homeUserCardWidget.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: screenSize.height),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: HomeBackgroundShape(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 31+statusBarHeight),
                    child: HomeUserCard(userinfo: currentUser),
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
                              "????????????",
                              "?????????????????? ????????? ????????? ???????????????!",
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
                        SizedBox(width: 15,),
                        Expanded(
                          flex:5,
                          child: HomeSelectGameModeButton(
                              "????????????",
                              "?????????????????? ????????? ?????? ??????????????? ????????????!",
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
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/icon_emoji_fire.svg'),
                          SizedBox(width: 8,),
                          Text(
                            "???????????? ??????",
                            style: TextStyle(
                                fontFamily: 'SairaSemiCondensed',
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Color(0xfff1f1f1)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 19, vertical: 5),
                    child: Column(
                      children: [
                        ChapterItem(
                            Chapter(
                              chapterImg: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg",
                              title: "Thrive on Stress",
                              description: "?????? ?????? ????????? ?????? ??????(?????????) Lesson1",
                            ),
                            (){}
                        ),
                        ChapterItem(
                            Chapter(
                              chapterImg: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg",
                              title: "Thrive on Stress",
                              description: "?????? ?????? ????????? ?????? ??????(?????????) Lesson1",
                            ),
                                (){}
                        ),
                        ChapterItem(
                            Chapter(
                              chapterImg: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg",
                              title: "Thrive on Stress",
                              description: "?????? ?????? ????????? ?????? ??????(?????????) Lesson1",
                            ),
                                (){}
                        ),
                        ChapterItem(
                            Chapter(
                              chapterImg: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg",
                              title: "Thrive on Stress",
                              description: "?????? ?????? ????????? ?????? ??????(?????????) Lesson1",
                            ),
                                (){}
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

}
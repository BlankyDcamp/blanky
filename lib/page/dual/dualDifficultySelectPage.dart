import 'package:blanky/page/commonWidget/difficultyContent.dart';
import 'package:blanky/page/commonWidget/gradientBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DualDifficultySelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        margin: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: statusBarHeight + 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 48,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: ()=>Navigator.pop(context),
                        child: Center(
                          child: SvgPicture.asset("assets/icons/icon_arrow_right.svg"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Text(
                            "CHOOSE",
                            style: TextStyle(
                              fontSize: 44,
                              fontFamily: 'Montserrat',
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Colors.black,
                            ),
                          ),
                          Text(
                            "CHOOSE",
                            style: TextStyle(
                              color: Color(0xff6997FF),
                              fontSize: 44,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "LEVEL",
                        style: TextStyle(
                          fontSize: 44,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.only(bottom: 30,top: 15),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: GradientBox(
                          content: DifficultyContent(
                            title: "EASY",
                            description: "수준 : 초1~ 초6",
                            iconPath: "assets/icons/icon_dual_easy.svg",
                          ),
                          circularRadius: 16,
                          elevation: 2,
                          onTap: (){},
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff63C7FF),Color(0xff7A63FF),],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: GradientBox(
                          content: DifficultyContent(
                            title: "NORMAL",
                            description: "수준 : 중1~ 중3",
                            iconPath: "assets/icons/icon_dual_normal.svg",
                          ),
                          circularRadius: 16,
                          elevation: 2,
                          onTap: (){},
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff7a63ff),Color(0xffd663ff),],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: GradientBox(
                          content: DifficultyContent(
                            title: "HARD",
                            description: "수준 : 고1~ 일반인",
                            iconPath: "assets/icons/icon_dual_hard.svg",
                          ),
                          circularRadius: 16,
                          elevation: 2,
                          onTap: (){},
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xffff5263),Color(0xffe55cb3),],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
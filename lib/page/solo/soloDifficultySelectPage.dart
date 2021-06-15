import 'package:blanky/page/commonWidgets/gradientBox.dart';
import 'package:flutter/material.dart';

class SoloDifficultySelectPage extends StatelessWidget {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        "Difficulty",
                        style: TextStyle(
                          fontSize: 44,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: appTheme.primaryColor,
                          shape: BoxShape.circle
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: ()=>Navigator.pop(context),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      )
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
                            content: Container(
                              width: screenSize.width,
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
                            content: Container(
                              width: screenSize.width,
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
                            content: Container(
                              width: screenSize.width,
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
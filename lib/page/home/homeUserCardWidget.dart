import 'package:blanky/model/User.dart';
import 'package:blanky/page/commonFunction/numberParser.dart';
import 'package:blanky/page/commonWidget/userProfileImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeUserCard extends StatelessWidget {

  final User? userinfo;
  HomeUserCard({this.userinfo});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);
    final double cardWidth = screenSize.width;
    return Container(
      width: cardWidth,
      margin: EdgeInsets.symmetric(horizontal: 17),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
              color: appTheme.primaryColor,
            ),
            BoxShadow(
              offset: Offset(0.0, 4.0),
              blurRadius: 40.0,
              color: appTheme.primaryColor,
            ),
          ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 9),
          child: Row(
            children: [
              /// 유저 프로필사진
              Container(
                width: 136,
                child: Center(
                  child: userinfo!=null?
                  UserProfileImage(userinfo!.profileImg,userinfo!.rank, userinfo!.totalRank):
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /// 우측 정보 Text
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "${userinfo!=null?userinfo!.nickname:"User"} ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff0E2984)
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "님의 스코어",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff6b6b6b)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${userinfo!=null?NumberParser().parseNumber(userinfo!.dualScore):"0"}",
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontFamily: 'SairaSemiCondensed',
                                    fontWeight: FontWeight.w800,
                                    color: appTheme.primaryColor,
                                    height: 1.0
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "점",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff6b6b6b)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        child: Expanded(
                          child: Divider(
                            color: appTheme.primaryColor,
                            thickness: 1,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "전체",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff545A3E)
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(
                                            text:"${userinfo!=null?NumberParser().parseNumber(userinfo!.rank):"0"}",
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: appTheme.primaryColor
                                            ),
                                          ),
                                          TextSpan(
                                            text:"등 /",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff545A3E)
                                            ),
                                          ),
                                        ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text.rich(
                                  TextSpan(
                                      children: [
                                        TextSpan(
                                          text:"${userinfo!=null?NumberParser().parseNumber(userinfo!.totalRank):"0"} ",
                                          style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: appTheme.primaryColor
                                          ),
                                        ),
                                        TextSpan(
                                          text:"명 중",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff545A3E)
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
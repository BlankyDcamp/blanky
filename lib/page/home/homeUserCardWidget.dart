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
              userinfo!=null?
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
              /// 우측 정보 Text
              Container(
                margin: EdgeInsets.only(left: 42),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ${닉네임}님의 스코어
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:"${userinfo!=null?userinfo!.nickname:"User"} ",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: appTheme.primaryColor
                            ),
                          ),
                          TextSpan(
                            text:"님의 스코어",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xff111111),
                            ),
                          ),
                        ]
                      )
                    ),
                    /// ${dualScore} 점
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text:"${userinfo!=null?NumberParser().parseNumber(userinfo!.dualScore):"0"}",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: appTheme.primaryColor
                                ),
                              ),
                              TextSpan(
                                text:" 점",
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xff383838),
                                ),
                              ),
                            ]
                        ),
                    ),
                    /// 전체 ${totalRank}명 중 ${rank}등
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text:"전체 ",
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Color(0xff5c5c5c),
                                ),
                              ),
                              TextSpan(
                                text:"${userinfo!=null?NumberParser().parseNumber(userinfo!.totalRank):"0"}",
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: appTheme.primaryColor,
                                ),
                              ),
                              TextSpan(
                                text:"명 중 ",
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Color(0xff5c5c5c),
                                ),
                              ),
                              TextSpan(
                                text:"${userinfo!=null?NumberParser().parseNumber(userinfo!.rank):"0"}",
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: appTheme.primaryColor,
                                ),
                              ),
                              TextSpan(
                                text:"등",
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Color(0xff5c5c5c),
                                ),
                              ),
                            ]
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
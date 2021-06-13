import 'package:blanky/model/User.dart';
import 'package:blanky/page/commonFunction/numberParser.dart';
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 9),
          child: Row(
            children: [
              /// 유저 프로필사진
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Color(0xffc4c4c4),
                  shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(5),
                child: Center(
                  child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffeeeeee),
                        shape: BoxShape.circle,
                        image: userinfo!=null ? DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(userinfo!.profileImg)
                        ) : null
                      ),
                    ),
                  ),
                ),
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
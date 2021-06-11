import 'package:flutter/material.dart';

/// 로그인 페이지 (실패시 회원가입 권유 다이알로그, 성공시 Home)

class LoginDialog extends StatelessWidget {
  final Function onKakaoLoginButtonTap;
  LoginDialog(this.onKakaoLoginButtonTap);

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      titlePadding: EdgeInsets.only(left: 14,right: 14,top: 18,bottom: 7),
      contentPadding: EdgeInsets.only(left: 14,right: 14,top:7, bottom: 18),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "로그인이 필요한 서비스입니다 :)",
            style: TextStyle(
              color: appTheme.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          InkWell(
            customBorder: new CircleBorder(),
              onTap: (){
                Navigator.pop(context);
              },
            child: Icon(
              Icons.close,
              color: appTheme.primaryColor,
              size: 32.0,
            ),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "퀴즈 참여를 위해서는 로그인이 필요합니다.\n로그인하시겠습니까?",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0x80151920)
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: GestureDetector(
              onTap: (){
                onKakaoLoginButtonTap();
                Navigator.pop(context);
              },
              child: Image(image: AssetImage('assets/icon_kakao_login.png')),
            ),
          ),
        ],
      ),
    );
  }
}

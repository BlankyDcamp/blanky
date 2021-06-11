
import 'package:blanky/API/API.dart';
import 'package:flutter/material.dart';

/// 회원가입 페이지 (상세정보 입력)

class RegisterDialog extends StatelessWidget {
  final Function onRegisterButtonTap;
  RegisterDialog(this.onRegisterButtonTap);

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
            "회원가입이 필요한 서비스입니다 :)",
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
                "저희 앱의 모든 활동은 회원가입이 필요합니다, 가입하시겠습니가? 취소시 화면이 종료됩니다.",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0x80151920)
                ),
              ),
            ),
          ),
          Image(image: AssetImage('assets/icon_join.png'),)
        ],
      ),
    );
  }
}

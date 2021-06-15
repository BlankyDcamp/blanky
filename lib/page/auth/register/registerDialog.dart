
import 'package:blanky/API/API.dart';
import 'package:flutter/material.dart';

/// 회원가입 페이지 (상세정보 입력)

class RegisterDialog extends StatefulWidget {
  final Function onRegisterButtonTap;
  RegisterDialog(this.onRegisterButtonTap);

  _RegisterDialogState createState() => _RegisterDialogState();
}

class _RegisterDialogState extends State<RegisterDialog> {


  bool isButtonTapped = false;

  onButtonTap() {
    widget.onRegisterButtonTap();
    setState(() {
      isButtonTapped = false;
    });
    Navigator.pop(context);
  }

  cancelTap(){
    setState(() {
      isButtonTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);

    final Decoration buttonDefaultStyle = ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color:Theme.of(context).primaryColor
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        )
    );
    final Decoration buttonTappedStyle = ShapeDecoration(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color:Theme.of(context).primaryColor
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        )
    );

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
          Container(
            margin: EdgeInsets.only(top: 11,bottom: 14),
            child: Image(image: AssetImage('assets/icons/icon_join.png'),),
          ),
          InkWell(
            onTap: () => onButtonTap(),
            onTapDown: (v){
              setState(() {
                isButtonTapped = true;
              });
            },
            onTapCancel:()=>cancelTap(),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: isButtonTapped?
              buttonTappedStyle : buttonDefaultStyle,
              child: Center(
                child: Text(
                  "회원가입",
                  style: TextStyle(
                    color: isButtonTapped?
                        Colors.yellow : Colors.black
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

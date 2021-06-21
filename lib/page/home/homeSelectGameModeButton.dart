
import 'package:flutter/material.dart';

class HomeSelectGameModeButton extends StatelessWidget {
  final String title;
  final String description;
  final Gradient boxGradient;
  final Function onClick;
  HomeSelectGameModeButton(this.title,this.description,this.boxGradient,this.onClick);

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Container(
      decoration: ShapeDecoration(
        gradient: boxGradient,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        shadows: [
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          onTap: ()=>onClick(),
          child: Container(
            margin: EdgeInsets.only(left: 14,right: 14,top:47,bottom: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.5, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(64, 0, 0, 0),
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 18,),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.5, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(64, 0, 0, 0),
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
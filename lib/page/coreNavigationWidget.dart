
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoreNavigationWidget extends StatefulWidget {
  final EdgeInsets margin;
  final int initialValue;
  final Function onButtonPressed;
  CoreNavigationWidget({required this.margin, required this.initialValue ,required this.onButtonPressed});

  _CoreNavigationWidgetState createState()=> _CoreNavigationWidgetState(initialValue);
}

class _CoreNavigationWidgetState extends State<CoreNavigationWidget> {
  final int initialValue;
  _CoreNavigationWidgetState(this.initialValue) {
   currentValue = initialValue;
  }
  int currentValue = 0;



  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Container(
      margin: widget.margin,
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: Offset(1.5, 1.5), // shadow direction: bottom right
          ),
        ],
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color:appTheme.primaryColor
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        )
      ),
      height: 56,
      child: Material(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: (){
                setState(() {
                  currentValue = 0;
                });
                widget.onButtonPressed(0);
              },
              icon: Icon(Icons.list_alt),
              color: currentValue==0?appTheme.primaryColor:Colors.black,
            ),
            IconButton(
              onPressed: (){
                setState(() {
                  currentValue = 1;
                });
                widget.onButtonPressed(1);
              },
              icon: Icon(Icons.home),
              color: currentValue==1?appTheme.primaryColor:Colors.black,
            ),
            IconButton(
              onPressed: (){
                setState(() {
                  currentValue = 2;
                });
                widget.onButtonPressed(2);
              },
              icon: Icon(Icons.person),
              color: currentValue==2?appTheme.primaryColor:Colors.black,
            ),
          ],
        ),
        color: Colors.transparent,
      ),
    );
  }
}
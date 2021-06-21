import 'package:flutter/material.dart';

class HomeBackgroundShape extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    final double circularRadius = 50.0;
    return Column(
      children: [
        Container(
          width: screenSize.width,
          height: screenSize.height/1.5,
          child: Stack(
            children: [
              Container(
                color: Colors.white,
              ),
              Container(
                decoration: BoxDecoration(
                  color: appTheme.primaryColorLight,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(circularRadius)),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: screenSize.width,
          height: screenSize.height/3,
          child: Stack(
            children: [
              Container(
                color: appTheme.primaryColorLight,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(circularRadius)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DifficultyContent extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;

  DifficultyContent({
    required this.title,
    required this.description,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Color(0xffD6FCF7),
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: SvgPicture.asset(
                iconPath,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
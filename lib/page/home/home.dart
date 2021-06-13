
import 'package:blanky/API/API.dart';
import 'package:blanky/model/User.dart';
import 'package:blanky/page/home/homeUserCardWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User? currentUser;

  @override
  void initState() {
    API().getCurrentUserInfo().then((v) {
      setState(() {
        currentUser = v;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    final double backgroundObjectWidth = screenSize.width*2;
    final double backgroundObjectHeight = screenSize.height/2;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: OverflowBox(
                minHeight: 0,
                maxHeight: backgroundObjectHeight,
                minWidth: 0,
                maxWidth: backgroundObjectWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: appTheme.primaryColorLight,
                    borderRadius: BorderRadius.all(Radius.elliptical(backgroundObjectWidth, backgroundObjectHeight)),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 31, bottom: 27),
                  child: HomeUserCard(userinfo: currentUser),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
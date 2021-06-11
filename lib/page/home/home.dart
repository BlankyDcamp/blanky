
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //TODO 오버플로우된 원형 구현하기
            Column(
              children: [
                Text("asdsd"),
              ],
            )
          ],
        )
      ),
    );
  }
}
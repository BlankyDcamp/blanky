import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class LoginWebViewPage extends StatefulWidget {
  final String url;
  LoginWebViewPage({required this.url});

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginWebViewPage> {
  @override
  void initState() {
    //TODO Login Logic
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,

    );
  }

}
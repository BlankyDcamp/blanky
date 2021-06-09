import 'dart:convert';

import 'package:blanky/UserPref/userpref.dart';
import 'package:http/http.dart' as http;

class API {
  final String address = "http://3.37.119.81:8000/api";

  Future<int> getLoginResult(String token) async {
    final http.Response response = await http.get(
      Uri.parse('$address/auth/kakao/login'),headers: {'auth':token});
    Map<String, dynamic> result = jsonDecode(response.body);
    ///발급받은 token Pref 에 저장할 것
    UserPreference().setToken(result['token']);
    /// 응답코드
    /// 200 - 로그인 성공
    /// 410 - 가입되어있지 않음
    int resultCode = int.parse(result['code']);
    return resultCode;
  }

  Future<int> signUp(String school) async {
    String token = await UserPreference().getToken();
    final http.Response response = await http.post(
        Uri.parse('$address/auth/signup'),
        headers: {'auth': token},
        body: {'school':school},
    );
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result.toString());
    int resultCode = result['code'] as int;
    print(result['code']);
    if(resultCode == 201) {
      UserPreference().setToken(result['token']);
    }
    return resultCode;
  }
}
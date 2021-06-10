import 'dart:convert';

import 'package:blanky/UserPref/userPref.dart';
import 'package:http/http.dart' as http;

const TOKEN_IS_NULL = 404;

class API {
  final String address = "http://3.37.119.81:8000/api";

  Future<bool> checkTokenValid() async {
    String? token = await UserPreference().getToken();
    if(token!=null) {
      final http.Response response = await http.get(
          Uri.parse('$address/test'),headers: {'auth':token});
      Map<String, dynamic> result = jsonDecode(response.body);
      print(result);
      int resultCode = result["code"] as int;
      if(resultCode == 200) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<int> getLoginResult(String token) async {
    final http.Response response = await http.get(
      Uri.parse('$address/auth/kakao/login'),headers: {'auth':token});
    Map<String, dynamic> result = jsonDecode(response.body);
    ///발급받은 token 을 Pref 에 저장해줌
    UserPreference().setToken(result['token']);
    /// 응답코드
    /// 200 - 로그인 성공
    /// 410 - 가입되어있지 않음
    int resultCode = int.parse(result['code']);
    return resultCode;
  }

  Future<int> signUp(String school) async {
    String? token = await UserPreference().getToken();
    if(token!=null) {
      final http.Response response = await http.post(
        Uri.parse('$address/auth/signup'),
        headers: {
          'auth': token,
          'Content-Type': "application/json"
        },
        body: jsonEncode({
          'school':school,
        }),
      );
      Map<String, dynamic> result = jsonDecode(response.body);
      if(result['code'] == 201) {
        UserPreference().setToken(result['token']);
      }
      return result['code'];
    } else {
      ///TOKEN이 없으면 404
      return TOKEN_IS_NULL;
    }
  }
}
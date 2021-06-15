import 'dart:convert';

import 'package:blanky/UserPref/userPref.dart';
import 'package:blanky/model/User.dart';
import 'package:http/http.dart' as http;

const GET_REQUEST_SUCCESS = 200;
const POST_REQUEST_SUCCESS = 201;
const DATA_NULL = 404;

class API {
  final String address = "http://3.37.119.81:8000/api";

  Future<bool> checkTokenValid() async {
    String? token = await UserPreference().getToken();
    if(token!=null) {
      //TODO: SocketException 처리
      final http.Response response = await http.get(
          Uri.parse('$address/test'),headers: {'auth':token});
      Map<String, dynamic> result = jsonDecode(response.body);
      print(result); //TODO 로그지우기
      int resultCode;
      if(result['code'].runtimeType != int) {
        resultCode = int.parse(result['code']);
      } else {
        resultCode = result['code'];
      }
      if(resultCode == GET_REQUEST_SUCCESS) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<int> getLoginResult(String token) async {
    //TODO: SocketException 처리
    final http.Response response = await http.get(
      Uri.parse('$address/auth/kakao/login'),headers: {'auth':token});
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result); //TODO 로그지우기
    ///발급받은 token 을 Pref 에 저장해줌
    UserPreference().setToken(result['token']);
    /// 응답코드
    /// 200 - 로그인 성공
    /// 410 - 가입되어있지 않음
    int resultCode;
    if(result['code'].runtimeType != int) {
      resultCode = int.parse(result['code']);
    } else {
      resultCode = result['code'];
    }
    return resultCode;
  }

  Future<int> signUp(String school) async {
    String? token = await UserPreference().getToken();
    if(token!=null) {
      //TODO: SocketException 처리
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
      print(result); //TODO 로그지우기
      int resultCode;
      if(result['code'].runtimeType != int) {
        resultCode = int.parse(result['code']);
      } else {
        resultCode = result['code'];
      }
      if(resultCode == POST_REQUEST_SUCCESS) {
        UserPreference().setToken(result['token']);
      }
      return resultCode;
    } else {
      ///TOKEN이 없으면 404
      return DATA_NULL;
    }
  }

  ///현재 토큰 이용하여
  ///유저 정보 조회
  Future<User?> getCurrentUserInfo() async {
    String? token = await UserPreference().getToken();
    if(token!=null) {
      //TODO: SocketException 처리
      final http.Response response = await http.get(
        Uri.parse('$address/user'),
        headers: {'auth': token,},
      );
      Map<String, dynamic> result = jsonDecode(response.body);
      print(result); //TODO 로그지우기
      int resultCode;
      if(result['code'].runtimeType != int) {
        resultCode = int.parse(result['code']);
      } else {
        resultCode = result['code'];
      }
      if(resultCode == GET_REQUEST_SUCCESS) {
        Map<String, dynamic> data = Map<String, dynamic>.from(result['data']);
        return User.fromJson(data);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
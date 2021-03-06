import 'dart:convert';

import 'package:blanky/UserPref/userPref.dart';
import 'package:blanky/model/User.dart';
import 'package:http/http.dart' as http;

const GET_REQUEST_SUCCESS = 200;
const POST_REQUEST_SUCCESS = 201;
const DATA_NULL = 404;
const CODE_PARSE_FAILED=1000;
const SOCKET_EXCEPTION=1001;

class API {
  final String address = "http://3.37.119.81:8000/api";

  Future<bool> checkTokenValid() async {
    String? token = await UserPreference().getToken();
    if(token!=null) {
      try{
        final http.Response response = await http.get(
            Uri.parse('$address/test'),headers: {'auth':token});
        Map<String, dynamic> result = jsonDecode(response.body);
        int resultCode;
        if(result['code'].runtimeType != int) {
          resultCode = int.tryParse(result['code'])??CODE_PARSE_FAILED;
        } else {
          resultCode = result['code'];
        }
        if(resultCode == GET_REQUEST_SUCCESS) {
          return true; /// 토큰 인증 성공
        } else {
          return false; /// 토큰 인증 실패
        }
      }catch(e){
        return false; ///Socket Exception
      }
    } else {
      return false;
    }
  }

  Future<int> getLoginResult(String token) async {
    try {
      final http.Response response = await http.get(
          Uri.parse('$address/auth/kakao/login'),headers: {'auth':token});
      Map<String, dynamic> result = jsonDecode(response.body);
      ///발급받은 token 을 Pref 에 저장해줌
      UserPreference().setToken(result['token']);
      /// 응답코드
      /// 200 - 로그인 성공
      /// 410 - 가입되어있지 않음
      /// 1000 - code 파싱 실패
      int resultCode;
      if(result['code'].runtimeType != int) {
        resultCode = int.tryParse(result['code'])??CODE_PARSE_FAILED;
      } else {
        resultCode = result['code'];
      }
      return resultCode; /// 결과 코드 반환
    } catch (e) {
      return SOCKET_EXCEPTION; /// Socket Exception
    }
  }

  Future<int> signUp(String school) async {
    String? token = await UserPreference().getToken();
    if(token!=null) {
      try {
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
        int resultCode;
        if(result['code'].runtimeType != int) {
          resultCode = int.tryParse(result['code'])??CODE_PARSE_FAILED;
        } else {
          resultCode = result['code'];
        }
        if(resultCode == POST_REQUEST_SUCCESS) {
          UserPreference().setToken(result['token']);
        }
        return resultCode;
      } catch(e) {
        return SOCKET_EXCEPTION; /// Socket Exception
      }
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
      try {
        final http.Response response = await http.get(
          Uri.parse('$address/user'),
          headers: {'auth': token,},
        );
        Map<String, dynamic> result = jsonDecode(response.body);
        int resultCode;
        if(result['code'].runtimeType != int) {
          resultCode = int.tryParse(result['code'])??CODE_PARSE_FAILED;
        } else {
          resultCode = result['code'];
        }
        if(resultCode == GET_REQUEST_SUCCESS) {
          Map<String, dynamic> data = Map<String, dynamic>.from(result['data']);
          return User.fromJson(data);
        } else {
          return null;
        }
      } catch (e) {
        return null; /// Socket Exception
      }
    } else {
      return null;
    }
  }

  Future<int> updateUserInfo(
      String nickname,
      String email,
      String school,
      String description,
      ) async {
    String? token = await UserPreference().getToken();
    if(token != null) {
      try{
        final http.Response response = await http.put(
            Uri.parse("$address/user"),
            headers: {'auth': token,},
            body: {
              'nickname' : nickname,
              'email' : email,
              'school' : school,
              'description' : description
            }
        );
        Map<String, dynamic> result = jsonDecode(response.body);
        int resultCode;
        if(result['code'].runtimeType != int) {
          resultCode = int.tryParse(result['code'])??CODE_PARSE_FAILED;
        } else {
          resultCode = result['code'];
        }
        return resultCode;
      } catch(e) {
        return SOCKET_EXCEPTION;
      }
    } else {
      return DATA_NULL;
    }
  }

  Future<int> updateUserImage(String image) async {
    String? token = await UserPreference().getToken();
    if(token != null) {
      try{
        final http.Response response = await http.put(
          Uri.parse("$address/user/profile"),
          headers: {'auth': token,},
          body: {'imgFile' : image}
        );
        Map<String, dynamic> result = jsonDecode(response.body);
        int resultCode;
        if(result['code'].runtimeType != int) {
          resultCode = int.tryParse(result['code'])??CODE_PARSE_FAILED;
        } else {
          resultCode = result['code'];
        }
        return resultCode;
      } catch(e) {
        return SOCKET_EXCEPTION;
      }
    } else {
      return DATA_NULL;
    }
  }
}
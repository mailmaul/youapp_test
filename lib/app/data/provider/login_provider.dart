import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Response> auth(data) async {
    var myHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return get('http://techtest.youapp.ai/api/login', headers: myHeader);
  }
}

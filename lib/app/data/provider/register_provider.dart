import 'package:get/get.dart';

class RegisterProvider extends GetConnect {
  Future<Response> auth(var data) {
    var myHeader = {
      'Content-Type': 'application/json',
    };
    return post('http://techtest.youapp.ai/api/register', data,
        headers: myHeader);
  }
}

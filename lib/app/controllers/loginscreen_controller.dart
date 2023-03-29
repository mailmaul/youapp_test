import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:youapp_test/app/data/provider/login_provider.dart';
import 'package:http/http.dart' as http;

import '../ui/pages/profilescreen_page/profilescreen_page.dart';

class LoginScreenController extends GetxController {
  var text = ''.obs; // state variable to hold the text entered by the user

  void setText(String value) {
    text.value =
        value; // update the state variable with the text entered by the user
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final apiClient = GetConnect();

  void auth() async {
    final url =
        'http://techtest.youapp.ai/api/login?email=${emailController.text}&password=${passwordController.text}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Login success
        final responseData = json.decode(response.body);
        // Do something with the response data
        print(response.body);

        Get.snackbar('Info', ('${responseData['message']}'),
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.off(ProfilescreenPage());
      } else {
        // Login failed
        final responseData = json.decode(response.body);
        Get.snackbar('Login Failed', responseData['message']);
      }
    } catch (error) {
      Get.snackbar('Error', 'Something went wrong. Please try again later.');
    }
  }
}

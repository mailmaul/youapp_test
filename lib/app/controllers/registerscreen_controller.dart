import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youapp_test/app/data/provider/register_provider.dart';
import 'package:youapp_test/app/ui/pages/profilescreen_page/profilescreen_page.dart';

class RegisterscreenController extends GetxController {
  var text = ''.obs; // state variable to hold the text entered by the user

  void setText(String value) {
    text.value =
        value; // update the state variable with the text entered by the user
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register() {
    String email = emailController.text;
    String password = passwordController.text;
    String name = usernameController.text;
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      Get.snackbar("Error", "Please fill all field",
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      var data = {
        "email": email,
        'password': password,
        'name': name,
      };
      RegisterProvider().auth(data).then((value) {
        if (value.statusCode == 200) {
          Get.snackbar(
            "Succes",
            "You are Login",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.off(ProfilescreenPage());
        } else {
          Get.snackbar(
            "Error",
            "Please try again",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      });
    }
  }
}

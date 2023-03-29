
import 'package:get/get.dart';
import '../controllers/loginscreen_controller.dart';


class LoginScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
  }
}
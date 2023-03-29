
import 'package:get/get.dart';
import '../controllers/registerscreen_controller.dart';


class RegisterscreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterscreenController>(() => RegisterscreenController());
  }
}
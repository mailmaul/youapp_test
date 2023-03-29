
import 'package:get/get.dart';
import '../controllers/addinterest_controller.dart';


class AddinterestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddinterestController>(() => AddinterestController());
  }
}
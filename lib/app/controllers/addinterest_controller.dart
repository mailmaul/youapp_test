import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddinterestController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();

  RxString savedValue = ''.obs;
  RxList<String> savedValues = <String>[].obs;
  RxList<String> save = <String>[].obs;

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  void saveValue() {
    savedValues.add(textEditingController.text);
    textEditingController.clear();
  }

  void deleteValue(int index) {
    savedValues.removeAt(index);
  }
}

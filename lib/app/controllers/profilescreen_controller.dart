import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfilescreenController extends GetxController {
  // It is mandatory initialize with one value from listType
  String? selectedValue;

  var gender = <String>['Male', 'Female'];
  var Gender;

  void onSelected(String value) {
    selectedValue = value;

    update();

    changeGender(selectedValue);
  }

  changeGender(String? selectedGender) {
    switch (selectedGender) {
      case 'Male':
        Get.updateLocale(const Locale('en_US'));
        isTapGender = 1.obs;
        Gender = 'Male';
        break;
      case 'Female':
        Gender = 'Female';
        Get.updateLocale(const Locale('en_US'));
        break;
    }
  }

  var selectedDate = DateTime.now().obs;

  var isTapCalender = true.obs;

  RxInt isTapProfile = 0.obs;
  final isTapAbout = 0.obs;
  RxInt isTapGender = 0.obs;
  final name = ''.obs;
  final height = ''.obs;
  final weight = ''.obs;
  final horos = ''.obs;
  final zodiac = ''.obs;
  final birth = ''.obs;

  @override
  void onInit() {
    name.value = GetStorage().read('name') ?? '';
    height.value = GetStorage().read('height') ?? '';
    weight.value = GetStorage().read('weight') ?? '';
    horos.value = GetStorage().read('horos') ?? '';
    zodiac.value = GetStorage().read('zodiac') ?? '';
    birth.value = GetStorage().read('birth') ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    GetStorage().write('name', name.value);
    GetStorage().write('height', height.value);
    GetStorage().write('weight', weight.value);
    GetStorage().write('horos', horos.value);
    GetStorage().write('zodiac', zodiac.value);
    GetStorage().write('birth', name.value);
    super.onClose();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1800),
        lastDate: DateTime(2024),
        // initialEntryMode: DatePickerEntryMode.calendarOnly,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select DOB',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      isTapCalender.value = false;
      // Get.updateLocale(Locale('en_US'));
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isBefore(DateTime.now().add(Duration(days: 0))))) {
      return true;
    }
    return false;
  }

  var isLoading = false.obs;
  var imageURL = '';

  // ignore: prefer_typing_uninitialized_variables
  var selectedImagePath;
  var addimage = false.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    final appDocDir = await getApplicationDocumentsDirectory();
    final newDir = Directory('${appDocDir.path}/storage/product_images');
    final newPath = '${newDir.path}/image.png';

    if (!await newDir.exists()) {
      await newDir.create(recursive: true);
    }

    if (pickedFile != null) {
      isTapProfile = 1.obs;
      final oldFile = File(pickedFile.path);
      selectedImagePath = await oldFile.copy(newPath);
      selectedImagePath = File(selectedImagePath.path);
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}

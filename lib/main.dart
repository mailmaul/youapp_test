import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:youapp_test/app/ui/pages/addinterest_page/addinterest_page.dart';
import 'package:youapp_test/app/ui/pages/loginscreen_page/loginscreen_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inter'),
      home: AddinterestPage(),
    ),
  );
}

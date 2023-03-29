import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:youapp_test/app/ui/pages/loginscreen_page/loginscreen_page.dart';
import '../../../controllers/registerscreen_controller.dart';

class RegisterscreenPage extends GetView<RegisterscreenController> {
  @override
  Widget build(BuildContext context) {
    //a boolean value
    var confirmpasswordController = TextEditingController();
    var isObsecure = true.obs;
    var isObsecure2 = true.obs;

    final RegisterscreenController controller =
        Get.put(RegisterscreenController());

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromRGBO(31, 66, 71, 1),
              Color.fromRGBO(13, 29, 35, 1),
              Color.fromRGBO(9, 20, 26, 1)
            ],
            center: Alignment.topRight,
            radius: 2.5,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, top: 83, right: 10),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.only(left: 41),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 25),
                child: TextFormField(
                  onChanged: (text) {
                    controller.setText(text);
                  },
                  controller: controller.emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.06),
                      hintText: ("Enter Email"),
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.4), fontSize: 13)),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 25),
                child: TextFormField(
                  onChanged: (text) {
                    controller.setText(text);
                  },
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.06),
                      hintText: ("Enter Username"),
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.4), fontSize: 13)),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 25),
                child: Obx(
                  () => TextFormField(
                    onChanged: (text) {
                      controller.setText(text);
                    },
                    obscureText: isObsecure.value,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                        suffixIcon: Obx(
                          () => GestureDetector(
                            onTap: () {
                              isObsecure.value = !isObsecure.value;
                            },
                            child: Icon(
                              isObsecure.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.06),
                        hintText: ("Enter Password"),
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 13)),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 25),
                child: Obx(
                  () => TextFormField(
                    onChanged: (text) {
                      controller.setText(text);
                    },
                    obscureText: isObsecure2.value,
                    controller: confirmpasswordController,
                    decoration: InputDecoration(
                        suffixIcon: Obx(
                          () => GestureDetector(
                            onTap: () {
                              isObsecure2.value = !isObsecure2.value;
                            },
                            child: Icon(
                              isObsecure2.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.06),
                        hintText: ("Confirm Password"),
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 13)),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 25),
                child: Obx(
                  () => GestureDetector(
                    onTap: controller.text.value.isEmpty
                        ? null
                        : () {
                            controller.register();
                          },
                    child: Container(
                      height: 48,
                      decoration: controller.text.value.isEmpty
                          ? const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(98, 205, 203, 0.5),
                                  Color.fromRGBO(69, 153, 219, 0.5),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(9),
                              ),
                              boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(98, 205, 203, 0.5),
                                    blurRadius: 15,
                                    offset: Offset(0, 12),
                                  )
                                ])
                          : const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(98, 205, 203, 1),
                                  Color.fromRGBO(69, 153, 219, 1),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(9),
                              ),
                              boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(98, 205, 203, 0.5),
                                    blurRadius: 15,
                                    offset: Offset(0, 12),
                                  )
                                ]),
                      child: Center(
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            letterSpacing: 0.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 52),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have account?",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(const LoginScreenPage());
                      },
                      child: GradientText("Login here",
                          gradientType: GradientType.linear,
                          gradientDirection: GradientDirection.ltr,
                          colors: [
                            Color.fromRGBO(148, 120, 62, 1),
                            Color.fromRGBO(243, 237, 166, 1),
                            Color.fromRGBO(248, 250, 229, 1),
                            Color.fromRGBO(255, 226, 190, 1),
                            Color.fromRGBO(213, 190, 136, 1),
                            Color.fromRGBO(248, 250, 229, 1),
                            Color.fromRGBO(213, 190, 136, 1),
                          ])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

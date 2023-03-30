import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:youapp_test/app/ui/pages/profilescreen_page/profilescreen_page.dart';
import '../../../controllers/addinterest_controller.dart';

class AddinterestPage extends GetView<AddinterestController> {
  @override
  final AddinterestController controller = Get.put(AddinterestController());

  AddinterestPage({super.key});
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header_Tab(),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 73),
              child: GradientText("Tell everyone about yourself",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ltr,
                  colors: const [
                    Color.fromRGBO(148, 120, 62, 1),
                    Color.fromRGBO(243, 237, 166, 1),
                    Color.fromRGBO(248, 250, 229, 1),
                    Color.fromRGBO(255, 226, 190, 1),
                    Color.fromRGBO(213, 190, 136, 1),
                    Color.fromRGBO(248, 250, 229, 1),
                    Color.fromRGBO(213, 190, 136, 1),
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35, top: 12),
              child: Text(
                "What interest you?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            InputInterest_Tab(controller: controller),
          ],
        ),
      ),
    );
  }
}

class InputInterest_Tab extends StatelessWidget {
  const InputInterest_Tab({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AddinterestController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 35, right: 27),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 0.06),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Obx(
          () => Padding(
              padding: const EdgeInsets.only(
                  left: 17, right: 27, top: 8, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Wrap(
                        spacing: 4, // define the spacing between items
                        runSpacing: 8.0, // define the spacing between rows
                        children: <Widget>[
                          ...List.generate(
                            controller.savedValues.length,
                            (index) {
                              final value = controller.savedValues[index];
                              return Container(
                                height: 31,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      value,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                      onPressed: () {
                                        controller.deleteValue(index);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Container(
                            width: 30,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15, left: 2)),
                              onFieldSubmitted: (value) {
                                controller.saveValue();
                              },
                              controller: controller.textEditingController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              textAlignVertical: TextAlignVertical.top,
                            ),
                          )
                        ]),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class Header_Tab extends StatelessWidget {
  const Header_Tab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, top: 83),
          child: GestureDetector(
            onTap: () => Get.back(),
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
        Padding(
          padding: const EdgeInsets.only(top: 83, right: 26),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(ProfilescreenPage());
                },
                child: GradientText("Save",
                    gradientType: GradientType.linear,
                    gradientDirection: GradientDirection.ltr,
                    colors: [
                      Color.fromRGBO(171, 255, 253, 1),
                      Color.fromRGBO(170, 218, 255, 1),
                      Color.fromRGBO(69, 153, 219, 1),
                    ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}

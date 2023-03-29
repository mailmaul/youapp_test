import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 83),
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
                Padding(
                  padding: const EdgeInsets.only(top: 83, right: 26),
                  child: Row(
                    children: [
                      GradientText("Save",
                          gradientType: GradientType.linear,
                          gradientDirection: GradientDirection.ltr,
                          colors: [
                            Color.fromRGBO(171, 255, 253, 1),
                            Color.fromRGBO(170, 218, 255, 1),
                            Color.fromRGBO(69, 153, 219, 1),
                          ])
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 73),
              child: GradientText("Tell everyone about yourself",
                  style: TextStyle(
                    fontSize: 16,
                  ),
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
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 12),
              child: Text(
                "What interest you?",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 35, right: 27),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 0.06),
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints:
                    const BoxConstraints.tightFor(width: double.infinity),
                child: Obx(
                  () => Padding(
                      padding: const EdgeInsets.only(
                          left: 17, right: 27, top: 8, bottom: 10),
                      child: Wrap(
                        spacing: 4, // define the spacing between items
                        runSpacing: 8.0, // define the spacing between rows
                        children: List.generate(controller.savedValues.length,
                            (index) {
                          final value = controller.savedValues[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            width: 77, // define the width of each item
                            height: 31, // define the height of each item

                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
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
                        }),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Expanded(
//                       child: TextFormField(
//                         onFieldSubmitted: (value) {
//                           controller.saveValue();
//                         },
//                         controller: controller.textEditingController,
//                         // onChanged: (value) => _controller.name.value = value,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.transparent,
//                             ),
//                             borderRadius: BorderRadius.circular(9),
//                           ),
//                           filled: true,
//                           fillColor: const Color.fromRGBO(217, 217, 217, 0.06),
//                         ),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ),
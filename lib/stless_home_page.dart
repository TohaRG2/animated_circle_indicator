import 'package:canvas_1/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'circle_progress.dart';

class HomePage extends GetView<HomePageController> {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Obx(()
              => CustomPaint(
                foregroundPainter: CircleProgress(controller.value),
                child: Container(
                  width: 300,
                  height: 300,
                  child: GestureDetector(
                      onTap: () {
                        if (controller.value == 0) {
                          controller.animationController.forward();
                        } else {
                          controller.animationController.reverse();
                        }
                      },
                      child: Center(
                          child: Text('${controller.value.toInt()}', style: TextStyle(fontSize: 50))
                      )
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

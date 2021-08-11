import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController
    with SingleGetTickerProviderMixin {
  final Duration duration = const Duration(milliseconds: 3000);

  late AnimationController animationController;
  late Animation _animation;

  RxDouble _value = 0.0.obs;
  double get value => _value.value;

  @override
  void onInit() {
    super.onInit();
    print("HomePageController onInit");
    animationController = AnimationController(vsync: this, duration: duration);
  }

  Future<void> initAnimationController() async {
    print("HomePageController initAnimationController");
    animationController = AnimationController(vsync: this, duration: duration);
    _animation = Tween<double>(begin: 0, end: 100).animate(animationController)
    ..addListener(() {
      _value.value = _animation.value;
    });
  }

}
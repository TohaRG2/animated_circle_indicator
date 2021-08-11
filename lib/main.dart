import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_controller.dart';
import 'my_home_page.dart';
import 'stless_home_page.dart';

void main() async{
  final controller = Get.put(HomePageController());
  await controller.initAnimationController();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Circle Progress Home Page'),       // Stateless animated widget with using GetX Controller
      // home: MyHomePage(title: 'Circle Progress Home Page'),  // same Stateful animated widget
    );
  }
}



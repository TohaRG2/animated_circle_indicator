import 'package:flutter/material.dart';

import 'circle_progress.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    Offset a;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: CustomPaint(
              foregroundPainter: CircleProgress(_animation.value),
              child: Container(
                width: 300,
                height: 300,
                child: GestureDetector(
                    onTap: () {
                      if (_animation.value == 0) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                    },
                    child: Center(
                        child: Text('${_animation.value.toInt()}', style: TextStyle(fontSize: 50))
                    )
                ),
              ),
            ),
          )),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    animation = new Tween(
      begin: 0.0,
      end: 300.0,
    ).animate(controller)
      ..addListener(() {
        setState(() {
          // print(123);
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

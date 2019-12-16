import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return new Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with TickerProviderStateMixin {
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
    final CurvedAnimation curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
    animation = new Tween(
      begin: 0.0,
      end: 300.0,
    ).animate(curve);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      child: LogoWidget(),
      animation: animation,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

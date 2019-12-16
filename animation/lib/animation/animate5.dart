import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  static final _opacticyTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacticyTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          width: _sizeTween.evaluate(animation),
          height: _sizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),
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
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(
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

import 'package:flutter/material.dart';
import './swipe_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swip Card App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: SwipePage(),
    );
  }
}
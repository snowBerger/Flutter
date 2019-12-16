import 'package:flutter/material.dart';
import './card_draggable.dart';
import './card_aligment.dart';

class SwipePage extends StatefulWidget {
  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CardAligment(context),
    );
  }
}
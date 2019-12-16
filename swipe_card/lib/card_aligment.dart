import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math';

List<Alignment> cardsAlign = [
  Alignment(0.0, 0.25),
  Alignment(0.0, 0.14),
  Alignment(0.0, 0.0)
];
List<Size> cardsSize = List(3);

class CardProfile extends StatelessWidget {
  CardProfile(this.cardNum);

  final int cardNum;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(
          cardNum.toString(),
          style: TextStyle(
            fontSize: 60.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CardsAnimation {
  static Animation<Alignment> backCardAlign(AnimationController parent) {
    return AlignmentTween(
      begin: cardsAlign[0],
      end: cardsAlign[1],
    ).animate(CurvedAnimation(
      parent: parent,
      curve: Interval(0.4, 0.7, curve: Curves.easeIn),
    ));
  }

  static Animation<Size> backCardSize(AnimationController parent) {
    return SizeTween(
      begin: cardsSize[2],
      end: cardsSize[1],
    ).animate(CurvedAnimation(
      parent: parent,
      curve: Interval(0.4, 0.7, curve: Curves.easeIn),
    ));
  }

  static Animation<Alignment> middleCardAlign(AnimationController parent) {
    return AlignmentTween(
      begin: cardsAlign[1],
      end: cardsAlign[2],
    ).animate(CurvedAnimation(
      parent: parent,
      curve: Interval(0.2, 0.5, curve: Curves.easeIn),
    ));
  }

  static Animation<Size> middleCardSize(AnimationController parent) {
    return SizeTween(
      begin: cardsSize[1],
      end: cardsSize[0],
    ).animate(CurvedAnimation(
      parent: parent,
      curve: Interval(0.2, 0.5, curve: Curves.easeIn),
    ));
  }

  static Animation<Alignment> frontCardAlign(
      AnimationController parent, Alignment beginAlign) {
    return AlignmentTween(
      begin: beginAlign,
      end: Alignment(
          beginAlign.x > 0 ? beginAlign.x + 30.0 : beginAlign.x - 30.0, 0.0),
    ).animate(CurvedAnimation(
      parent: parent,
      curve: Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
  }
}

class CardAligment extends StatefulWidget {
  CardAligment(BuildContext context) {
    cardsSize[0] = Size(MediaQuery.of(context).size.width * 0.9,
        MediaQuery.of(context).size.height * 0.6);
    cardsSize[1] = Size(MediaQuery.of(context).size.width * 0.85,
        MediaQuery.of(context).size.height * 0.55);
    cardsSize[2] = Size(MediaQuery.of(context).size.width * 0.8,
        MediaQuery.of(context).size.height * 0.5);
  }

  @override
  _CardAligmentState createState() => _CardAligmentState();
}

class _CardAligmentState extends State<CardAligment>
    with SingleTickerProviderStateMixin {
  int cardsCounter = 0;
  List<CardProfile> cards = [];

  final Alignment defaultFrontCardAlign = Alignment(0.0, 0.0);
  Alignment frontCardAlign;
  double frontCardRot;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (cardsCounter = 0; cardsCounter < 3; cardsCounter++) {
      cards.add(CardProfile(cardsCounter));
    }

    frontCardAlign = cardsAlign[2];
    frontCardRot = 0.0;

    controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) changeCardsOrder();
      });
  }

  void changeCardsOrder() {
    // Swap cards (back card becomes the middle card; middle card becomes the front card, front card becomes a new bottom card)
    var temp = cards[0];
    cards[0] = cards[1];
    cards[1] = cards[2];
    cards[2] = temp;

    cards[2] = CardProfile(cardsCounter);
    cardsCounter++;

    frontCardAlign = defaultFrontCardAlign;
    frontCardRot = 0.0;
  }

  void animatedCards() {
    controller.stop();
    controller.value = 0.0;
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // back card
        Align(
          alignment: controller.status == AnimationStatus.forward
              ? CardsAnimation.backCardAlign(controller).value
              : cardsAlign[0],
          child: SizedBox.fromSize(
            size: controller.status == AnimationStatus.forward
                ? CardsAnimation.backCardSize(controller).value
                : cardsSize[2],
            child: cards[2],
          ),
        ),
        // middle card
        Align(
          alignment: controller.status == AnimationStatus.forward
              ? CardsAnimation.middleCardAlign(controller).value
              : cardsAlign[1],
          child: SizedBox.fromSize(
            size: controller.status == AnimationStatus.forward
                ? CardsAnimation.middleCardSize(controller).value
                : cardsSize[1],
            child: cards[1],
          ),
        ),
        // front card
        Align(
          alignment: controller.status == AnimationStatus.forward
              ? CardsAnimation.frontCardAlign(controller, frontCardAlign).value
              : frontCardAlign,
          child: Transform.rotate(
            angle: (pi / 180.0) * frontCardRot,
            child: SizedBox.fromSize(
              size: cardsSize[0],
              child: cards[0],
            ),
          ),
        ),
        controller.status == AnimationStatus.forward
            ? Container()
            : SizedBox.expand(
                child: GestureDetector(
                  // 拖动第一个卡片
                  onPanUpdate: (DragUpdateDetails details) {
                    print('update$details');
                    setState(() {
                      frontCardAlign = Alignment(
                        frontCardAlign.x +
                            20 *
                                details.delta.dx /
                                MediaQuery.of(context).size.width,
                        frontCardAlign.y +
                            20 *
                                details.delta.dy /
                                MediaQuery.of(context).size.height,
                      );
                      frontCardRot = frontCardAlign.x;
                    });
                  },
                  // 释放第一个卡片
                  onPanEnd: (_) {
                    print('end');
                    if (frontCardAlign.x > 3.0 || frontCardAlign.x < -3.0)
                      animatedCards();
                    else {
                      setState(() {
                        frontCardAlign = defaultFrontCardAlign;
                        frontCardRot = 0.0;
                      });
                    }
                  },
                ),
              ),
      ],
    );
  }
}

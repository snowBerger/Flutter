import 'package:flutter/material.dart';

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

class CardDraggable extends StatefulWidget {
  @override
  _CardDraggableState createState() => _CardDraggableState();
}

class _CardDraggableState extends State<CardDraggable> {
  bool dragOverTarget = false;
  List<CardProfile> cards = [];
  int cardsCounter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (cardsCounter = 0; cardsCounter < 3; cardsCounter++) {
      cards.add(CardProfile(cardsCounter));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            dragTarget(),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            dragTarget(),
          ],
        ),
        // back card
        Align(
          alignment: Alignment(0.0, 0.25),
          child: IgnorePointer(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              child: cards[2],
            ),
          ),
        ),
        // middle card
        Align(
          alignment: Alignment(0.0, 0.14),
          child: IgnorePointer(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.55,
              child: cards[1],
            ),
          ),
        ),
        // front card
        Align(
          alignment: Alignment(0.0, 0.0),
          child: Draggable(
            feedback: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              child: cards[0],
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              child: cards[0],
            ),
            childWhenDragging: Container(),
          ),
        ),
      ],
    );
  }

  void changeCardsOrder() {
    setState(() {
      // Swap cards
      var temp = cards[0];
      cards[0] = cards[1];
      cards[1] = cards[2];
      cards[2] = temp;

      cards[2] = new CardProfile(cardsCounter);
      cardsCounter++;
    });
  }

  Widget dragTarget() {
    return Flexible(
      flex: 1,
      child: DragTarget(
        builder: (_, __, ___) {
          return Container();
        },
        onWillAccept: (_) {
          setState(() => dragOverTarget = true);
          return true;
        },
        onAccept: (_) {
          changeCardsOrder();
          setState(() => dragOverTarget = false);
        },
        onLeave: (_) {
          setState(() => dragOverTarget = false);
        },
      ),
    );
  }
}

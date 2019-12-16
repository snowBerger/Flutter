import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: const LinearGradient(
          begin: const Alignment(0.0, -1.0),
          end: const Alignment(0.0, 0.6),
          colors: [
            Colors.blueAccent,
            Colors.blue
          ]
        )
      ),
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // new Image.asset("images/weather_bg.jpg", fit: BoxFit.fitHeight),
          new Column(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Text(
                    '未时',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    )
                  ),
                  new Text(
                    '午后和风',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    )
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    '21 .  空气质量优',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    )
                  ),
                  
                ],
              ),
              new Text(
                '23° 多云',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80.0,
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
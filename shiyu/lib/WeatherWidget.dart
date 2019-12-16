import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'WeatherData.dart';

class WeatherWidget extends StatefulWidget{
  final cityName;

  WeatherWidget(this.cityName);

  @override
  State<StatefulWidget> createState () {
    // TODO: implement createState
    return new WeatherState(this.cityName);
  }
}

class WeatherState extends State<WeatherWidget> {

  String cityName;

  WeatherData weather = WeatherData.empty();

  WeatherState (String cityName) {
    this.cityName = cityName;
    _getWeather();
  }

  void _getWeather () async {
    WeatherData data = await _fetchWeather();
    setState(() {
      weather = data;
    });
  }

  Future<WeatherData> _fetchWeather () async {
    final res = await http.get('https://free-api.heweather.com/s6/weather/now?location=' + this.cityName + '&key=c38be5a5412b4386ae140ff646b336f4');
    if (res.statusCode == 200) {
      return WeatherData.fromJson(json.decode(res.body));
    } else {
      return WeatherData.empty();
    }
  }

  @override
  Widget build (BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset("images/weather_bg.jpg", fit: BoxFit.fitHeight),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 40.0),
                child: new Text(
                  this.cityName,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              new Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 100.0),
                child: new Column(
                  children: <Widget>[
                    new Text(
                      weather?.tmp,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 80.0,
                      )
                    ),
                    new Text(
                      weather?.cond,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                      )
                    ),
                    new Text(
                      weather?.hum,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      )
                    )
                  ],
                )
              )
            ],
          )
        ],
      )
    );
  }
}

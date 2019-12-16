import 'package:flutter/material.dart';

class Weather {
  const Weather({
    @required this.week,
    @required this.date,
    @required this.weather,
    @required this.minTemperature,
    @required this.maxTemperature,
  });

  final String week;
  final String date;
  final String weather;
  final int minTemperature;
  final int maxTemperature;
}

class WeatherData {
  const WeatherData({
    this.weathers,
  });

  final List<Weather> weathers;

  static List<Weather> mockWeathers = [
    const Weather(
      week: '星期五',
      date: '四月十九',
      weather: '暴雨',
      minTemperature: 21,
      maxTemperature: 24,
    ),
    const Weather(
      week: '星期六',
      date: '四月十九',
      weather: '多云',
      minTemperature: 18,
      maxTemperature: 21,
    ),
    const Weather(
      week: '星期日',
      date: '四月二十',
      weather: '晴',
      minTemperature: 24,
      maxTemperature: 30,
    ),
    const Weather(
      week: '星期一',
      date: '四月二一',
      weather: '小雪',
      minTemperature: 7,
      maxTemperature: 11,
    ),
    const Weather(
      week: '星期二',
      date: '四月二二',
      weather: '小雨',
      minTemperature: 14,
      maxTemperature: 21,
    ),
    const Weather(
      week: '星期三',
      date: '四月二三',
      weather: '阵雨',
      minTemperature: 11,
      maxTemperature: 21,
    ),
  ];

  static mock() {
    return WeatherData(
      weathers: mockWeathers,
    );
  }
}

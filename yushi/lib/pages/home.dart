import 'package:flutter/material.dart';
import '../constants.dart' show AppColors, Constants, AppStyles;
import '../components/predict_weather.dart';
import '../modal/weather.dart' show Weather, WeatherData;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Weather> weathers = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.AppColor),
      appBar: AppBar(
        elevation: 0.0,
        title: Column(
          children: <Widget>[
            Text(
              '民乐',
              style: AppStyles.TitleStyle,
            ),
            Text(
              '14:15',
              style: AppStyles.SubTitleStyle,
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 24.0),
            child: Icon(
              IconData(
                0xe600,
                fontFamily: Constants.IconFontFamily,
              ),
              size: 24.0,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Text(
                    '未时',
                    style: AppStyles.ContentStyle,
                  ),
                  Text(
                    '午后和风',
                    style: AppStyles.ContentStyle,
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Text(
                    '64 空气质量良',
                    style: AppStyles.ContentStyle2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        margin: EdgeInsets.only(top: 60.0),
                        child: Text(
                          '一日看尽长安花',
                          style: AppStyles.ContentStyle2,
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        width: 50.0,
                        child: Text(
                          '春风得意马蹄疾',
                          style: AppStyles.ContentStyle2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '19° ',
                  style: AppStyles.ContentStyle3,
                ),
                Text(
                  '多云',
                  style: AppStyles.ContentStyle3,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  child: Text(
                    '今日',
                    style: AppStyles.ContentStyle2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 80.0,
                    vertical: 0.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '多云',
                        style: AppStyles.ContentStyle,
                      ),
                      Text(
                        '6-19度',
                        style: AppStyles.ContentStyle,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '风向正北',
                      style: AppStyles.ContentStyle,
                    ),
                    Text(
                      '风力3级',
                      style: AppStyles.ContentStyle,
                    ),
                  ],
                )
              ],
            ),
            PredictWeather(weathers: weathers),
            Container(
              margin: EdgeInsets.only(top: 100.0, bottom: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '且将新火试新茶',
                    style: AppStyles.ContentStyle2,
                  ),
                  Text(
                    '诗酒趁年华',
                    style: AppStyles.ContentStyle2,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

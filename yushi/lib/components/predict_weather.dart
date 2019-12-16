import 'package:flutter/material.dart';
import '../modal/weather.dart';
import '../constants.dart' show AppStyles;

class PredictWeather extends StatelessWidget {
  PredictWeather({
    @required this.weathers,
  }) : assert(weathers != null);

  final List<Weather> weathers;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '洞烛先机',
              style: AppStyles.ContentStyle4,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 24.0,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Column(
                // crossAxisAlignment: Cross,
                children: weathers.map((weather) {
                  return Container(
                    margin: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          weather.week,
                          style: AppStyles.ContentStyle4,
                        ),
                        Expanded(
                          child: Text(
                            weather.weather,
                            style: AppStyles.ContentStyle4,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          weather.minTemperature.toString() +
                              '-' +
                              weather.maxTemperature.toString() +
                              '度',
                          style: AppStyles.ContentStyle4,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

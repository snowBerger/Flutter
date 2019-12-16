import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CityData.dart';
import 'WeatherWidget.dart';

class CityWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState () {
    // TODO: implement createState
    return CityState();
  }
}

class CityState extends State<CityWidget> {
  List<CityData> cityList = new List<CityData>();

  CityState () {
    _getCityList();
  }

  void _getCityList () async {
    List<CityData> citys = await _fetchCityList();
    setState(() {
      cityList = citys;
    });
  }

  // 拉取城市列表
  Future<List<CityData>> _fetchCityList () async {
    final res = await http.get('https://search.heweather.net/top?group=cn&key=c38be5a5412b4386ae140ff646b336f4');

    List<CityData> cityList = new List<CityData>();

    if (res.statusCode == 200) {
      // 解析数据
      Map<String, dynamic> result = json.decode(res.body);
      for (dynamic data in result['HeWeather6'][0]['basic']) {
        CityData cityData = CityData(data['location']);
        cityList.add(cityData);
      }
      return cityList;
    } else {
      return cityList;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: cityList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: GestureDetector(
              child: Text(cityList[index].cityName),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherWidget(cityList[index].cityName))
                );
              },
            ),
          );
        }
      )
    );
  }
}

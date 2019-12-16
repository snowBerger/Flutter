import 'package:flutter/material.dart';
import './pages/home.dart';
import './constants.dart' show AppColors;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '雨时',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.blue,
        primaryColor: Color(AppColors.AppColor),
      ),
      home: HomePage(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           width: 100,
//           height: 100,
//           color: Colors.red,
//         ),
//         Container(
//           width: 90,
//           height: 90,
//           color: Colors.green,
//         ),
//         Container(
//           width: 80,
//           height: 80,
//           color: Colors.blue,
//         ),
//       ],
//     );
//   }
// }

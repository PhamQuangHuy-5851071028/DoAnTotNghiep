import './screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyCovid19());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIOverlays([]);
}
class MyCovid19 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Covid-19',
      home: HomeScreen(),
    );
  }
}



// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: "My Covid-19",
//     home: HomeScreen(),
//   ));
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   SystemChrome.setEnabledSystemUIOverlays([]);
// }

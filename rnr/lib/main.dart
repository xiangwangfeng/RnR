import 'package:flutter/material.dart';
import 'package:rnr/pages/home/home.dart';
import 'package:rnr/style/styles.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kAppBackgroundColor,
      ),
      home: HomePageWidget(),
    );
  }
}

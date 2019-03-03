import 'package:flutter/material.dart';
import 'package:rnr/pages/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: HomePageWidget(),
    );
  }
}

//to fix:选择下一个月后点击按钮无效
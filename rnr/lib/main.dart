import 'package:flutter/material.dart';
import 'package:rnr/style/styles.dart';
import 'pages/main_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kAppBackgroundColor,
        textTheme: TextTheme(
          subhead: TextStyle(
            color: kAppButtonBackgroundColor,
          )
        ),
        iconTheme: IconThemeData(
          color: kAppButtonBackgroundColor,
        ),
      ),
      home: MainPage(),
    );
  }
}

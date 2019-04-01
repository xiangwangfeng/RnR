import 'package:flutter/material.dart';
import 'package:rnr/style/styles.dart';
import 'pages/calendar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kAppBackgroundColor,   
        primaryColor: kAppPrimaryColor,

        textTheme: TextTheme(
          subhead: TextStyle(
            color: kAppSubHeadTextColor,
          )
        ),
        iconTheme: IconThemeData(
          color: kAppIconColor,
        ),
      ),
      home: CalendarPageWidget(),
    );
  }
}

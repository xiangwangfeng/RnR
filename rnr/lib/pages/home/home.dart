import 'package:flutter/material.dart';
import 'package:rnr/component/flutter_calendar.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Calendar(

          )
        )
        );
  }
}

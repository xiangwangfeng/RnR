import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPageWidget extends StatelessWidget {
  final String url = 'https://xiangwangfeng.com';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('关于'),
        ),
        body: Center(
            child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              Text(
                '读书跑步打卡器',
                style: TextStyle(color: Colors.blue),
              ),
              Container(
                height: 5,
              ),
              Text(
                '阿毛',
                style: TextStyle(color: Colors.blue),
              ),
              Container(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  launch(url);
                },
                child: Text(url,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}

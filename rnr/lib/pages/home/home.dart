import 'package:flutter/material.dart';
import 'package:rnr/component/flutter_calendar.dart';
import 'package:rnr/model/record.dart';
import 'package:rnr/style/styles.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Calendar(
            onDateSelected: (day) {
              this.setState(() {
                this.date = day;
              });
            },
          ),
          _contentConatiner(date),
        ],
      )),
    );
  }

  Widget _contentConatiner(DateTime date) {
    var records = Records.shared;
    bool runned = records.runned(date);
    bool read = records.read(date);

    return Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      child: Column(children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '人生，唯有这两件事不可辜负：读书，跑步。',
            style: TextStyle(
              color: kCalendarTextDisabledColor,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        _itemContainer('读书   📖', read, () {
          this.setState(() {
            records.setRead(!read, date);
          });
        }),
        _itemContainer('跑步   🏃', runned, () {
          this.setState(() {
            records.setRunned(!runned, date);
          });
        }),
      ]),
    );
  }

  Widget _itemContainer(String title, bool checked, VoidCallback callback) {
    Color color = checked ? Colors.green : Colors.red;
    return Container(
        width: 300,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: FlatButton.icon(
          onPressed: () {
            if (callback != null) callback();
          },
          label: Text(
            title,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          icon: Icon(
            Icons.flag,
            color: color,
          ),
          color: kAppButtonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ));
  }
}

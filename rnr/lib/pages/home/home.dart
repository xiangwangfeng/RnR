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
  void initState() {
    Records.shared.loadFromCache().then((value) {
      this.setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      body: SafeArea(
        child: _homeWidget(),
      ),
    );
  }

  Widget _homeWidget() {
    return Column(
      children: <Widget>[
        Calendar(onDateSelected: (day) {
          this.setState(() {
            this.date = day;
          });
        }, onSelectedRangeChange: (dayRange) {
          this.setState(() {
            this.date = dayRange.item1;
          });
        }),
        _contentConatiner(date),
      ],
    );
  }

  Widget _contentConatiner(DateTime date) {
    var records = Records.shared;
    bool runned = records.runned(date);
    bool read = records.read(date);
    bool zous = records.zous(date);

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(children: <Widget>[
        Container(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '人生，唯有这些事不可辜负：读书，跑步还有Zous!',
              style: TextStyle(
                color: kCalendarTextHighlightColor,
                fontSize: 15,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _itemContainer('读书', '📖', read, () {
                this.setState(() {
                  records.setRead(!read, date);
                });
              }),
              _itemContainer('跑步', '🏃', runned, () {
                this.setState(() {
                  records.setRunned(!runned, date);
                });
              }),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _itemContainer('Zous', '💦', zous, () {
                this.setState(() {
                  records.setZous(!zous, date);
                });
              }),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _itemContainer(
      String prefix, String suffix, bool checked, VoidCallback callback) {
    String title = checked ? prefix + " " + suffix : prefix;
    return Container(
        width: 150,
        child: FlatButton(
          onPressed: () {
            if (callback != null) callback();
          },
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          color: kAppButtonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ));
  }
}

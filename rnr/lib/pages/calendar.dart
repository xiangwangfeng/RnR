import 'package:flutter/material.dart';
import 'package:rnr/component/flutter_calendar.dart';
import 'package:rnr/model/record.dart';
import 'setting.dart';
import 'package:rnr/model/config.dart';

class CalendarPageWidget extends StatefulWidget {
  @override
  _CalendarPageWidgetState createState() => _CalendarPageWidgetState();
}

class _CalendarPageWidgetState extends State<CalendarPageWidget> {
  DateTime date = DateTime.now();

  @override
  void initState() {
     Records.shared.loadFromCache().then((value) {
       Configs.shared.loadFromCache().then((value) {
          this.setState((){});
      });
     
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:_calendarWidget(),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          _pushToSettingPage(context);
        },
        child: Icon(Icons.settings),
      ),
    );
  }

  void _pushToSettingPage(context) {
     Navigator.push(
    context,
    new MaterialPageRoute(builder: (context) => new SettingPageWidget()),
  );
  }

  Widget _calendarWidget() {
    return Column(
        children: <Widget>[
          Calendar(
            onDateSelected: (day) {
              this.setState(() {
                this.date = day;
              });
            },
            onSelectedRangeChange: (dayRange) {
              this.setState((){
                this.date =dayRange.item1;
              });
            }
          ),
          _contentConatiner(date),
        ],
      );
  }

  Widget _contentConatiner(DateTime date) {
    var records = Records.shared;
    bool runned = records.runned(date);
    bool read = records.read(date);

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(children: <Widget>[
        Container(
          child: Align(
          alignment: Alignment.center,
          
          child: Text(
            '人生，唯有这两件事不可辜负：读书，跑步。',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
            ),
          ),
        ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _itemContainer('读书', readEmoji(), read, () {
                this.setState(() {
                  records.setRead(!read, date);
                });
              }),
              _itemContainer('跑步',runEmoji(), runned, () {
                this.setState(() {
                  records.setRunned(!runned, date);
                });
              }),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _itemContainer(String prefix, String suffix, bool checked, VoidCallback callback) {
    String title = checked ? prefix + " " + suffix : prefix;
    Color color = Colors.blue;
    return Container(
        width: 150,
        child:FlatButton(
          color: color,
          onPressed: () {
            if (callback != null) callback();
          },
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ));
  }
}

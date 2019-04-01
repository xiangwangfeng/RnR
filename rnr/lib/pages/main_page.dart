import 'package:flutter/material.dart';
import 'package:rnr/pages/calendar.dart';
import 'package:rnr/pages/check.dart';
import 'package:rnr/pages/setting.dart';
import 'package:rnr/style/styles.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  static CalendarPageWidget _homepage = CalendarPageWidget();
  static CheckInPageWidget _checkInPage = CheckInPageWidget();
  static SettingPageWidget _settingPage = SettingPageWidget();
  final _pages = [_homepage, _checkInPage, _settingPage];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        color: kAppBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: _selectedIndex == 0
                  ? Icon(Icons.calendar_today)
                  : Icon(Icons.calendar_view_day),
              onPressed: () => this._onItemTapped(0),
            ),
            IconButton(
              icon: _selectedIndex == 1
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check),
              onPressed: () => this._onItemTapped(1),
            ),
            IconButton(
              icon: _selectedIndex == 2
                  ? Icon(Icons.settings_applications)
                  : Icon(Icons.settings),
              onPressed: () => this._onItemTapped(2),
            )
          ],
        ),
      ),
    );
  }
}
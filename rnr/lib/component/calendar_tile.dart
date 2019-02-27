import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';

class CalendarTile extends StatelessWidget {
  final VoidCallback onDateSelected;
  final DateTime date;
  final String dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final TextStyle dayOfWeekStyles;
  final TextStyle dateStyles;
  final int flagCount;

  CalendarTile({
    this.onDateSelected,
    this.date,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyles,
    this.isDayOfWeek: false,
    this.isSelected: false,
    this.flagCount = 0,
  });

  Widget renderDateOrDayOfWeek(BuildContext context) {
    if (isDayOfWeek) {
      return new InkWell(
        child: new Container(
          alignment: Alignment.center,
          child: new Text(
            dayOfWeek,
            style: dayOfWeekStyles,
          ),
        ),
      );
    } else {
      List<Widget> items =List();
      items.add(new Text(
                  Utils.formatDay(date).toString(),
                  style: isSelected
                      ? Theme.of(context).primaryTextTheme.body1
                      : dateStyles,
                  textAlign: TextAlign.center,
                ));
      for(var i = 0;i < flagCount;i++) {
        
        items.add(new Positioned(
                  child: new Icon(Icons.flag,color: Colors.green,),
                  width: 10,
                  height: 10,
                  right: (1 + i * 3).toDouble(),
                  bottom: 1,
                ));
      }

      return new InkWell(
        onTap: onDateSelected,
        child: new Container(
            decoration: isSelected
                ? new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  )
                : new BoxDecoration(),
            alignment: Alignment.center,
            child: Stack(
              children: items,
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: renderDateOrDayOfWeek(context),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';
import 'package:rnr/style/styles.dart';

class CalendarTile extends StatelessWidget {
  final VoidCallback onDateSelected;
  final DateTime date;
  final String dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final TextStyle dayOfWeekStyles;
  final TextStyle dateStyles;
  final String subTitle;

  CalendarTile({
    this.onDateSelected,
    this.date,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyles,
    this.isDayOfWeek: false,
    this.isSelected: false,
    this.subTitle,
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
                      ? TextStyle(color: kCalendarTextSelectedColor)
                      : dateStyles,
                  textAlign: TextAlign.center,
                ));

      if(this.subTitle !=null) {
        items.add(new Positioned(
                  child: Text(subTitle,style: TextStyle(
                    fontSize: 10,
                  ),),
                  width: 10,
                  height: 10,
                  right: 1,
                  bottom: 1,
                ));
      }

      return new InkWell(
        onTap: onDateSelected,
        child: new Container(
            decoration: isSelected
                ? new BoxDecoration(
                    shape: BoxShape.circle,
                    color: kCalendarSelectCircleColor,
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

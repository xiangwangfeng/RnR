import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';
import 'package:rnr/style/styles.dart';

enum CalendarFlagType{
  None,
  Yellow,
  Green,
}

class CalendarTile extends StatelessWidget {
  final VoidCallback onDateSelected;
  final DateTime date;
  final String dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final TextStyle dayOfWeekStyles;
  final TextStyle dateStyles;
  final CalendarFlagType flag;

  CalendarTile({
    this.onDateSelected,
    this.date,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyles,
    this.isDayOfWeek: false,
    this.isSelected: false,
    this.flag :CalendarFlagType.None,
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

      Color flagColor =configureFlagColor(this.flag);
      if(flagColor !=null) {
        items.add(new Positioned(
                  child: new Icon(Icons.flag,color:flagColor,),
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

  Color configureFlagColor(type) {
    Color flagColor;
    switch (this.flag) {
        case CalendarFlagType.Green:
          flagColor = kCalendarFlagDoneColor;
          break;
        case CalendarFlagType.Yellow:
          flagColor = kCalendarFlagHalfColor;
          break;
        default:
      }
      return flagColor;
  }
}

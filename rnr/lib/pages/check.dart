import 'package:flutter/material.dart';

class CheckInPageWidget extends StatelessWidget {

   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('打卡'),
      ),
        body: Align(
          alignment: Alignment.center,
          child:Container(
            margin: EdgeInsets.symmetric(vertical: 88),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                color: Colors.pink,
                onPressed: (){},
                child: Text('🏃‍♀️',style: TextStyle(color: Colors.pink, fontSize: 100)),
                shape: CircleBorder(
                ),
              ),
              FlatButton(
                color: Colors.pink,
                onPressed: (){},
                child: Text('📖',style: TextStyle(color: Colors.pink, fontSize: 100)),
                shape: CircleBorder(
                ),
              ),
            ],
          )
          )
          ),
    );
   }
    
}
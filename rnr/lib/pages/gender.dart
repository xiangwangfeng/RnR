import 'package:flutter/material.dart';

class GenderPageWidget extends StatelessWidget {
  final VoidCallback girlCallback;
  final VoidCallback boyCallback; 

  GenderPageWidget({this.girlCallback,this.boyCallback});
  

   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('跑步'),
      ),
        body: Align(
          alignment: Alignment.center,
          child:Container(
            margin: EdgeInsets.symmetric(vertical: 88),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _button('🏃‍♀️',girlCallback),
              Text('或', style: TextStyle(color: Colors.blue, fontSize: 70)),
              _button('🏃',boyCallback),
            ],
          )
          )
          ),
    );
   }

   Widget _button(String title,VoidCallback callback) {
      return FlatButton(
        onPressed: callback,
        child: Text(title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 70,
        ),
        ),
      );
  }
    
}
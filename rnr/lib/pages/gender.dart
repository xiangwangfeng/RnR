import 'package:flutter/material.dart';

class GenderPageWidget extends StatelessWidget {
  final VoidCallback girlCallback;
  final VoidCallback boyCallback; 

  GenderPageWidget({this.girlCallback,this.boyCallback});
  

   Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Align(
          alignment: Alignment.center,
          child:Container(
            margin: EdgeInsets.symmetric(vertical: 88),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('你是', style: TextStyle(color: Colors.pink, fontSize: 70)),
              _button('🏃‍♀️',girlCallback),
              Text('OR', style: TextStyle(color: Colors.pink, fontSize: 70)),
              _button('🏃',boyCallback),
            ],
          )
          )
          ),
    ));
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
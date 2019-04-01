import 'package:flutter/material.dart';
import 'package:rnr/style/styles.dart';

class SettingPageWidget extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
        body: Container(
          child: ListView(
          
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.tag_faces,color: kAppButtonBackgroundColor),
              title: Text('性别'),
              onTap: (){
                
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline,color: kAppButtonBackgroundColor),
               title: Text('关于'),
            ),
            
          ],
        ),
        ) 
    );
   }
    
}
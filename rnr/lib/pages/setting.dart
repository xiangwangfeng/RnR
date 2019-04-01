import 'package:flutter/material.dart';
import 'package:rnr/style/styles.dart';
import 'gender.dart';
import 'about.dart';

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
              leading: Icon(Icons.tag_faces,color: kAppIconColor),
              title: Text('性别'),
              onTap: (){
                _pushToGenderPage(context);
                
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline,color: kAppIconColor),
               title: Text('关于'),
               onTap: (){
                 _pushToAboutPage(context);
               },
            ),
            
          ],
        ),
        ) 
    );
   }

   void _pushToGenderPage(BuildContext context) {
     GenderPageWidget page = GenderPageWidget(boyCallback: (){
       Navigator.pop(context);
     },girlCallback: (){
       Navigator.pop(context);
     });
     Navigator.push(context, MaterialPageRoute(builder: (context) => page));
   }

   void _pushToAboutPage(BuildContext context) {
     AboutPageWidget page = AboutPageWidget();
     Navigator.push(context, MaterialPageRoute(builder: (context) => page));
   }
    
}
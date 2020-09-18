import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title:Text("Notifications",style: TextStyle(color:Colors.grey,fontSize:16),),
      ),
      body: Center(
        child:Text("NO NOTIFICATIONS")
      ),
    );
  }
}
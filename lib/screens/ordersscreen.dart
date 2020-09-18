import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title:Text("My Orders",style: TextStyle(color:Colors.grey,fontSize:16),),
      ),
      body: Center(
        child:Text("NO ORDERS")
      ),
    );
  }
}
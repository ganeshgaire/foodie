import 'package:flutter/material.dart';

import 'navbarscreen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return NavBarScreen();
              }));
            }),
        backgroundColor: Colors.white,
        title: Text("My Cart"),
        elevation: 1,
      ),
    );
  }
}

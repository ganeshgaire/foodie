import 'package:flutter/material.dart';
import 'package:foodie/screens/navbarscreen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key key}) : super(key: key);

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
        title: Text("My Account"),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}

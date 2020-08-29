import 'package:flutter/material.dart';
import 'package:foodie/screens/loginscreen.dart';
import 'package:foodie/screens/signupscreen.dart';
import 'package:foodie/widgets/button.dart';

class AfterSplashScreen extends StatefulWidget {
  AfterSplashScreen({Key key}) : super(key: key);

  @override
  _AfterSplashScreenState createState() => _AfterSplashScreenState();
}

class _AfterSplashScreenState extends State<AfterSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              child: Text(
                "Daddy's Kitchen",
                style: TextStyle(color: Colors.orange, fontSize: 25),
              ),
            ),
          ),
          Expanded(
            child: Container(
                height: 150,
                width: 150,
                child: Image.asset("assets/daddys.png")),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: costumButton(context, 'LOGIN', LoginScreen(),
                double.infinity, Colors.orange, Colors.white70, 50.0),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: costumButton(context, 'SIGNUP', SignupScreen(),
                double.infinity, Colors.grey[300], Colors.blueGrey, 50.0),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

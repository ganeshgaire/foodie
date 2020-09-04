import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodie/api/dataserver.dart';
import 'package:foodie/screens/navbarscreen.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "OTP",
          style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(height: 50),
          Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      "Please enter 4 digit code\nwhich is sent to your mobile number."))),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: otp,
                decoration: InputDecoration(
                    hintText: "OTP No.",
                    prefixIcon: Icon(Icons.phone_android),
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25)),
              height: 50,
              width: double.infinity,
              child: FlatButton(
                  onPressed: () async {
                      final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 500),
                      backgroundColor: Colors.black87,
                      content: Text('Verifying...'),
                    );

                    _scaffoldKey.currentState.showSnackBar(snackBar);

                    var body = jsonEncode(<String, dynamic>{
                      'otp': otp.text,
                    });
                    await DataServer.verifyOtp(body: body);
                  
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NavBarScreen();
                    }));
                  },
                  child: Text(
                    "VERIFY",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}

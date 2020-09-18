import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodie/api/serverapi.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/screens/navbarscreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

// verify token
  Future<void> _verifyOtp({var body}) async {
    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response =
        await http.post(ServerApi.verifyOtp, body: body, headers: header);
    var responseData = json.decode(response.body);
    if (response.statusCode == 422) {
      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.black87,
        content: Text('Otp doesnot match.'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.black87,
        content: Text('Otp Verified.'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', responseData['api_token']);
      localStorage.setString(
          'user_data', json.encode(responseData['customer_info']));

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NavBarScreen();
      }));
    }
  }

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
                      "Please enter 6 digit code\nwhich is sent to your mobile number."))),
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
                  color: mainColor, borderRadius: BorderRadius.circular(25)),
              height: 50,
              width: double.infinity,
              child: FlatButton(
                  onPressed: () async {
                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 1000),
                      backgroundColor: Colors.black87,
                      content: Text('Verifying...'),
                    );

                    _scaffoldKey.currentState.showSnackBar(snackBar);

                    var body = jsonEncode(<String, dynamic>{
                      'otp': otp.text,
                    });
                    await _verifyOtp(body: body);
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

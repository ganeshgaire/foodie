import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodie/api/dataserver.dart';
import 'package:foodie/screens/navbarscreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            width: 200,
            child: Image.asset("assets/daddys.png"),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25)),
              child: TextFormField(
                controller: firstName,
                decoration: InputDecoration(
                    hintText: "First Name",
                    prefixIcon: Icon(Icons.person_outline),
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25)),
              child: TextFormField(
                controller: lastName,
                decoration: InputDecoration(
                    hintText: "Last Name",
                    prefixIcon: Icon(Icons.person_outline),
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25)),
              child: TextFormField(
                controller: number,
                decoration: InputDecoration(
                    hintText: "Mobile No.",
                    prefixIcon: Icon(Icons.phone_android),
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25)),
              child: TextFormField(
                controller: password,
                obscureText: _obscureText,
                validator: (val) =>
                    val.length < 6 ? 'Password too short.' : null,
                decoration: InputDecoration(
                    hintText: "Your Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        return _toggle();
                      },
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
                  onPressed: () {
                    var body = jsonEncode(<String, dynamic>{
                      'firstName': firstName,
                      'lastName': lastName,
                      'number': number,
                      'password': password
                    });
                    DataServer.register(body: body);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NavBarScreen();
                    }));
                  },
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Already have an Account? Sign In",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "OR",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  child: Icon(MdiIcons.facebook),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 25,
                  child: Icon(MdiIcons.google),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

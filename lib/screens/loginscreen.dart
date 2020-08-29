import 'package:flutter/material.dart';
import 'package:foodie/screens/navbarscreen.dart';
import 'package:foodie/widgets/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Login",
          style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            height: 150,
            width: 200,
            child: Image.asset("assets/daddys.png"),
          ),
          SizedBox(
            height: 30,
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
                decoration: InputDecoration(
                    hintText: "Your Email",
                    prefixIcon: Icon(Icons.email),
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
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget password?",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: costumButton(context, "LOGIN", NavBarScreen(),
                  double.infinity, Colors.orange, Colors.white, 50.0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Don't have an Account ? Sign Up",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
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
          ),
          Spacer(),
        ],
      ),
    );
  }
}

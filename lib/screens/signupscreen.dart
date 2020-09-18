import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:foodie/api/serverapi.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/screens/loginscreen.dart';
import 'package:foodie/screens/otpscreen.dart';
import 'dart:async';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final _formKey = GlobalKey<FormState>();


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

// register
Future<void> _register({var body}) async{
  const Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};
try{
  var response = await http.post(ServerApi.registerApi, body: body,headers: header);
    print(response.body);
    if(response.statusCode == 422){
           final snackBar = SnackBar(
            duration: const Duration(milliseconds: 500),
            backgroundColor: Colors.black87,
            content: Text('Mobile no. already exist. Please Login'),
          );
          _scaffoldKey.currentState.showSnackBar(snackBar);
    } 
    if(response.statusCode == 200) {
        final snackBar = SnackBar(
            duration: const Duration(milliseconds: 1000),
            backgroundColor: Colors.black87,
            content: Text('Signup Success'),
          );
          _scaffoldKey.currentState.showSnackBar(snackBar);

          Navigator.push(context, MaterialPageRoute(builder: (context){

            return OtpScreen();
        }));
  }
}catch(e){
     final snackBar = SnackBar(
            duration: const Duration(milliseconds: 1000),
            backgroundColor: Colors.black87,
            content: Text('Network connection not available'),
          );
          _scaffoldKey.currentState.showSnackBar(snackBar);

}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      body: Form(
        key: _formKey,
              child: SafeArea(
                child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: 200,
                child: Image.asset("assets/daddys.png"),
              ),
              SizedBox(
                height: 10,
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
                     validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter first name';
                        }
                        return null;
                      },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintText: "First Name",
                        prefixIcon: Icon(Icons.person_outline),
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
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                    controller: lastName,
                     validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                         textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintText: "Last Name",
                        prefixIcon: Icon(Icons.person_outline),
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
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                     validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter mobile no.';
                      } else if(value.length < 10 || value.length > 12){
                        return 'Enter valid mobile no.';
                      }
                      return null;
                    },
                         textInputAction: TextInputAction.done,
                    controller: number,
                    decoration: InputDecoration(
                        hintText: "Mobile No.",
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
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                    controller: password,
                         textInputAction: TextInputAction.done,

                    obscureText: _obscureText,
                     validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        } else if(value.length < 6){
                          return 'Password too short.';
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                        hintText: "Your Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            return _toggle();
                          },
                          icon: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
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
                            if (_formKey.currentState.validate()) {

                           final snackBar = SnackBar(
              duration: const Duration(milliseconds: 1000),
              backgroundColor: Colors.black87,
              content: Text('Loading...!'),
              );
              _scaffoldKey.currentState.showSnackBar(snackBar);

                        var body = jsonEncode(<String, dynamic>{
                          'first_name': firstName.text,
                          'last_name': lastName.text,
                          'mobile_no': number.text,
                          'password': password.text
                        });
                        await _register(body: body);
                            }
                      },
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Already have an Account? Sign In",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

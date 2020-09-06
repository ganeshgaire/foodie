import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:foodie/api/serverapi.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/screens/navbarscreen.dart';
import 'package:foodie/screens/signupscreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();

  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

// fb login
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Future<Null> fbLogin() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v8.0/me?fields=name,first_name,last_name,picture,email&access_token=${accessToken.token}');
        final profile = json.decode(graphResponse.body);

          var body = jsonEncode(<String, dynamic>{
                          'first_name': profile['first_name'],
                          'last_name': profile['last_name'],
                          'email': profile['email'],
                          'profile_image': profile['picture']['data']['url']
                        });
        final snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.black87,
        content: Text('Login Success.'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);

                        await _thirdPartyRegister(body: body);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        final snackBar = SnackBar(
            duration: const Duration(milliseconds: 500),
            backgroundColor: Colors.black87,
            content: Text('Sorry login cancelled.'));
        _scaffoldKey.currentState.showSnackBar(snackBar);

        break;
      case FacebookLoginStatus.error:
        final snackBar = SnackBar(
            duration: const Duration(milliseconds: 500),
            backgroundColor: Colors.black87,
            content: Text('Something went wrong with the login process.'));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }
// thirdparty register
  Future<void> _thirdPartyRegister({var body}) async {
    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response =
        await http.post(ServerApi.thirdPartyRegister, body: body, headers: header);
    var responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', responseData['api_token']);
      localStorage.setString(
          'user_data', json.encode(responseData['customer_info']));

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NavBarScreen();
      }));
    } else{
       final snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.black87,
        content: Text('Login Failed.'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);

    }
  }

// google login
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile'
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      print(_googleSignIn.currentUser);
    } catch (error) {
      print(error);
    }
  }

// custom login
// login
  Future<void> _login({var body}) async {
    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response =
        await http.post(ServerApi.customerLogin, body: body, headers: header);
    var responseData = json.decode(response.body);
    print(responseData);
    if (response.statusCode == 422) {
      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.black87,
        content: Text('Please enter mobile no. and password'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    if (response.statusCode == 401) {
      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.black87,
        content: Text('Credentials doesnot match.'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.black87,
        content: Text('Login Success.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      body: Form(
        key: _formKey,
        child: ListView(
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
                  controller: number,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter mobile no.';
                    } else if (value.length < 10 || value.length > 12) {
                      return 'Please enter valid no.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Your Mobile No.",
                      prefixIcon: Icon(Icons.call),
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter password';
                    } else if (value.length < 6) {
                      return 'Password too short';
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
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget password?",
                  ),
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
                          content: Text('Loging...'),
                        );

                        _scaffoldKey.currentState.showSnackBar(snackBar);

                        var body = jsonEncode(<String, dynamic>{
                          'username': number.text,
                          'password': password.text
                        });
                        await _login(body: body);
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignupScreen();
                }));
              },
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
              height: 15,
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
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 60,
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          fbLogin();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.red[50],
                          child: Icon(
                            MdiIcons.facebook,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _handleSignIn();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.red[50],
                          child: Icon(
                            MdiIcons.google,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

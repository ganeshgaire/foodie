import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:foodie/screens/navbarscreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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

  Future<Null> login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
          final snackBar = SnackBar(
            duration: const Duration(milliseconds: 500),
            backgroundColor: Colors.black87,
            content: Text('Loading...'),
            );
            
            _scaffoldKey.currentState.showSnackBar(snackBar);
       
        final FacebookAccessToken accessToken = result.accessToken;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v8.0/me?fields=name,first_name,last_name,picture,email&access_token=${accessToken.token}');
        final profile = json.decode(graphResponse.body);
        print("profile is $profile");

        // print('''
        //  Logged in!

        //  Token: ${accessToken.token}
        //  User id: ${accessToken.userId}
        //  Expires: ${accessToken.expires}
        //  Permissions: ${accessToken.permissions}
        //  Declined permissions: ${accessToken.declinedPermissions}
        //  ''');  
        
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NavBarScreen();
          }));
        
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
        Scaffold.of(context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 3000),
            backgroundColor: Colors.black87,
            content: Text('Something went wrong with the login process.')));
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

// google login
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
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
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return NavBarScreen();
                    // }));
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
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
                  InkWell(
                    onTap: () {
                      login();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(MdiIcons.facebook,color: Colors.blue,),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: (){
                 _handleSignIn();
                    },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                      child: Icon(MdiIcons.google,color: Colors.red,),
                    ),
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

import 'package:flutter/material.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/screens/editprofile.dart';
import 'package:foodie/screens/notifications.dart';
import 'package:foodie/screens/ordersscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var userData;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user_data');
    var user = json.decode(userJson);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
          leading: Icon(Icons.account_circle, color: mainColor),
          backgroundColor: Colors.white,
          title: Text(
            "Me",
            style: TextStyle(color: Colors.grey),
          )),
      body: ListView(children: [
        SizedBox(
          height: 30,
        ),
        userData['profile_image'] == null
            ? Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Positioned(
                      child: CircleAvatar(
                        radius: 50,
                        child: Text("no image"),
                      ),
                    ),
                    Positioned(
                        child: CircleAvatar(
                            backgroundColor: Colors.brown,
                            child: IconButton(
                                icon: Icon(
                                  Icons.add_photo_alternate,
                                  color: Colors.white,
                                ),
                                onPressed: () {}))),
                  ],
                ),
              )
            : Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Positioned(
                      child: CircleAvatar(
                          radius: 50,
                          // child: Text("no image"),
                          backgroundImage: NetworkImage(userData['profile_image'])),
                    ),
                  ],
                ),
              ),
        SizedBox(height: 5),
        Center(
            child: Text(
          "${userData['first_name']} ${userData['last_name']}",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        )),
        Center(
            child: Text(
          userData['mobile_no'] != null
              ? "${userData['mobile_no']}"
              : userData['email'],
          style: TextStyle(fontSize: 15, color: Colors.grey),
        )),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OrdersScreen();
            }));
          },
          child: ListTile(
            leading: Icon(Icons.shopping_cart,size: 18,),
            title: Text(
              "My Orders",
              style: TextStyle(color: Colors.grey,fontSize: 14),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.track_changes,size: 18,),
          title: Text(
            "Track Order",
            style: TextStyle(color: Colors.grey,fontSize: 14),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NotificationScreen();
            }));
          },
          child: ListTile(
            leading: Icon(Icons.notifications,size: 18,),
            title: Text(
              "Notifications",
              style: TextStyle(color: Colors.grey,fontSize: 14),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EditProfileScreen();
            }));
          },
          child: ListTile(
            leading: Icon(Icons.person_outline,size: 18,),
            title: Text(
              "Edit Profile",
              style: TextStyle(color: Colors.grey,fontSize: 14),
            ),
          ),
        ),
        ListTile(title:Text('Account Preferences',style: TextStyle(fontSize:12),)),
         InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EditProfileScreen();
            }));
          },
          child: ListTile(
            leading: Icon(Icons.person_outline,size: 18,),
            title: Text(
              "Privacy Policy",
              style: TextStyle(color: Colors.grey,fontSize: 14),
            ),
          ),
        ),
         InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EditProfileScreen();
            }));
          },
          child: ListTile(
            leading: Icon(Icons.person_outline,size: 18,),
            title: Text(
              "About Us",
              style: TextStyle(color: Colors.grey,fontSize: 14),
            ),
          ),
        ),
        ListTile(title:Text('v1.0.0', style: TextStyle(color: Colors.grey,fontSize: 14)))
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'navbarscreen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key key}) : super(key: key);

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
        title: Text("Menu"),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(MdiIcons.pizza),
              title: Text(
                "Pizza",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}

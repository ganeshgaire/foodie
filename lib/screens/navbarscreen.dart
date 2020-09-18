import 'package:flutter/material.dart';
import 'package:foodie/controller/cartcontroller.dart';
import 'package:foodie/screens/homescreen.dart';
import 'package:foodie/screens/loginscreen.dart';
import 'package:foodie/widgets/customtab.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menuscreen.dart';
import 'cartscreen.dart';
import 'accountscreen.dart';

class NavBarScreen extends StatefulWidget {
  NavBarScreen({Key key}) : super(key: key);

  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final List<Widget> _pages = [
    HomeScreen(),
    MenuScreen(),
    CartScreen(),
    AccountScreen(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.restaurant_menu,
    MdiIcons.cart,
    MdiIcons.account,
  ];
  int _selectedIndex = 0;
  var userData;

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you want to  logout?"),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('No')),
                FlatButton(
                    onPressed: () async {
                      SharedPreferences localStorage =
                          await SharedPreferences.getInstance();
                      await localStorage.clear();

                      Navigator.pop(context, true);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: Text('Yes')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, cart, child) {
      return WillPopScope(
        onWillPop: () {
          cart.clear();
          _onBackPressed();
          return null;
        },
        child: DefaultTabController(
            length: _icons.length,
            child: Scaffold(
              body: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
              bottomNavigationBar: Card(
                elevation: 0,
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              ),
            )),
      );
    });
  }
}

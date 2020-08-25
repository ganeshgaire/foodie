import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:foodie/screens/homescreen.dart';
import 'menuscreen.dart';
import 'cartscreen.dart';
import 'accountscreen.dart';

class NavBarScreen extends StatefulWidget {
  NavBarScreen({Key key}) : super(key: key);

  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentPage = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    MenuScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPage],
      bottomNavigationBar: CircleBottomNavigation(
        barHeight: 55,
        circleSize: 45,
        circleColor: Colors.orange[600],
        initialSelection: currentPage,
        inactiveIconColor: Colors.orange[600],
        textColor: Colors.grey[500],
        hasElevationShadows: true,
        tabs: [
          TabData(
            icon: Icons.home,
            iconSize: 20,
            title: 'Home',
            fontSize: 12,
          ),
          TabData(
            icon: Icons.restaurant_menu,
            iconSize: 20,
            title: 'Menu',
            fontSize: 12,
          ),
          TabData(
            icon: Icons.shopping_cart,
            iconSize: 20,
            title: 'Cart',
            fontSize: 12,
          ),
          TabData(
            icon: Icons.person,
            iconSize: 20,
            title: 'Account',
            fontSize: 12,
          ),
        ],
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodie/screens/homescreen.dart';
import 'package:foodie/widgets/customtab.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
        ));
  }
}

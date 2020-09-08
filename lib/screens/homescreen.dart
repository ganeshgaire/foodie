import 'package:flutter/material.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/controller/cartcontroller.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  // final List<Category> categories;

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();
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
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, cart, child) {
      return Scaffold(
        drawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: customDrawer(context)),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          controller: _trackingScrollController,
          slivers: <Widget>[
            SliverAppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              title: Text(
                'Daddy\'s Kitchen',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              centerTitle: false,
              floating: true,
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.notifications_active,
                      color: mainColor,
                    ),
                    onPressed: () {})
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Container(
                  child: Text(
                    userData['first_name'] != null
                        ? "Welcome ${userData['first_name']} ! \nWhat do you want to eat?"
                        : "Welcome user ! \nWhat do you want to eat?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
              sliver: SliverToBoxAdapter(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey[100]),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: mainColor,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      hintText: "category/food eg. Burger",
                      suffixIcon: Icon(MdiIcons.sort, color: mainColor),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: CategoryWidget(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Popular Today",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              sliver: SliverToBoxAdapter(
                child: DealsWidget(deals: deals),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Daddys Special",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              sliver: SliverToBoxAdapter(
                child: PopularWidget(populars: populars),
              ),
            ),
          ],
        ),
      );
    });
  }
}

Widget customDrawer(context) {
  return Drawer();
}

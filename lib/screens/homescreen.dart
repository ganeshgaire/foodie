import 'package:flutter/material.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  // final List<Category> categories;

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Icon(
              Icons.menu,
              color: Colors.orange,
            ),
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'Daddy\'s Kitchen',
              style: const TextStyle(
                color: Colors.brown,
                fontSize: 25.0,
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
                    color: Colors.orange,
                  ),
                  onPressed: () {})
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Container(
                child: Text(
                  "What do you want to eat \n Sushil !",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.orangeAccent)],
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey[100]),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.orange,
                    ),
                    hintText: "category/food eg. Burger",
                    suffixIcon: Icon(MdiIcons.sort, color: Colors.orange),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            sliver: SliverToBoxAdapter(
              child: CategoryWidget(categories: categories),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Today\'s Deals",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
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
                "Combo Offers",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            sliver: SliverToBoxAdapter(
              child: ComboWidget(combos: combos),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Popular Items",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
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
  }
}

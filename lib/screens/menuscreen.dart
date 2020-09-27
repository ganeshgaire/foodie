import 'package:flutter/material.dart';
import 'package:foodie/api/dataserver.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/models/Category.dart';
import 'package:foodie/screens/categoryitemsscreen.dart';
import 'package:shimmer/shimmer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
  appBar: AppBar(
          leading: Icon(Icons.restaurant_menu,color: mainColor,),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Daddys Menu",
            style: TextStyle(color: Colors.grey[600]),
          )),
      body: FutureBuilder(
        future: DataServer.fetchCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.hasData) {
            List<Category> categories = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CategoryItems(
                          categorySlug: categories[index].slug,
                          categoryName: categories[index].name,
                        );
                      }));
                    },
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(categories[index].name[0]),
                        ),
                        title: Text(categories[index].name),
                        trailing: Text(categories[index].items.toString()),
                      ),
                    ),
                  );
                });
          } else {
            return Shimmer.fromColors(
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int i) {
                    return Card(
                      child: ListTile(),
                    );
                  },
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.grey[300]);
          }
        },
      ),
    );
  }
}

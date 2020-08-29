import 'package:flutter/material.dart';
import 'package:foodie/api/dataserver.dart';
import 'package:foodie/models/Category.dart';
import 'package:shimmer/shimmer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text("Daddy's Menu"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
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
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(categories[index].items.toString()),
                      ),
                      title: Text(categories[index].name),
                      trailing: Icon(Icons.keyboard_arrow_right),
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

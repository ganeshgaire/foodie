import 'package:flutter/material.dart';
import 'package:foodie/api/dataserver.dart';
import 'package:foodie/models/models.dart';

class CategoryWidget extends StatelessWidget {
  final List<Category> categories;
  const CategoryWidget({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child:  FutureBuilder(
        future: DataServer.fetchCategories(),
        builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.hasData) {
            List<Category> categories = snapshot.data;
            return ListView(
              scrollDirection: Axis.horizontal,
              children: categories
                  .map(
                    (Category category) => ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.orange[50],),
                      title: Text(category.name),
                      subtitle: Text("${category.items}"),
                      
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  }
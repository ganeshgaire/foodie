import 'package:flutter/material.dart';
import 'package:foodie/api/dataserver.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/models/models.dart';
import 'package:foodie/screens/categoryitemsscreen.dart';
import 'package:shimmer/shimmer.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: FutureBuilder(
        future: DataServer.fetchCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.hasData) {
            List<Category> categories = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CategoryItems(
                          categorySlug: categories[index].slug,
                          categoryName: categories[index].name,
                        );
                      }));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Text(
                          categories[index].name,
                          style: TextStyle(fontSize: 14, color: mainColor),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Shimmer.fromColors(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 50.0,
                          width: 200.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          height: 50.0,
                          width: 200.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          )),
                    ),
                  ],
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.grey[300]);
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodie/api/dataserver.dart';
import 'package:foodie/models/models.dart';
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
      height: 45,
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
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        categories[index].name,
                        style: TextStyle(
                            fontSize: 14, color: Colors.deepOrange[800]),
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

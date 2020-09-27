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
      height: 120,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
 Container(
                            height: 80,
                            width: 100,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: categories[index].image != null
                                  ? Image.network(
                                      categories[index].image,
                                      height: 80,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    )
                                  : Icon(
                                      Icons.fastfood,
                                      color: mainColor,
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 10,
                            child: Text("${categories[index].items.toString()} items",style: TextStyle(color:mainColor,fontSize:12),)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categories[index].name,
                            style: TextStyle( color: Colors.grey[600],
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Shimmer.fromColors(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 100.0,
                          width: 100.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          height: 100.0,
                          width: 100.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
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

import 'package:flutter/material.dart';
import 'package:foodie/models/models.dart';

class CategoryWidget extends StatelessWidget {
  final List<Category> categories;
  const CategoryWidget({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                  child: Text(
                    categories[index].name,
                    style: TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

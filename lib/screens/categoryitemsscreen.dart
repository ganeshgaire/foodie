import 'package:flutter/material.dart';

class CategoryItems extends StatefulWidget {
  final categoryItems, categoryName;
  const CategoryItems({Key key, this.categoryItems, this.categoryName})
      : super(key: key);

  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(widget.categoryName.toString()),
      ),
      body: SafeArea(
        child: Text("c"),
      ),
    );
  }
}

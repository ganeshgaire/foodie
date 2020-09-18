import 'package:flutter/material.dart';
import 'package:foodie/api/dataserver.dart';
import 'package:foodie/api/serverapi.dart';
import 'package:foodie/models/models.dart';
import 'package:foodie/screens/itemsinglescreen.dart';

class CategoryItems extends StatefulWidget {
  final categorySlug, categoryName;
  const CategoryItems({Key key, this.categorySlug, this.categoryName})
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
        title: Text(
          widget.categoryName.toString(),
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ),
      body: FutureBuilder(
        future: DataServer.getCategoryItems(widget.categorySlug),
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasData) {
            List<Item> items = snapshot.data;

            return GridView.builder(
                itemCount: items == null ? 0 : items.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (1 / 1), crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      elevation: 1.0,
                      child: new Container(
                        alignment: Alignment.center,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Center(
                                  child: new Text(
                                    "Rs.${items[index].price.toString()}",
                                    style: new TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.0),
                                child: Hero(
                                  tag: items[index].name,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) {
                                        return ItemSingleScreen(item: items[index],);
                                      }));
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(image: 
                                        NetworkImage(items[index].image == null
                                            ? "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png"
                                            : "${ServerApi.productsImageUrl}/${items[index].image}",),
                                            fit: BoxFit.fill
                                              )

                                      ),
                                      
                                     
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Center(
                                  child: new Text(
                                    items[index].name,
                                    style: new TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

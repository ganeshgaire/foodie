import 'package:flutter/material.dart';
import 'package:foodie/api/dataserver.dart';
import 'package:foodie/api/serverapi.dart';
import 'package:foodie/models/models.dart';
import 'package:foodie/screens/itemsinglescreen.dart';
import 'package:shimmer/shimmer.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: FutureBuilder(
        future: DataServer.getPopularCuisines(),
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasData) {
            List<Item> populars = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: populars.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 5.0),
                    child: Card(
                        elevation: 1.0,
                        child: new Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.height * 0.15,
                          alignment: Alignment.center,
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                child: new Center(
                                  child: new Text(
                                    "Rs.${populars[index].price.toString()}",
                                    style: new TextStyle(fontSize: 12.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(

                                flex: 1,
                                child: Hero(
                                  tag: populars[index].name,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) {
                                        return ItemSingleScreen(item: populars[index],);
                                      }));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(image: 
                                        NetworkImage(populars[index].image == null
                                            ? "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png"
                                            : "${ServerApi.productsImageUrl}/${populars[index].image}",),
                                            fit: BoxFit.fill
                                              )

                                      ),
                                      
                                     
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                                  child: new Center(
                                    child: new Text(
                                      populars[index].name,
                                      style: new TextStyle(fontSize: 12.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                });
          } else {
            return Shimmer.fromColors(
                child: Container(
                  height: 140,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 100.0,
                            width: 100.0,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            height: 100.0,
                            width: 100.0,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            height: 100.0,
                            width: 100.0,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            )),
                      ),
                    ],
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.grey[300]);
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodie/api/dataserver.dart';
import 'package:foodie/api/serverapi.dart';
import 'package:foodie/models/models.dart';
import 'package:foodie/screens/itemsinglescreen.dart';
import 'package:shimmer/shimmer.dart';

class SpecialWidget extends StatelessWidget {
  const SpecialWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: FutureBuilder(
        future: DataServer.getSpecialFoods(),
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasData) {
            List<Item> specials = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: specials.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Center(
                                    child: new Text(
                                      "Rs.${specials[index].price.toString()}",
                                      style: new TextStyle(fontSize: 12.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0),
                                  child: Hero(
                                    tag: specials[index].name,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ItemSingleScreen(item: specials[index],);
                                        }));
                                      },
                                      child: Container(
                                      height: 40,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(image: 
                                        NetworkImage(specials[index].image == null
                                            ? "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png"
                                            : "${ServerApi.productsImageUrl}/${specials[index].image}",),
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
                                      specials[index].name,
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

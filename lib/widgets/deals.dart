import 'package:flutter/material.dart';
import 'package:foodie/controller/cartcontroller.dart';
import 'package:foodie/models/models.dart';
import 'package:foodie/screens/dealsinglescreen.dart';
import 'package:provider/provider.dart';

class DealsWidget extends StatelessWidget {
  final List<Deal> deals;

  const DealsWidget({Key key, this.deals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, cart, child) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: deals.length,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.orange[50],
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: 5,
                              left: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.orange),
                                child: Text(
                                  "${deals[index].discount.toString()} %",
                                  style: TextStyle(fontSize: 13),
                                ),
                              )),
                          Positioned(
                            left: 25,
                            top: -15,
                            child: Hero(
                                tag: deals[index].name,
                                child: GestureDetector(
                                    onTap: () {
                                      return Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DealSingleScreen(
                                            deal: deals[index]);
                                      }));
                                    },
                                    child: Image.network(
                                      deals[index].image,
                                      height: 180,
                                      width: 140,
                                    ))),
                          ),
                          Positioned(
                              right: 4,
                              top: 3,
                              child: Container(
                                child: Text(
                                  "Rs.${deals[index].price.toString()}",
                                  style: TextStyle(fontSize: 14),
                                ),
                              )),
                          Positioned(
                              bottom: 10,
                              left: 5,
                              child: Container(
                                child: Text(
                                  deals[index].name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                          // Positioned(
                          //     bottom: 14,
                          //     right: 5,
                          //     child: Container(
                          //         child: InkWell(
                          //       onTap: () {
                                 
                          //       },
                          //       child: Card(
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(10)),
                          //         color: Colors.orange,
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(4.0),
                          //           child: Text(
                          //             "Add",
                          //             style: TextStyle(
                          //                 color: Colors.white, fontSize: 15),
                          //           ),
                          //         ),
                          //       ),
                          //     ))),
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

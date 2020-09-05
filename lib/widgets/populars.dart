import 'package:flutter/material.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/controller/cartcontroller.dart';
import 'package:foodie/models/Popular.dart';
import 'package:provider/provider.dart';

class PopularWidget extends StatelessWidget {
  final List<Popular> populars;
  const PopularWidget({Key key, this.populars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, cart, child){
      return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: populars.length,
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: 5,
                              left: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: mainColor),
                                child: Text(
                                  "Rs.${populars[index].price.toString()}",
                                  style: TextStyle(fontSize: 14),
                                ),
                              )),
                          Positioned(
                            left: 15,
                            top: 5,
                            child: Image.network(populars[index].image,height:150 ,width: 150,),
                          ),
                          Positioned(
                              bottom: 14,
                              left: 5,
                              child: Container(
                                child: Text(
                                  populars[index].name,
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              )),
                         
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      );
    }
    );
  }
}

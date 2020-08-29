import 'package:flutter/material.dart';
import 'package:foodie/models/models.dart';

class ComboWidget extends StatelessWidget {
  final List<Combo> combos;

  const ComboWidget({Key key, this.combos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: combos.length,
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
                    width: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                        color: Colors.pink[50],
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 4,
                            left: 5,
                            child: Container(
                              child: Text(
                                "${combos[index].validTill}",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.deepOrange),
                              ),
                            )),
                        Positioned(
                            left: 25,
                            top: 0,
                            child: Image.network(combos[index].image)),
                        Positioned(
                            right: 4,
                            top: 3,
                            child: Container(
                              child: Text(
                                "Rs.${combos[index].price.toString()}",
                                style: TextStyle(fontSize: 14),
                              ),
                            )),
                        Positioned(
                            bottom: 14,
                            left: 5,
                            child: Container(
                              child: Text(
                                combos[index].name,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            )),
                        Positioned(
                            bottom: 14,
                            right: 5,
                            child: Container(
                                child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.orange,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ))),
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}

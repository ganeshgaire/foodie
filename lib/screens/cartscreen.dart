import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodie/api/serverapi.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/controller/cartcontroller.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int discount;

  // post address
  Future<void> checkout({var body}) async {
    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var res = await http.post(
      ServerApi.checkout,
      headers: header,
      body: body,
    );
    print(res.body);
    if (res.statusCode == 200) {
      print("success");
    } else {
      throw "Checkout failed.";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, cart, index) {
      return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
              elevation: 0,
              leading: Icon(
                Icons.shopping_cart,
                color: mainColor,
              ),
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${cart.count} item(s)",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
              title: Text(
                "My Cart",
                style: TextStyle(color: Colors.grey),
              )),
          body: cart.items.length > 0
              ? ListView(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: cart.items.length,
                        itemBuilder: (BuildContext context, int i) => Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: FittedBox(
                                  child: Text(
                                      cart.items.values.toList()[i].name[0])),
                            ),
                            title: Container(
                                margin: EdgeInsets.only(left: 5),
                                child:
                                    Text(cart.items.values.toList()[i].name)),
                            subtitle: Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        cart.removeSingleItem(
                                            cart.items.keys.toList()[i]);
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.remove_circle_outline,
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                      "${cart.items.values.toList()[i].quantity}"),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        cart.addItem(
                                            cart.items.keys
                                                .toList()[i]
                                                .toString(),
                                            cart.items.values.toList()[i].name,
                                            double.parse(cart.items.values
                                                .toList()[i]
                                                .price
                                                .toString()),
                                            cart.items.values
                                                .toList()[i]
                                                .image);
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.add_circle_outline,
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        cart.removeItem(
                                          cart.items.keys.toList()[i],
                                        );
                                        final snackBar = SnackBar(
                                            duration: const Duration(
                                                milliseconds: 1000),
                                            backgroundColor: Colors.black87,
                                            content: Text(
                                                'Item removed from cart.'));
                                        _scaffoldKey.currentState
                                            .showSnackBar(snackBar);
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: Text(
                                            'x',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        "Rs. ${cart.items.values.toList()[i].price}",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ListTile(
                        title: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Coupon Code",
                                prefixIcon: Icon(Icons.code),
                                border: InputBorder.none),
                          ),
                        ),
                        trailing: RaisedButton(
                          color: mainColor,
                          onPressed: () {},
                          child: Text(
                            "Validate",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: double.infinity,
                      child: Column(children: [
                        ListTile(
                          title: Text('Gross Amount'),
                          trailing: Text('Rs.${cart.totalAmount.toString()}'),
                        ),
                        ListTile(
                          title: Text('Discount'),
                          trailing: Text("0"),
                        ),
                        ListTile(
                          title: Text('Net Amount'),
                          trailing: Text('Rs.${cart.totalAmount.toString()}'),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(25)),
                        height: 50,
                        width: double.infinity,
                        child: FlatButton(
                            onPressed: () {
                              print("pressed");
                              var  body = jsonEncode(<String,dynamic>{
                                  'basket_items':[{
                                    'id':1,
                                    'quantity':2,
                                    'price':100.0,
                                  }],
                                  'gross_amount':200.0,
                                  'discount':0,
                                  'net_amount':200.0
                              });

                              checkout(body:body);
                            },
                            child: Text(
                              "Checkout",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/emptycart.png"),
                    ),
                    Container(
                        child: Text(
                      "GOOD FOOD IS ALWAYS COOKING ?\n       Add something from menu.",
                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                    ))
                  ],
                ));
    });
  }
}

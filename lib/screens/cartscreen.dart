import 'package:flutter/material.dart';
import 'package:foodie/controller/cartcontroller.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, cart, index) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          backgroundColor: Colors.white,
          title: Text("My Cart"),
          centerTitle: true,
          elevation: 1,
        ),
        body: cart.items.length > 0 ? Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cart.items.length,
                itemBuilder: (BuildContext context, int i) => Dismissible(
                  key: ValueKey(cart.items.values.toList()[i].id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    cart.removeItem(
                      cart.items.keys.toList()[i],
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: FittedBox(
                            child: Text(cart.items.values.toList()[i].name[0])),
                      ),
                      title: Text(cart.items.values.toList()[i].name),
                      subtitle: Text(
                        'Total : ${cart.items.values.toList()[i].quantity} x ${cart.items.values.toList()[i].price} = Rs.${(cart.items.values.toList()[i].price * cart.items.values.toList()[i].quantity)}',
                        style: TextStyle(fontSize: 11),
                      ),
                      trailing: Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange[50]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove_circle_outline),
                                  color: Colors.deepOrange,
                                  iconSize: 20,
                                ),
                              ),
                            ),
                            Text("${cart.items.values.toList()[i].quantity}"),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline),
                                  color: Colors.deepOrange,
                                  iconSize: 20,
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
            )
          ],
        ) : Center(child:Text("Aren't you hungry ?\nAdd some food to cart."))
      );
    });
  }
}

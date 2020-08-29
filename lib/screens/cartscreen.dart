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
        body: Column(
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
                        child: FittedBox(child: Text('S')),
                      ),
                      title: Text(cart.items.values.toList()[i].name),
                      subtitle: Text(
                          'Total: \$${(cart.items.values.toList()[i].price * cart.items.values.toList()[i].quantity)}'),
                      trailing:
                          Text('${cart.items.values.toList()[i].quantity} x'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

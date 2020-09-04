import 'package:flutter/material.dart';
import 'package:foodie/controller/cartcontroller.dart';
import 'package:provider/provider.dart';

class CartPdt extends StatelessWidget {
  final String id;
  final String productId;
  // final String image;
  final double price;
  final int quantity;
  final String name;

  CartPdt(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.name,
  );
  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, cart, child) {
      return Dismissible(
        key: ValueKey(id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direction) {
          cart.removeItem(productId);
        },
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text('Rs.$price')),
            ),
            title: Text(name),
            subtitle: Text('Total:Rs.${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      );
    });
  }
}

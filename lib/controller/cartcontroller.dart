import 'package:flutter/cupertino.dart';
import 'package:foodie/models/models.dart';

class CartController extends ChangeNotifier {
  Map<String, CartItem> _cartitems = {};

  Map<String, CartItem> get items {
    return {..._cartitems};
  }

  void addItem(String pdtid, String name, double price, String image) {
    if (_cartitems.containsKey(pdtid)) {
      _cartitems.update(
          pdtid,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity + 1,
              image: existingCartItem.image,
              price: existingCartItem.price));
    } else {
      _cartitems.putIfAbsent(
          pdtid,
          () => CartItem(
              name: name,
              id: DateTime.now().toString(),
              quantity: 1,
              price: price,
              image: image));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _cartitems.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_cartitems.containsKey(id)) {
      return;
    }
    if (_cartitems[id].quantity > 1) {
      _cartitems.update(
          id,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              image: existingCartItem.image,
              price: existingCartItem.price));
    }
    notifyListeners();
  }

  int get count {
    return _cartitems.length;
  }

  double get totalAmount {
    var total = 0.0;
    _cartitems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _cartitems = {};
    notifyListeners();
  }
}

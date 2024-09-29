import 'package:brewly/domain/coffee_model.dart';
import 'package:flutter/material.dart';

class ShoppingCart with ChangeNotifier {
  static final ShoppingCart _instance = ShoppingCart._internal();

  factory ShoppingCart() {
    return _instance;
  }

  ShoppingCart._internal();

  List<CoffeeItem> orderedItems = [];

  // Function to add an item or increase its quantity
  void addItem(CoffeeItem item) {
    int index =
    orderedItems.indexWhere((element) => element.name == item.name);

    if (index >= 0) {
      // Item already in cart, increase quantity
      orderedItems[index].quantity++;
    } else {
      // Item not in cart, add it with the default quantity
      orderedItems.add(item);
    }

    notifyListeners();
  }

  // Function to decrease the quantity of an item
  void lessItem(CoffeeItem item) {
    int index =
    orderedItems.indexWhere((element) => element.name == item.name);

    if (index >= 0) {
      if (orderedItems[index].quantity > 1) {
        // Decrease the quantity
        orderedItems[index].quantity--;
      } else {
        // If quantity is 1, remove the item from the cart
        orderedItems.removeAt(index);
      }

      notifyListeners();
    }
  }

  // Get the total price of items in the cart
  double get totalCartPrice {
    return orderedItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  // Get the total quantity of items in the cart
  int get totalItems {
    return orderedItems.fold(0, (sum, item) => sum + item.quantity);
  }
}

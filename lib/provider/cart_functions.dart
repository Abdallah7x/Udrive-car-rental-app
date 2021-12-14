import 'package:drive/model/data.dart';
import 'package:flutter/material.dart';
import 'package:drive/pages/item.dart';
import 'package:flutter/foundation.dart';
class CartProvider extends ChangeNotifier {
   List<Item> _items = [];



  double _totalPrice = 0.0;

  // get name => null;

  void add(Item items) {
    _items.add(items);
    _totalPrice += items.pPromotionPrice;
    notifyListeners();
  }

  void remove(Item items) {
    _totalPrice -= items.pPromotionPrice;
    _items.remove(items);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Item> get basketItems {
    return _items;
  }
}

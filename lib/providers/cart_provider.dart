import 'package:flutter/material.dart';
import 'package:project_one/models/special.dart';

class CartProvider extends ChangeNotifier {
  final List<Special> _items = [];

  List<Special> get items => _items;

  void addItem(Special item) {
    _items.add(item);
    notifyListeners();
  }

  void increaseQuantity(int productId) {
    final index = _items.indexWhere((value) => value.id == productId);

    if (index != -1) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decreasedQuantity(int productId) {
    final index = _items.indexWhere((value) => value.id == productId);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
        notifyListeners();
      } else {
        (_items.removeAt(index));
      }
      notifyListeners();
    }
  }

  void removeItem(Special item) {
    _items.remove(item);
    notifyListeners();
  }
}

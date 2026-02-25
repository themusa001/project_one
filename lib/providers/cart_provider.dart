import 'package:flutter/material.dart';
import 'package:project_one/models/special.dart';

class CartProvider extends ChangeNotifier {
  final List<Special> _items = [];

  List<Special> get items => _items;

  void addItem(Special item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Special item) {
    _items.remove(item);
    notifyListeners();
  }
}

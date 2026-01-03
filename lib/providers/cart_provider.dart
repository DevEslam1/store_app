import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<ProductModel> _items = [];

  List<ProductModel> get items => _items;

  void add(ProductModel item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(ProductModel item) {
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }
}

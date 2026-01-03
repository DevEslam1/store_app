import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';

class FavoriteProvider with ChangeNotifier {
  final List<ProductModel> _items = [];

  List<ProductModel> get items => _items;

  bool isFavorite(ProductModel product) {
    return _items.contains(product);
  }

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      _items.remove(product);
    } else {
      _items.add(product);
    }
    notifyListeners();
  }
}

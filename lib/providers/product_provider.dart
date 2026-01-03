import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _products = await AllProductsService().getAllProducts();
    } catch (e) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }
}

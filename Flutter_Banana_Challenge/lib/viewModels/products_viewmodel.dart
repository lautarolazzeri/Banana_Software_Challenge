import 'dart:async';

import 'package:app/models/product_model.dart';
import 'package:app/service/products_service.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService productService = ProductService();
  List<ProductModel> allProducts = [];
  bool loading = false;
  String query = '';
  Timer? debounce;

  Future<void> getAllProducts() async {
    loading = true;
    allProducts = await productService.getAllProducts();
    loading = false;
    notifyListeners();
  }
}

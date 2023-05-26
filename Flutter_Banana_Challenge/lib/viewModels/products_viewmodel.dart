import 'dart:async';

import 'package:app/models/product_model.dart';
import 'package:app/service/products_service.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService productService = ProductService();
  List<ProductModel> allProducts = [];
  bool loading = false;

  Future<void> getAllProducts() async {
    loading = true;
    allProducts = await productService.getAllProducts();
    loading = false;
    notifyListeners();
  }

  //Search
  String query = '';
  Timer? debounce;
  List<ProductModel> searchResult = [];

  Future<void> searchByProduct(String query) async {
    if (this.query != query) {
      this.query = query;

      //debounce for 500ms
      EasyDebounce.debounce(
        'searchProducts',
        const Duration(milliseconds: 500),
        () async {
          //una vez que se cumple el tiempo de debounce, se ejecuta la busqueda
          searchResult = await productService.searchAnyProduct(query);
          notifyListeners();
        },
      );
    }
  }


}

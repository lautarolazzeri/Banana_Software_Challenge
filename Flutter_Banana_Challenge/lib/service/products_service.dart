import 'dart:developer';

import 'package:app/constants/constants.dart';
import 'package:app/models/product_model.dart';

class ProductService {
  //get all products from api
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await dio.get('$api/products');
      final List allproducts = response.data['products'] as List;
      final List<ProductModel> products =
          allproducts.map((prod) => ProductModel.fromJson(prod)).toList();
      return products;
    } catch (e) {
      // print(e.toString());   Avoid print calls in production
      log(e.toString());
      return [];
    }
  }

Future<List<ProductModel>> searchAnyProduct(String query) async {
    try {
      final response = await dio.get('$api/products/search?q=$query');
      final List allproducts = response.data['products'] as List;
      final List<ProductModel> products =
          allproducts.map((prod) => ProductModel.fromJson(prod)).toList();
      return products;
    } catch (e) {
      // print(e.toString());   Avoid print calls in production
      log(e.toString());
      return [];
    }
  }




}

import 'dart:developer';

import 'package:app/constants/constants.dart';
import 'package:app/models/product_model.dart';

class ProductService {
  //get all products from api
  //es una funcion que devuelve una lista de ProductModel
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


  //search products by query
Future<List<ProductModel>> searchAnyProduct(String query) async {
    try {
      //la response devuelve los productos que coinciden con la query
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

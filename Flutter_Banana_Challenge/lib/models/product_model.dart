import 'dart:convert';

ProductModel productModelFromMap(String str) => ProductModel.fromMap(json.decode(str));

String productModelToMap(ProductModel data) => json.encode(data.toMap());

class ProductModel {
  final int id;
  final String title;
  final String brand;
  final String description;
  final int price;
  final int stock;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.description,
    required this.price,
    required this.stock,
    required this.images,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        brand: json["brand"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "brand": brand,
        "description": description,
        "price": price,
        "stock": stock,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

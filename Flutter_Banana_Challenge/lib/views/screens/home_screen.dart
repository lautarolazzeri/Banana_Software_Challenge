import 'package:app/constants/constants.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final String brand;
  final String description;
  final double price;
  final int stock;
  final String image;

  Product({
    required this.image,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.stock,
  });
}

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Producto 1',
      brand: 'Marca 1',
      description: 'Descripción del producto 1',
      price: 19.99,
      stock: 10,
      image: 'assets/product1.jpg',
    ),
    Product(
      name: 'Producto 1',
      brand: 'Marca 1',
      description: 'Descripción del producto 1',
      price: 19.99,
      stock: 10,
      image: 'assets/product1.jpg',
    ),
    Product(
      name: 'Producto 1',
      brand: 'Marca 1',
      description: 'Descripción del producto 1',
      price: 19.99,
      stock: 10,
      image: 'assets/product1.jpg',
    ),
    Product(
      name: 'Producto 1',
      brand: 'Marca 1',
      description: 'Descripción del producto 1',
      price: 19.99,
      stock: 10,
      image: 'assets/product1.jpg',
    ),
    Product(
      name: 'Producto 1',
      brand: 'Marca 1',
      description: 'Descripción del producto 1',
      price: 19.99,
      stock: 10,
      image: 'assets/product1.jpg',
    ),
    Product(
      name: 'Producto 1',
      brand: 'Marca 1',
      description: 'Descripción del producto 1',
      price: 19.99,
      stock: 10,
      image: 'assets/product1.jpg',
    ),
    Product(
        name: 'jjvjvkvvmnmnvvhvjhcvjyfgcgcg',
        brand: 'Marca 2',
        description:
            'Descripción del producto 2 Descripción del producto 2Descripción del producto 2Descripción del producto 2',
        price: 29.99,
        stock: 5,
        image: 'assets/product2.jpg'),
    Product(
        name: 'Producto 3',
        brand: 'Marca 3',
        description: 'Descripción del producto 3',
        price: 39.99,
        stock: 3,
        image: 'assets/product1.jpg'),
  ];

  HomeScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Flutter Challenge 2023',
          style: TextStyle(color: white),
        ),
        backgroundColor: appColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchInput(),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return SingleProduct(
                  product: product,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

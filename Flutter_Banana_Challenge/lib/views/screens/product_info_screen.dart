import 'package:app/constants/constants.dart';
import 'package:app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo({super.key});

  //page controller
  final PageController _pageController = PageController(initialPage: 0);

  //indicator
  final int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    final priceWithFormat = NumberFormat.currency(
      decimalDigits: 2,
      symbol: '\$',
    ).format(product.price);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Banana Software',
            style: TextStyle(color: appColor),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              //slider product images
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: product.images.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        product.images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              //product info
              ProductDescription(product: product, priceWithFormat: priceWithFormat),

              //add to cart button
              Container(
                width: double.infinity,
                height: 50.0,
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón "Agregar al carrito"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, color: white),
                      SizedBox(width: 8.0),
                      Text('Agregar al carrito', style: TextStyle(fontSize: 18.0, color: white)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
    required this.priceWithFormat,
  });

  final ProductModel product;
  final String priceWithFormat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          product.brand,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        const Text('Descripción',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            )),
        const SizedBox(height: 8),
        Text(
          product.description,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'USD$priceWithFormat',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Stock: ${product.stock}',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

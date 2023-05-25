import 'package:app/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  final product = (
    name: 'Producto 1',
    brand: 'Marca 1',
    description:
        'Descripción del producto 1Descripción del producto 1Descripción del producto 1Descripción del producto 1Descripción del producto 1Descripción del producto 1Descripción del producto 1Descripción del producto 1Descripción del producto 1',
    price: 19.99,
    stock: 10,
    images: [
      'assets/product1.jpg',
      'assets/product2.jpg',
      'assets/product1.jpg',
      'assets/product2.jpg',
    ]
  );

  //page controller
  final PageController _pageController = PageController(initialPage: 0);

  //indicator
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    //change active indicator
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            product.name,
            style: const TextStyle(color: appColor),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      product.images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
            const SizedBox(height: 24),

            //product info
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    product.brand,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
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
                    'USD${product.price}',
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
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < product.images.length; i++) {
      indicators.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? appColor : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}

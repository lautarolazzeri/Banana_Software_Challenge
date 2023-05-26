import 'package:app/constants/constants.dart';
import 'package:app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  //page controller
  final PageController _pageController = PageController(initialPage: 0);

  //indicator
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      //change the indicator when the page change
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    //get product
    final ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    //formatear el precio para que salga con .00
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
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.92,
              height: MediaQuery.of(context).size.height * 0.3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: FadeInImage(
                        placeholder: const AssetImage('assets/loading.gif'),
                        placeholderFit: BoxFit.none,
                        image: NetworkImage(
                          product.images[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(product),
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
                    product.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.brand,
                    style: const TextStyle(fontSize: 18, color: grey),
                  ),
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
              ),
            ),

            //botón agregar al carrito
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

  List<Widget> _buildIndicator(ProductModel product) {
    List<Widget> indicators = [];
    for (int i = 0; i < product.images.length; i++) {
      indicators.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? appColor : grey,
          ),
        ),
      );
    }
    return indicators;
  }
}

import 'package:app/constants/constants.dart';
import 'package:app/views/screens/screens.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final Product product;
  const SingleProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                //todo change asset to network image
                image: AssetImage(product.image),
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(product.brand,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        )),
                    const SizedBox(height: 2),
                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'USD${product.price}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: appColor),
                    ),
                    const SizedBox(height: 2),
                    Text('Stock: ${product.stock}'),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

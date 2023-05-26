import 'package:app/constants/constants.dart';
import 'package:app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleProduct extends StatelessWidget {
  final ProductModel product;
const SingleProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final priceWithFormat = NumberFormat.currency(
      decimalDigits: 2,
      symbol: '\$',
    ).format(product.price);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'product-info', arguments: product),
      child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: grey,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
            color: white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: NetworkImage(product.images[0]),
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
                      Text(product.title,
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
                            color: grey,
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
                        'USD$priceWithFormat',
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
          )),
    );
  }
}

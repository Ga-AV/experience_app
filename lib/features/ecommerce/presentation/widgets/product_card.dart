import 'package:experience_app/features/ecommerce/presentation/view/product_detail_view.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 20),
          width: 170,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F8),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  product.image,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12),
              Text(product.name),
              SizedBox(height: 4),
              Text(
                '€ ${product.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductDetailView(product: product),
          ),
        );
      },
    );
  }
}

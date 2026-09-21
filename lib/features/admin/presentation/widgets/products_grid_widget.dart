import 'package:experience_app/features/admin/domain/entities/product_admin.dart';
import 'package:experience_app/features/admin/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

class ProductsGridWidget extends StatelessWidget {
  final List<ProductAdmin> products;

  const ProductsGridWidget(this.products,{super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
      gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        mainAxisExtent: 180,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: products.length,
      itemBuilder: (_, index) {
        return ProductCardWidget(products[index]);
      },
    );
  }
}
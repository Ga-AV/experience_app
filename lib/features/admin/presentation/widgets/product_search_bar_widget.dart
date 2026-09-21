import 'package:flutter/material.dart';

class ProductSearchBarWidget extends StatelessWidget {
  const ProductSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Search products...",
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}

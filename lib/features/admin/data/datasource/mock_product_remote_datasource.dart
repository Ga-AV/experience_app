import 'package:experience_app/features/admin/data/datasource/product_admin_remote_datasource.dart';
import 'package:experience_app/features/admin/data/models/product_admin_model.dart';
import 'package:flutter/material.dart';

class MockProductRemoteDataSource implements ProductRemoteDataSource {
  final List<ProductAdminModel> _products = [
    ProductAdminModel(
      id: "1",
      name: "Nike Air Max",
      description: "Running Shoes",
      price: 120,
      size: "M",
      colorValue: Colors.black.value,
      imageUrl: null,
    ),

    ProductAdminModel(
      id: "2",
      name: "Adidas Hoodie",
      description: "Casual Wear",
      price: 60,
      size: "L",
      colorValue: Colors.blue.value,
      imageUrl: null,
    ),
  ];

  @override
  Future<List<ProductAdminModel>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return _products;
  }

  @override
  Future<void> addProduct(ProductAdminModel product) async {
    _products.add(product);
  }

  @override
  Future<void> updateProduct(ProductAdminModel product) async {
    final index = _products.indexWhere((e) => e.id == product.id);

    _products[index] = product;
  }

  @override
  Future<void> deleteProduct(String id) async {
    _products.removeWhere((e) => e.id == id);
  }
}
